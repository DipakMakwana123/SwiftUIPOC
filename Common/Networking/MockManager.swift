import Foundation

class MockManager {
    
    static let shared = MockManager()
    
    let arguments = ProcessInfo.processInfo.arguments
    let mockedUser = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "mockedLoginSession", ofType: "plist")!) as! [String: String]
    var isUIMock: Bool {
        get {
            return arguments.contains("UIMOCK")
        }
    }
    
    func replaceMockTime(input: String?) -> String? {
        if let validString = input {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'000Z'"
            return validString.replacingOccurrences(of: "{currentTime}", with: dateFormatter.string(from: Date()))
        } else {
            return nil
        }
    }
    
    
    func readLocalFile(forName name: String) -> (RequestError?, Data)? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonString = try replaceMockTime(input: String(contentsOfFile: bundlePath)) {
                
                if let jsonData = jsonString.data(using: .utf8) {
                    if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                                            if let errorCode = json["errorCode"] as? String {
                                                    let requestError = RequestError(statusCode: Int(errorCode)!, json: json)
                                                    return (requestError, jsonData)
                                                }
                                            }
                    return (nil, jsonData)
                }
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func endpointsTranslator(partial: String) -> String {
        if partial.contains("https://") {
            return partial
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            var finalEndpoint = partial.replacingOccurrences(of: "(base)", with: API.NowMobile.URL.base)
            finalEndpoint = finalEndpoint.replacingOccurrences(of:"(version)", with: "v\(API.NowMobile.version)")
            finalEndpoint = finalEndpoint.replacingOccurrences(of:"(time)", with: dateFormatter.string(from: Date()))
            return finalEndpoint
        }
    }
    
    func endpointsGenerator(endpoints: [String:String] ) -> [String:String] {
        var translatedEndpoints : [String:String] = [:]
        
        for key in endpoints.keys {
            translatedEndpoints[(endpointsTranslator(partial: key))] = endpoints[key]
        }
        
        return translatedEndpoints
    }
    
    func loadMockData(endpoint: String) -> (RequestError?, Data)? {
        if !isUIMock {
           return nil
        }
        
        let mockManager = MockManager.shared
        let positiveEndpoints = endpointsGenerator(endpoints: MockServiceList.positiveMockedData)
        let negativeEndpoints = endpointsGenerator(endpoints: MockServiceList.negativeMockedData)
        let testCaseEndpoint : String? =  arguments.count == 3 ? endpointsTranslator(partial:arguments[2]) : nil
        
        
        if let validTestCaseEndpoints = testCaseEndpoint, negativeEndpoints.keys.contains(endpoint), validTestCaseEndpoints == endpoint {
            return mockManager.readLocalFile(forName:negativeEndpoints[endpoint]!)
        } else {
            if positiveEndpoints.keys.contains(endpoint) {
                return mockManager.readLocalFile(forName:positiveEndpoints[endpoint]!)
            }
        }
        
        
        return nil
    }
}

struct MockServiceList {
    
    static let negativeMockedData = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "mockEndpoints", ofType: "plist")!)!["negative"] as! [String: String]
    static let positiveMockedData = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "mockEndpoints", ofType: "plist")!)!["positive"] as! [String: String]

}
