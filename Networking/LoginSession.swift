
import Foundation

class LoginSession {
    var authToken: AuthToken? {
        get {
            if let dictionary = defaults.dictionary(forKey: Constants.Defaults.Keys.accessToken) {
                return AuthToken(json: dictionary)
            }
            return nil
        }
        set {
            if let newValue = newValue {
                let dictionary = newValue.dictionary
                defaults.set(dictionary: dictionary, forKey: Constants.Defaults.Keys.accessToken)
            } else {
                defaults.removeValue(forKey: Constants.Defaults.Keys.accessToken)
            }
        }
    }
    
    var accessToken: String? {
        return authToken?.accessToken
    }
    
    var jwt: String? {
        return authToken?.idToken
    }
    
    var base36Id: String? {
        return authToken?.trackingId
    }
    
    var isLoggedIn: Bool {
        return accessToken != nil
    }
    
    private var defaults: Defaults
    
    init(defaults: Defaults = Defaults.shared) {
        self.defaults = defaults
    }
    
    func refreshAccessToken(success: @escaping () -> Void, failure: @escaping (Error?) -> Void) {
        AccessTokenApiClient().refresh(completion: { accessToken in
            if let idToken = accessToken.idToken, let accessToken = accessToken.accessToken {
                let json: [AnyHashable : Any] = [API.AccessToken.Body.Keys.idToken: idToken,
                                                 API.AccessToken.Body.Keys.accessToken: accessToken,
                                                 API.AccessToken.Body.Keys.trackingId: LoginSession().base36Id ?? ""]
                LoginSession().authToken = AuthToken(json: json)
            }
            
            success()
        }, failure: { error in
            failure(error)
        })
    }
    
    func logout() {
        authToken = nil
    }
}
