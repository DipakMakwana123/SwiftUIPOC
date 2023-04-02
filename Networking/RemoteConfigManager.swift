
import Foundation

class RemoteConfigManager {
    static let shared = RemoteConfigManager()
    
    var refreshOnLoadTimeoutms: Int {
        if let value = flagValue(flagKey: API.RemoteConfig.Keys.refreshOnLoadTimeoutms) {
            return Int(value) ?? Int(API.RemoteConfig.DefaultValues.refreshOnLoadTimeoutms)
        }
        return Int(API.RemoteConfig.DefaultValues.refreshOnLoadTimeoutms)
    }
    
    var isWaterMarkingEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.waterMarking)
    }
    
    var playerPopupConfiguration: PlayerPopupConfiguration? {
        if let playerPopupConfigurationPayload = flagPayload(flagKey: API.RemoteConfig.Keys.playerPopupConfiguration) {
            return PlayerPopupConfiguration(json: playerPopupConfigurationPayload)
        }
        return nil
    }
    
    var isContinueWatchingEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.continueWatching)
    }
       
    var continueWatchingRefreshDelay: Int {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.continueWatching)?["delay"] {
            return Int(value) ?? 100
        }
        return 100
    }
    
    // MARK: - Properties
    var remoteLoggingEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.remoteLogging)
    }
    
    var isAutoPlayNextEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.autoPlayEnabled)
    }
    
    var remoteLoggingLength: Int {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.remoteLogging)?["length"] {
            return Int(value) ?? 1500
        }
        return 1500
    }
    
    var autoPlayNextOverlayPercentage: Double {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.autoPlayEnabled)?["overlay_display_percentage"] {
            return Double(value) ?? 98.6
        }
        return 98.6
    }
    
    var isAutoPlayNextTimer: Int {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.autoPlayEnabled)?["countdown"] {
            return Int(value) ?? 10
        }
        return 10
    }
    
    var autoPlayNextPayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.autoPlayEnabled)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var skipAdsForBookmark: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.skipAdsForBookmark)
    }
    
    var watchButtonRefreshDelay: Int {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.watchButtonEnabled)?["delay"] {
            return Int(value) ?? 1000
        }
        return 1000
    }
    
    var watchButtonPayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.watchButtonEnabled)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var isRemoteLogoutEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.remoteLogoutEnabled)
    }
    
    var isNotificationCenterEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.notificationCenterEnabled)
    }
    
    var isTouchPeekEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.touchPeekEnabled)
    }
    
    var isAppShortcutsEnabled:Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.appShortcuts)
    }
    
    var isReportButtonClicksEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.reportButtonClicksEnabled)
    }
    
    var isSegmentErrorLoggingEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.segmentErrorLoggingEnabled)
    }
    
    var isDetailedDebugEnabledEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.detailedDebugEnabled)
    }
    
    var isFullNetworkLogEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.fullNetworkLogEnabled)
    }
    
    var fullNetworkLogResponseBodyCap: Int {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.fullNetworkLogEnabled)?["responseBodyCap"] {
            return Int(value) ?? 1000
        }
        return 1000
    }
    
    var isShareEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.shareEnabled)
    }
    
    var isPictureInPictureEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.pictureInPictureEnabled)
    }
    
    var isPlayerGestureControlsEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.playerGestureControlEnabled)
    }
    
    var isLeanbackLoginEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.mobileTvOtp)
    }
    
    var playerSkipTime: Double {
        if let value = flagValue(flagKey: API.RemoteConfig.Keys.playerSkipTime) {
            return Double(value) ?? Double(API.RemoteConfig.DefaultValues.playerSkipTime)
        }
        return Double(API.RemoteConfig.DefaultValues.playerSkipTime)
    }
    
    var sentrySampleRate: Double {
        if let value = flagValue(flagKey: API.RemoteConfig.Keys.sentrySampleRate) {
            return Double(value) ?? Double(API.RemoteConfig.DefaultValues.sentrySampleRateDefaultValue)!
        }
        return Double(API.RemoteConfig.DefaultValues.sentrySampleRateDefaultValue)!
    }
    
    var playerHeartbeatInterval: Double {
        if let value = flagValue(flagKey: API.RemoteConfig.Keys.playerHeartbeatInterval) {
            return Double(value) ?? Double(API.RemoteConfig.DefaultValues.playerHeartbeatInterval)
        }
        return Double(API.RemoteConfig.DefaultValues.playerHeartbeatInterval)
    }
    
    var appBackgroundGradientStart: String {
        return flagValue(flagKey: API.RemoteConfig.Keys.appBackgroundGradientStart) ?? API.RemoteConfig.DefaultValues.appBackgroundGradientStart
    }
    
    var appBackgroundGradientEnd: String {
        return flagValue(flagKey: API.RemoteConfig.Keys.appBackgroundGradientEnd) ?? API.RemoteConfig.DefaultValues.appBackgroundGradientEnd
    }
    
    var FAQsUrl: String {
        return flagValue(flagKey: API.RemoteConfig.Keys.FAQsUrl) ?? API.RemoteConfig.DefaultValues.FAQsUrl
    }
    
    var TACsUrl: String {
        return flagValue(flagKey: API.RemoteConfig.Keys.TACsUrl) ?? API.RemoteConfig.DefaultValues.TACsUrl
    }
    
    var homeEvent: String? {
        return flagValue(flagKey: API.RemoteConfig.Keys.homeEvent)
    }
    
    var current: RemoteConfigsResponse? {
        get {
            guard let data = defaults.data(forKey: Constants.Defaults.Keys.currentRemoteConfigs) else { return nil }
            return RemoteConfigsResponse(data: data)
        }
        
        set {
            guard let data = newValue?.data else { return }
            defaults.set(data: data, forKey: Constants.Defaults.Keys.currentRemoteConfigs)
        }
    }
    
    var isBitmovinAnalyticsEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.bitmovinAnalytics)
    }

    var concurrencyCheckIntervalSeconds: Int64 {
        if let seconds = flagValue(flagKey: API.RemoteConfig.Keys.concurrencyCheckIntervalSeconds) {
            return Int64(seconds) ?? API.RemoteConfig.DefaultValues.concurrencyCheckIntervalSeconds
        }
        return API.RemoteConfig.DefaultValues.concurrencyCheckIntervalSeconds
    }
    
    var videoQuality: Data? {
        if let videoQualityPayload = flagPayload(flagKey: API.RemoteConfig.Keys.videoQuality)?["items"] {
            return videoQualityPayload.data(using: .utf8) ?? nil
        }
        return nil
    }
    
    var shouldDisableTimeToRefresh: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.shouldDisableTimeToRefresh)
    }

    var isRemoteRecordingEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.remoteRecordingEnabled)
    }
    
    var isActionablePushNotificationEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.actionablePushNotificationEnabled)
    }
    
    var sentryResponseBodyLength: Int {
        if let value = flagValue(flagKey: API.RemoteConfig.Keys.sentryResponseBodyLength) {
            return Int(value) ?? Int(API.RemoteConfig.DefaultValues.sentryResponseBodyLength)
        }
        return Int(API.RemoteConfig.DefaultValues.sentryResponseBodyLength)
    }
    
    var actionablePushNotificationItems: Data? {
        if let actionablePushPayload = flagPayload(flagKey: API.RemoteConfig.Keys.actionablePushNotificationEnabled)?["items"] {
            return actionablePushPayload.data(using: .utf8) ?? nil
        }
        return nil
    }
    
    var versionStatus : status {
        if let value = flagValue(flagKey: API.RemoteConfig.Keys.versionStatus) {
            return status(rawValue: value) ?? status.current
        }
        return status.current
    }
    
    var versionPayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.versionStatus)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var isSentryEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.isSentryEnabled)
    }

    var genericMessagePayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.genericMessage)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var noInternetMessagePayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.noInternetMessage)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var geoBlockingMessagePayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.geoBlockingKey)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var mobileDataAlertPayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.mobileDataAlert)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var mobileDataDownloadAlertPayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.mobileDataDownloadAlert)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var deviceLimitMessagePayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.deviceLimitMessage)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var outputObscuredMessagePayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.outputObscuredMessage)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var irdetoControlLicenseDomain: String {
        switch Environment.current {
        case .production:
            if let value = flagPayload(flagKey: API.RemoteConfig.Keys.isIrdetoControlsEnabled)?["domain"] {
                return value
            }
            return API.RemoteConfig.DefaultValues.irdetoControlProdDomain
        case .staging:
            if let value = flagPayload(flagKey: API.RemoteConfig.Keys.isIrdetoControlsEnabled)?["domain_alpha"] {
                return value
            }
            return API.RemoteConfig.DefaultValues.irdetoControlStageDomain
        }
    }
    
    var irdetoControlSessionValidityBuffer: TimeInterval {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.isIrdetoControlsEnabled)?["buffer"], let bufferInMilliSesonds = Int(value) {
            return TimeInterval(abs(bufferInMilliSesonds)/1000)
        }
        return TimeInterval(API.RemoteConfig.DefaultValues.irdetoControlSessionValidityBuffer)
    }
    
    var isSSAIEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.isSSAIEnabled)
    }
    
    var ssaiPayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.isSSAIEnabled)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var watchedThresholdUpperLimit: Float {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.watchedThresholds)?["upper_limit"] {
            return Float(value) ?? API.RemoteConfig.DefaultValues.WatchedThresholds.upperLimit
        }
        return API.RemoteConfig.DefaultValues.WatchedThresholds.upperLimit
    }
    
    var watchedThresholdLowerLimit: Float {
        if let value = flagPayload(flagKey: API.RemoteConfig.Keys.watchedThresholds)?["lower_limit"] {
            return Float(value) ?? API.RemoteConfig.DefaultValues.WatchedThresholds.lowerLimit
        }
        return API.RemoteConfig.DefaultValues.WatchedThresholds.lowerLimit
    }
    
    var autoPlayPayload : [String : String] {
        let payload = flagPayload(flagKey: API.RemoteConfig.Keys.autoPlayEnabled)
        if let payload = payload {
           return payload
        } else {
            return [:]
        }
    }
    
    var isDMPEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.dmpEnabled)
    }
    
    var isPreRollLinearEnabled: Bool {
        return isConfigEnabled(flagKey: API.RemoteConfig.Keys.preRollLinearEnabled)
    }
    
    private var apiClient: RemoteConfigApiClient?
    private var base36Id: String?
    
    private let defaults: Defaults
    private let appVersion: String
    
    // MARK: - Initialization
    
    init(defaults: Defaults = .shared,
         base36Id: String? = nil,
         appVersion: String = Bundle.main.versionNumber ?? "") {
        self.defaults = defaults
        self.base36Id = base36Id
        self.appVersion = appVersion
    }
    
    // MARK: - Operations
    
    func requestRemoteConfigs(url: String? = nil, session: URLSession? = nil, completion: @escaping () -> Void) {
        let base36Id = self.base36Id ?? LoginSession().base36Id ?? ""
        
        if let session = session, let url = url {
            apiClient = RemoteConfigApiClient(url: url, base36Id: base36Id, appVersion: appVersion)
            apiClient?.apiClient.session = session
        } else {
            apiClient = RemoteConfigApiClient(base36Id: base36Id, appVersion: appVersion)
        }
        
        let completionHandler: (RemoteConfigsResponse) -> Void = { [weak self] remoteConfigsResponse in
            guard let strongSelf = self else { return }
            strongSelf.current = remoteConfigsResponse
            completion()
        }
        
        let failureHandler: (Error?) -> Void = { _ in
            completion()
        }
        
        apiClient?.requestRemoteConfigs(completion: completionHandler, failure: failureHandler)
    }
    
    private func isConfigEnabled(flagKey: String) -> Bool {
        return flagValue(flagKey: flagKey)?.bool ?? false
    }
    
    private func flagValue(flagKey: String) -> String? {
        let config = current?.configs.first(where: { $0.flagKey == flagKey })
        return config?.flagValue
    }
    
    private func flagPayload(flagKey: String) -> [String: String]? {
        let config = current?.configs.first(where: { $0.flagKey == flagKey })
        return config?.payload
    }
    
}
