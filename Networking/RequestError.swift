
import Foundation

struct RequestError: Error, CustomStringConvertible {
    
    // MARK: - Properties
    var requestTimestamp: Date?
    var statusCode: Int?
    var message: String?
    var json: Any?
    var response : HTTPURLResponse?
    var description: String {
        var description = ""
        if let statusCode = statusCode { description += "Status code: \(statusCode)" }
        if let json = json { description += "\nBody:\n\(json)" }
        if let message = message { description += description.isEmpty ? "\(message)" : ", \(message)" }
        return description
    }
    
    var errorIdentifier: String {
        if let urlLastElement = response?.url?.lastPathComponent.lowercased().removingMatrixParams() {
            if let errorCode = Constants.ErrorReport.urlLookup[urlLastElement] {
                return errorCode
            }
        }
        return ""
    }
    
    //MARK: Now Mobile
    var errorCode: Int? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.NowMobile.Errors.Keys.errorCode] as? Int
        }
        return nil
    }
    
    var irdetoErrorCode: Int? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.IrdetoControl.Error.Keys.code] as? Int
        }
        return nil
    }
    
    var reason: String? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.NowMobile.Errors.Keys.errorReason] as? String
        }
        return nil
    }
    
    var errorMessage: String? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.NowMobile.Errors.Keys.errorMessage] as? String
        }
        return nil
    }
    
    var errorType: String? {
        if let json = json as? [AnyHashable: Any], let type = json[API.NowMobile.Errors.Keys.errorType] as? String {
            if let url = URL(string: type) {
                return url.lastPathComponent
            }
        }
        return nil
    }
    
    var isConcurrencyLimit: Bool {
        return (statusCode == 403 && irdetoErrorCode == API.IrdetoControl.Error.Values.concurrency)
    }
    
    var isDeviceRegistrationLimit: Bool {
        return errorType == API.NowMobile.Errors.Types.deviceRegistrationLimit
    }
    
    var isGeoBlockingUser:Bool {
        return errorType == API.NowMobile.Errors.Types.geoBlockingUserMessage
    }
    
    var isDeviceRegisteredToOtherUser: Bool {
        return false
    }
    
    var isOutsideMcaTerritories: Bool {
        return false
    }
    
    // MARK: Dstv_Now
    var type: String? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.DstvNow.Errors.Keys.type] as? String
        }
        return nil
    }
    var title: String? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.DstvNow.Errors.Keys.title] as? String
        }
        return nil
    }
    var status: Int? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.DstvNow.Errors.Keys.status] as? Int
        }
        return nil
    }
    var detail: String? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.DstvNow.Errors.Keys.detail] as? String
        }
        return nil
    }
    var instance: String? {
        if let json = json as? [AnyHashable: Any] {
            return json[API.DstvNow.Errors.Keys.instance] as? String
        }
        return nil
    }

    let responseTimestamp = Date()
    
    // MARK: - Lifecycle
    
    init(statusCode: Int, json: Any? = nil, response : HTTPURLResponse? = nil, requestTimestamp : Date? = nil) {
        self.statusCode = statusCode
        self.json = json
        self.response = response
        self.requestTimestamp = requestTimestamp
    }
}

extension RequestError: ErrorReport {
    var url : String {
        if let urlString = response?.url?.absoluteString {
            return urlString
        }
        return ""
    }
    
    var responseCode: String {
        return "\(statusCode ?? 0)"
    }
    
    var responseDuration : Int {
        guard requestTimestamp != nil, responseTimestamp > requestTimestamp!
        else {
            return 0
        }
        return Int(responseTimestamp.timeIntervalSince(requestTimestamp!) * 1000)
    }
}
