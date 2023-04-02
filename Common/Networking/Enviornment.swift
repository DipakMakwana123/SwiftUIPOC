//
//  Enviornment.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 26/03/23.
//

import Foundation

enum Environment: Int {
    case production = 0
    case staging = 1

    static var current: Environment {
        get {
            #if STAGING
            return .staging
            #endif

            #if DEBUG
            if let current = Environment(rawValue: Defaults.shared.int(forKey: Constants.Defaults.Keys.env)) {
                return current
            }
            #endif

            return .production
        }
        set {
            Defaults.shared.set(int: newValue.rawValue, forKey: Constants.Defaults.Keys.env)
        }
    }
}
