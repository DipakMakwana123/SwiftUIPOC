
import Foundation
import Analytics

class SegmentLogOutReporter {
    private var isEnabled = true
    
    init() {
        isEnabled = ReportingEnabler.shared.isSegmentEnabled &&
            API.RemoteConfig.DefaultValues.consentForStrictlyNecessary
    }
    
    func reportUserLoggedOut(with error: Error?) {
        guard isEnabled else { return }
        let event = Reporting.Segment.Events.loginRequiredAfterRefresh
        var properties: [String: Any] = [
            Reporting.Segment.Properties.userID: LoginSession().base36Id ?? "",
            Reporting.Segment.Properties.platform: Reporting.Segment.platform,
            Reporting.Segment.Properties.profileId: ProfileManager().selectedProfile?.id ?? "",
            Reporting.Segment.Properties.accessToken: LoginSession().accessToken ?? "",
            Reporting.Segment.Properties.jwt: LoginSession().jwt ?? "",
            Reporting.Segment.Properties.refreshUrl: API.AccessToken.URL.refresh
        ]
        
        if let error = error as? RequestError {
            properties[Reporting.Segment.Properties.errorBody] = error.description
        }
        properties.mergeDeviceDetails()
        SEGAnalytics.shared()?.track(event, properties: properties)
    }
}
