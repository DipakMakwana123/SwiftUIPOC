
import Foundation
import RxSwift


/*class ApiClient {
    
    // MARK: - Properties
    
    var session: URLSession
    
    // MARK: Lifecycle
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.httpAdditionalHeaders = [
            API.Headers.Keys.accept: API.Headers.Values.applicationJson,
            API.Headers.Keys.contentType: API.Headers.Values.applicationJson
        ]
        session = URLSession(configuration: configuration)
    }
    
    // MARK: - Operations
    func dataTask(request: URLRequest, caller: String) -> Observable<Any?> {
        return rawDataTask(request: request, caller: caller).map { response -> Any? in
            if let data = response as? (Data?, URLResponse?), let json = data.0?.json {
#if os(iOS)
                NetworkLogger.shared.logToFile(request: request.description, response: "\(json)")
                #endif
                return json
            }
            return nil
        }
    }
    
    func send<T: Decodable>(request: URLRequest, decodableType: T.Type, caller: String) -> Observable<T?> {
        return rawDataTask(request: request, caller: caller).map { response -> T? in
            guard let response = response as? (Data?, URLResponse?), let data = response.0 else { return nil }
#if os(iOS)
            NetworkLogger.shared.logToFile(request: request.description, response: "\(try JSONDecoder().decode(T.self, from: data))")
            #endif
            return try JSONDecoder().decode(T.self, from: data)
        }
    }
    
    func rawDataTask(request: URLRequest, caller: String) -> Observable<Any?> {
        return Observable<Any?>.create({ observer -> Disposable in
            
            if let validUrl = request.url?.absoluteString, let mockData = MockManager.shared.loadMockData(endpoint: validUrl) {
                if let error = mockData.0 {
                    observer.onError(error)
                } else {
                    let response: (Data?, URLResponse?) = (mockData.1, nil)
                    observer.onNext(response)
                    observer.onCompleted()
                }
                return Disposables.create()
            } else {
                let dataTask = self.dataTaskCreate(with: request, observer: observer, caller: caller, sessionRefreshHandler: true)
                dataTask.resume()
                return Disposables.create {
                    dataTask.cancel()
                }
            }
        })
    }
    
    private func dataTaskCreate(with request: URLRequest, observer: RxSwift.AnyObserver<Any?>, caller: String, sessionRefreshHandler: Bool? = false) -> URLSessionDataTask {
        let requestTimestamp = Date()
        let dataTask = self.session.dataTask(with: request, completionHandler: { (data, response, error) in
            if let error = error {
                observer.onError(error)
            } else {
                let response = response as! HTTPURLResponse
                let reportingHandler = APIClientReportingHandler(responseData: data, urlRequest: request, urlResponse: response, apiCaller: caller)
                reportingHandler.initiateReporting()
                
                if 200 ... 299 ~= response.statusCode {
                    observer.onNext((data, response))
                    observer.onCompleted()
                } else if sessionRefreshHandler == true && response.statusCode == 401 {
                    AcccessTokenRefreshHandler.shared.refreshAccessToken(success: { [weak self] in
                        guard let self = self else { return }
                        if let sessionId = LoginSession().accessToken {
                            var newRequest = request
                            newRequest.setValue(sessionId, forHTTPHeaderField: API.Headers.Keys.authorization)
                            let retryDataTask = self.dataTaskCreate(with: newRequest, observer: observer, caller: caller, sessionRefreshHandler: false)
                            retryDataTask.resume()
                        }
                    }, failure: { error in
                        if let error = error as? RequestError {
                            observer.onError(error)
                        } else {
                            let requestError = RequestError(statusCode: response.statusCode, json: data?.json, response: response, requestTimestamp: requestTimestamp)
                            observer.onError(requestError)
                        }
                    })
                } else {
#if os(iOS)
                    NetworkLogger.shared.logToFile(request: request.description, response: "\(String(describing: data?.json))")
                    #endif
                    let requestError = RequestError(statusCode: response.statusCode, json: data?.json, response: response, requestTimestamp: requestTimestamp)
                    observer.onError(requestError)
                }
            }
        })
        return dataTask
    }
}
*/
