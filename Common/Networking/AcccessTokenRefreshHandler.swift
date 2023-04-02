//
//  AcccessTokenRefreshHandler.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 26/03/23.
//

import Foundation
class AcccessTokenRefreshHandler {

    // MARK: - Shared Instance

    static var shared = AcccessTokenRefreshHandler()

    // MARK: - Properties

    private let accessTokenRefreshQueue = DispatchQueue.global(qos: .userInitiated)
    private let semaphore = DispatchSemaphore(value: 1)
    private var skipAccessTokenRefresh = false
    private var isAccessTokenRefreshSuccessful = false
    private var accessTokenRefreshQueueCounter = 0

    // MARK: - Operations

    func refreshAccessToken(success: @escaping () -> Void, failure: @escaping (Error?) -> Void) {
        self.resetRefreshAccessTokenProcess()
        self.accessTokenRefreshQueueCounter += 1
        accessTokenRefreshQueue.async {
            self.semaphore.wait()
            if !self.skipAccessTokenRefresh {
                self.refreshAccessTokenWithRetry(count: 3, success: success, failure: failure)
                self.accessTokenRefreshQueueCounter -= 1
            } else {
                if self.isAccessTokenRefreshSuccessful {
                    success()
                }
                self.accessTokenRefreshQueueCounter -= 1
                self.resetRefreshAccessTokenProcess()
                self.semaphore.signal()
            }
        }
    }

    private func resetRefreshAccessTokenProcess() {
        if self.accessTokenRefreshQueueCounter == 0 {
            self.skipAccessTokenRefresh = false
            self.isAccessTokenRefreshSuccessful = false
        }
    }

    private func refreshAccessTokenWithRetry(count: Int, success: @escaping () -> Void, failure: @escaping (Error?) -> Void) {
        LoginSession().refreshAccessToken(success: {
            success()
            self.skipAccessTokenRefresh = true
            self.isAccessTokenRefreshSuccessful = true
            self.semaphore.signal()
        }, failure: { error in
            if error == nil || (error as? RequestError)?.statusCode == 401 {
                SegmentLogOutReporter().reportUserLoggedOut(with: error)
                self.skipAccessTokenRefresh = true
                self.handleLogout()
                self.semaphore.signal()
            } else {
                if count >= 1 {
                    self.refreshAccessTokenWithRetry(count: count - 1, success: success, failure: failure)
                } else {
                    failure(error)
                    self.skipAccessTokenRefresh = true
                    self.isAccessTokenRefreshSuccessful = false
                    self.semaphore.signal()
                }
            }
        })
    }

    private func handleLogout() {
        #if os(iOS)
        postUserLoggedOutNotification()
        LoginHandler.shared.logout()
        #else
        Defaults.shared.removeValue(forKey: Constants.Defaults.Keys.AppLockPin)
        #endif
        LoginSession().logout()
        ProfileManager().selectedProfile = nil
        self.presentLogin()
    }

    private func presentLogin() {
        DispatchQueue.main.async {
            #if os(iOS)
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
            }

            guard let window = appDelegate.window else {
                return
            }

            UIWindow.transition(with: window, duration: 0.2, options: .transitionCrossDissolve, animations: {
                appDelegate.displayLogin()
            }, completion: nil)
            #else
            (UIApplication.shared.delegate as? AppDelegate)?.resetWindow()
            #endif
        }
    }

    private func postUserLoggedOutNotification() {
        DispatchQueue.main.async {
            let name = Notification.Name(rawValue: "UserLoggedOut")
            NotificationCenter.default.post(name: name, object: nil)
        }
    }
}
