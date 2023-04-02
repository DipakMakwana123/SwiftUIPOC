//
//  API.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 26/03/23.
//

import Foundation

struct API {
    static let appID = "4WB6UCZQF4"
    static let productId = "1b09957b-27aa-493b-a7c9-53b3cec92d63"

    struct Certificate {
        static var url: String {
            return irdetoControlURL
        }

        private static var irdetoControlURL: String {
            switch Environment.current {
            case .production: return irdetoControlProdURL
            case .staging: return irdetoControlStageURL
            }
        }

        private static let rrmURL = "https://license.dstv.com/streaming/getcertificate?applicationId=afl"
        private static let irdetoControlProdURL = "https://rng.live.ott.irdeto.com/licenseServer/streaming/v1/afl/getcertificate?applicationId=afl"
        private static let irdetoControlStageURL = "https://rng.stage.ott.irdeto.com/licenseServer/streaming/v1/afl/getcertificate?applicationId=afl"
    }

    struct License {
        static var baseURL: String {
            return "\(RemoteConfigManager.shared.irdetoControlLicenseDomain)/licenseServer/streaming/v1/afl/getckc"
        }
    }

    struct DownloadManager {
        static let version = "2"

        struct Body {
            struct Keys {
                static let assetId = "assetId"
                static let deviceId = "deviceId"
                static let deviceName = "deviceName"
                static let downloadId = "downloadId"
                static let genRef = "genref"
                static let platformId = "platformId"
                static let productId = "productId"
                static let date = "date"
                static let progress = "progress"
                static let ultimateExpiryDate = "ultimateExpiryDate"
                static let downloadState = "downloadState"
            }
        }

        struct MatrixParams {
            struct Keys {
                static let deviceId = "deviceId"
            }
        }

        struct URL {
            static var base: String {
                switch Environment.current {
                case .production: return production
                case .staging: return staging
                }
            }
            private static let production = "https://ssl.dstv.com/api/download-manager"
            private static let staging = "https://sslapi.dstv.com/api/download-manager"
            static let download = "\(base)/v\(version)/download"
            static let delete = "\(download)/delete"
            static let list = "\(download)/list"
            static let sync = "\(download)/sync"
            static let userDownloadInfo = "\(download)/userDownloadInfo"

            struct PathComponents {
                static let played = "played"
                static let complete = "complete"
            }
        }

        struct Errors {
            struct Keys {
                static let errorCode = "errorCode"
            }

            struct Values {
                static let exists = 1100 //- Download already exists
                static let notFound = 1101 //- Download does not exist
                static let expired = 1103 //- Download has expired and should be deleted from client
                static let userUnauthorized = 1200 //- User is not authorized to perform an action
                static let limitReached = 1299 //- The user has reached their download limit across all their devices
                static let noVideoMeta = 1400 //- Video meta was not returned from the VOD service
            }
        }
    }

    struct FAQs {
        static let url = "https://now.dstv.com/ios/faqs/index.html"
    }

    struct IPAddress {
        static let url = "https://api64.ipify.org/?format=json"
    }

    struct TACs {
        static let url = "https://now.dstv.com/termsAndConditions/index.html"
    }

    struct Headers {
        struct Keys {
            static let accept = "Accept"
            static let authorization = "Authorization"
            static let contentType = "Content-Type"
            static let accessToken = "X-Access-Token"
            static let profileId = "x-profile-id"
        }

        struct Values {
            static let applicationJson = "application/json"
            static let applicationFormUrlEncoded = "application/x-www-form-urlencoded"
        }
    }

    struct Login {
        static var baseUrl: String {
            switch Environment.current {
            case .production: return productionUrl
            case .staging: return stagingUrl
            }
        }
        static var appId: String {
            switch Environment.current {
            case .production: return productionAppId
            case .staging: return stagingAppId
            }
        }
        private static let productionUrl = "https://authentication.dstv.com/registration/signin"
        private static let stagingUrl = "https://alpha-authentication.dstv.com/registration/signin"
        private static let productionAppId = "cf747925-dd85-4dde-b4f3-61dfe94ff517"
        private static let stagingAppId = "d1ce760a-f837-486d-91d6-07316ad78211"
        static let redirectUri = "http://localhost:49154/"
        static let errorDomain = "com.multichoice.login"
        static let responseNavigationFailureUrlKey = "NSErrorFailingURLStringKey"
    }

    struct GeoBlocking {
        static let status = 451
        static var geoValue = 403
    }

    struct UserInfo {
        static let url = "https://ssl.dstv.com/api/user/info"
    }

    struct ChannelGroups {
        static var base: String {
            switch Environment.current {
            case .production: return production
            case .staging: return staging
            }
        }
        private static let production = "https://ssl.dstv.com/api"
        private static let staging = "https://beta-ssl.dstv.com/api"

        static let url = "\(base)/lists/channel_group_sections"
    }

    struct QueryParams {
        static let countryCode = "country_code"
        static let subscriptionPackage = "subscription_package"
    }

    struct NowMobile {
        static let version = "7"

        static let packageId = "3e6e5480-8b8a-4fd5-9721-470c895f91e2"

        struct PlatformIds {
            static let iOS = "51a0d73e-2304-4bd9-b9a5-9c7d99a301e9"
            static let tvOS = "0aed2408-a480-493a-9305-09480614b206"
        }

        struct Body {
            struct Keys {
                static let genRef = "genref"
                static let name = "name"
                static let type = "type"
                static let timeInSeconds = "timeInSeconds"
                static let videoPackageId = "videoPackageId"
                static let alias = "alias"
                static let avatarId = "avatarId"
                static let videoType = "videoType"
            }

            struct Values {
                struct DeviceType {
                    static let iOS = "iOS"
                    static let tvOS = "Apple TV"
                }
            }
        }

        struct MatrixParams {
            static let commonVod = [
                Keys.platformId: DeviceHelper.isTv ? PlatformIds.tvOS : PlatformIds.iOS,
                Keys.productId: productId
            ]

            struct Keys {
                //New EPG Service
                static let notificationId = "notificationId"
                static let utcOffset = "utcOffset"
                static let channelId = "channelId"
                static let channelTag = "channelTag"
                //End of New EPG Service
                static let categoryId = "categoryId"
                static let sortOrder = "sortOrder"
                static let subcategoryId = "subCategoryId"
                static let channelTags = "channelTags"
                static let deviceId = "deviceId"
                static let deviceType = "deviceType"
                static let deviceName = "deviceName"
                static let endDate = "endDate"
                static let genRef = "genref"
                static let packageId = "packageId"
                static let platformId = "platformId"
                static let platform_id = "platform_id"
                static let productId = "productId"
                static let countryCode = "country_code"
                static let subscriptionPackage = "subscription_package"
                static let revision = "revision"
                static let programId = "programId"
                static let startDate = "startDate"
                static let date = "date"
                static let videoId = "videoId"
                static let videoPackageId = "videoPackageId"
                static let platformType = "platformType"
                static let sessionType = "sessionType"
                static let assetTag = "assetTag"
                static let correlationId = "correlationId"
                static let mainContentId = "mainContentId"
                static let eventId = "eventId"
                static let view = "view"
                static let downloadId = "downloadId"
                static let searchTerm = "searchTerm"
                static let page = "page"
                static let pageSize = "pageSize"
                static let versionNumber = "versionNumber"
                static let kids = "kids"
                static let genre = "genre"
                static let streamable = "liveStreamsOnly"
                static let videoAssetsFilter = "videoAssetsFilter"
                static let eventsCount = "eventsCount"
                static let apiKey = "api_key"
                static let recipients = "recipients"
                static let userID = "external_user_id"
                static let drm = "drm"
                static let hdcp = "hdcp"
                static let operatingSystem = "os"
                static let operatingSystemVersion = "os_version"
                static let controlEntitleDeviceId = "device_id"
                static let controlEntitleDeviceName = "device_name"
                static let controlEntitleDeviceType = "device_type"
                static let controlEntitleSessionType = "session_type"
                static let controlEntitlePlatformId = "platform_id"
                static let controlEntitleSecurityLevel = "security_level"
            }

            struct Values {
                static let deviceType = "iOS"
                static let sessionType = "stream"
                static let platformType = "mobile"
                static let view = "compact"
                static let trueString = "true"
                static let drm = "fairplay"
                static let hdcp = "available"
                static let securityLevel = "na"
                #if os(iOS)
                static let operatingSystem = "iOS"
                static let controlEntitlementDeviceType = "mobile"
                #else
                static let operatingSystem = "tvOS"
                static let controlEntitlementDeviceType = "leanback"
                #endif
            }
        }

        struct URL {
            static var base: String {
                switch Environment.current {
                case .production: return production
                case .staging: return staging
                }
            }
            private static let production = "https://ssl.dstv.com/api/cs-mobile"
            private static let staging = "https://sslapi.dstv.com/api/cs-mobile"
            static let catalogue = "\(base)/now-content/v\(version)/getCatalogue"
            static let apiSilentPushUrl = "https://rest.iad-01.braze.com/messages/send"

            //QUERY STRING
            static var host: String {
                switch Environment.current {
                case .production: return productionHost
                case .staging: return stagingHost
                }
            }
            static let scheme = "https"
            static let navigationMenuPath = "/api/navigation_menu"
            static let navigationRevision = "5"
            private static let productionHost = "ssl.dstv.com"
            private static let stagingHost = "sslapi.dstv.com"


            //NEW EPG SERVICE
            static let streamableChannels = "\(base)/v\(version)/epg-service/genres;liveStreamsOnly=true"
            static let channels = "\(base)/v\(version)/epg-service/channels"
            static let channelGenres = "\(base)/v\(version)/epg-service/sections"
            static let bouquets = "\(base)/v\(version)/epg-service/packages"
            static let schedule = "\(base)/v\(version)/epg-service/channels/epgEvents/byDate"
            static let event = "\(base)/v\(version)/epg-service/event"
            static let otherAirings = "\(base)/v\(version)/epg-service/futureEvents"
            //END NEW EPG SERVICE

            static let userInfo = "\(base)/api/user/info"
            static let categories = "\(base)/v6/application/vod/sections"
            static let editorialListsForItem = "\(base)/editorial/v\(version)/getEditorialsForItem"
            static let video = "\(base)/now-content/v\(version)/getVideo"
            static let deviceList = "\(base)/user-manager/v\(version)/getDevices"
            static let deviceRegistration = "\(base)/user-manager/v\(version)/vod-authorisation"
            static let deviceDeregistration = "\(base)/user-manager/v\(version)/deregisterDevice"
            static let entitlement = "\(base)/user-manager/v\(version)/vod-authorisation"
            static let remoteRecord = "\(base)/epg/v\(version)/record"
            static let smartcards = "\(base)/epg/v\(version)/getLinkedSmartCards"

            static let getBookmark = "\(base)/bookmark-manager/v\(version)/getBookmark"
            static let saveBookmark = "\(base)/bookmark-manager/v\(version)/saveBookmark"
            static let deleteBookmark = "\(base)/bookmark-manager/v\(version)/deleteBookmark"
            static let navigationMenu = "\(base)/application/navigationmenu"
            static let concurrency = "\(base)/user-manager/v\(version)/getConcurrentSession"
            static let search = "\(base)/now-content/v\(version)/search"
            static let versionCheck = "\(base)/version-manager/v\(version)/checkVersion"
            static let kidsCatalogue = "\(base)/now-content/v\(version)/catalogue;productId=\(API.productId);platformId=\(PlatformIds.iOS);tags=Kids"
            static let avatar = "\(base)/v\(version)/profiles/avatars"
            static let profiles = "\(base)/v\(version)/profiles"
            static let watchlist = "\(base)/v\(version)/watchlist"

            static var controlEntitlement: String {
                switch Environment.current {
                case .production: return controlEntitlementProd
                case .staging: return controlEntitlementStage
                }
            }
            private static let controlEntitlementProd = "https://ssl.dstv.com/api/vod-auth/entitlement/session"
            private static let controlEntitlementStage = "https://alpha-ssl.dstv.com/api/vod-auth/entitlement/session"
        }

        struct Errors {

            struct Keys {
                static let errorCode = "errorCode"
                static let errorReason = "reason"
                static let errorMessage = "errorMessage"
                static let errorType = "type"
            }

            struct Values {
                static let outsideMcaTerritories = 2
                static let deviceRegistrationLimit = 9
                static let deviceRegisteredToOtherUser = 7
                static let userUnauthorized = 1200
                static let bookmarkDoesNotExist = 9999
                static let notFound = 404
                static let geoBlockingMessage = 451
            }

            struct Types {
                static let deviceRegistrationLimit = "device-limit-reached"
                static let geoBlockingUserMessage = "geoblocking_message"
            }
        }
    }

    struct DstvNow {
        struct URL {
            static var base: String {
                switch Environment.current {
                case .production: return production
                case .staging: return staging
                }
            }
            private static let production = "https://ssl.dstv.com/api/dstv_now"
            private static let staging = "https://beta-ssl.dstv.com/api/dstv_now"

            static let continueWatching = "\(base)/continue_watching"
            static let cdnChannelToken = "\(base)/play_stream/access_token?channel_tag="
        }

        struct UrlPaths {
            struct ContinueWatching {
                static let programs = "programs"
                static let videos = "videos"
                static let info = "info"
                static let autoplay = "auto_play"
            }
        }

        struct Errors {
            struct Keys {
                static let type = "type"
                static let title = "title"
                static let status = "status"
                static let detail = "detail"
                static let instance = "instance"
            }
        }

        struct Timeouts {
            static let continueWatchingInfo = 2.0
            static let autoPlayInfo = 2.0
            static let cdnTokenInfo = 3.0
        }

        struct Keys {
            static let hdnts = "hdnts"
        }
    }

    struct SelfService {
        static var url: String {
            switch Environment.current {
            case .production: return production
            case .staging: return staging
            }
        }
        private static let staging = "http://beta-selfservice.dstv.com/1.1/nowapp/index"
        private static let production = "https://selfservice.dstv.com/1.1/nowapp/index"
    }

    struct Showmax {
        static var url: String {
            switch Environment.current {
            case .production: return production
            case .staging: return staging
            }
        }

        private static let staging = "https://beta-now.dstv.com/showmax/webview#token_type=bearer"
        private static let production = "https://now.dstv.com/showmax/webview#token_type=bearer"
    }

    struct UniversalLinks {
        struct Schemes {
            static let http = "http"
            static let https = "https"
            static let dstvPhone = "dstvphone"
        }

        struct Hosts {
            static var guide: String {
                switch Environment.current {
                case .production: return "guide.dstv.com"
                case .staging: return "staging-guide.dstv.com"
                }
            }

            static var now: String {
                switch Environment.current {
                case .production: return "now.dstv.com"
                case .staging: return "features-now.dstv.com"
                }
            }
        }

        struct PathPrefixes {
            static let event = "/event/"
            static let video = "/catchup/video/"
            static let program = "/catchup/program/"
            static let programVideo = "/video/"
            static let channel = "/livetv/play/"
            static let settings = "/settings"
            static let sections = "/catchup/"
            static let catchupPlay = "/play"
            static let showmax = "/showmax"
            static let myDStv = "/mydstv"
            static let profileEdit = "/profiles/edit"
            static let watchlist = "/watchlist/"
            static let pushNotificationEnabled = "/notifications/enable"
        }

        struct PathSuffixes {
            static let add = "/add"
        }
    }

    struct OTP {
        struct URL {
            static let version = "1"
            static var base: String {
                switch Environment.current {
                case .production: return production
                case .staging: return staging
                }
            }

            static var production = "https://ssl.dstv.com/api/lean-back-otp"
            static var staging = "https://sslapi.dstv.com/api/lean-back-otp"
            static let QRCode = "https://now.dstv.com/tv?userCode="
            static let register = "\(base)/device/registration"
            static let verification = "\(base)/device/verification"
        }

        struct Body {
            struct Keys {
                static let deviceId = "deviceId"
                static let userAgent = "userAgent"
                static let appVersion = "appVersion"
            }
        }
    }

    struct Pusher {
        struct Keys {
            static var key: String {
                switch Environment.current {
                case .production : return "5b1cf858986ab7d6a9d7"
                case .staging: return "84a02c83d1c3f5d29a24"
                }
            }

            static let app_id = "506036"
            static let secret = "c1576215566a1a9ca297"
            static let cluster = "eu"
            static let sessionId = "accessToken"
            static let jwt = "idToken"
        }

        struct Events {
            static let loginSuccess = "login-success"
        }

    }

    struct AccessToken {
        struct URL {

            static var base: String {
                switch Environment.current {
                case .production: return production
                case .staging: return staging
                }
            }

            static var production = "https://ssl.dstv.com/connect/connect-authtoken/v2/accesstoken"
            static var staging = "https://staging-auth.dstv.com/accesstoken"

            static let refresh = "\(base)/refresh"

        }

        struct Body {
            struct Keys {
                static let idToken = "idToken"
                static let accessToken = "accessToken"
                static let trackingId = "trackingId"
            }
        }
    }

    struct Braze {
        static var appId: String {
            #if DEBUG
            return "65a71fd2-193f-41c3-a497-7e7e7a631823"
            #elseif STAGING
            return "65a71fd2-193f-41c3-a497-7e7e7a631823"
            #else
            return "52371fcf-bffd-40bf-ba40-305c764f37ba"
            #endif
        }
        static var apiKey: String {
            #if DEBUG
            return "d30b5f98-af5a-4fe9-9f44-f20aa8c024d1"
            #elseif STAGING
            return "d30b5f98-af5a-4fe9-9f44-f20aa8c024d1"
            #else
            return "36a0f175-497e-4718-980e-8a470a4f93a8"
            #endif
        }
        struct URL {
            static var base = "https://sagittarius.iad-01.braze.com"
            static var track: String {
                return "\(base)/users/track"
            }
            static var inAppMessage = "https://rest.iad-01.braze.com/canvas/trigger/send"
        }

        struct Notifications {
            struct Body {
                struct Keys {
                    static let apiKey = "api_key"
                    static let attributes = "attributes"
                    static let appId = "app_id"
                }

                struct values {
                    static let subscribed = "subscribed"
                    static let unsubscribed = "unsubscribed"
                }
            }
        }
    }

    struct Segment {
        struct WriteKeys {
            struct iOS {
                static let dev = "xX2uBeKlN0tGKx45w7zDiRooIRbsusfI"
                static let staging = "MQaQsX5AzYbfdRkrKca0fxVnqsPO6CuT"
                static let prod = "u0J1uL7PN1GSc5ZCTbqb92hfYbkr8Fa9"
            }

            struct tvOS {
                static let dev = "0tUn3YKfdiEuDVKEJxWDugPEHt1ffiLQ"
                static let staging = "KIYH17RfTqXtyXv03JhAMW3yL8AMWKRX"
                static let prod = "o5Y4TEcQhEOuhvKnOCyyPHTF1yFC0VtJ"
            }
        }
    }

    struct LiveChat {
        static let url = "https://chat.dstv.com?accessToken="
    }

    struct AppSpector {
        struct iOS {
            static let apiKey = "ios_ZWI5ZGYzOTgtMDYwYS00NWQ4LWIxZWItNzMzMjk4MjRhYWY5"
        }
        struct tvOS {
            static let apiKey = "appletv_MTk3NmQ3YWEtNjk5Ni00MDEyLWI4ODEtMTA4NjRjMTc5MzNh"
        }
    }

    struct StagingAuthProxy {
        static func loginRequest(username: String, password: String) -> URLRequest {
            let url = URL(string: "https://stagingapps.dstv.com/connect/Authproxy/service.svc/session")!

            let body = [
                "username": username,
                "password": password,
                "clientIp": "0.0.0.0"
            ].jsonData

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("Basic YW1vZDpqQypmdzZAeDhm", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = body

            return request
        }
    }

    struct RemoteConfig {
        static let url = "https://features.dstv.com/api/v1/remote_configs"

        struct Keys {
            static let refreshOnLoadTimeoutms = "refresh_on_load_endpoint_timeout_ms"
            static let waterMarking = "wme_enabled"
            static let playerPopupConfiguration = "player_popup_configuration"
            static let continueWatching = "continue_watching_enabled"
            static let remoteLogging = "device_logging_enable"
            static let autoPlayEnabled = "autoplay_enabled"
            static let skipAdsForBookmark = "skip_ad_for_bkmrk"
            static let watchButtonEnabled = "watch_button_enabled"
            static let playerSkipTime = "player_skip_time_seconds"
            static let playerControlsInCentre = "player_controls_in_centre"
            static let appBackgroundGradientStart = "app_background_gradient_start"
            static let appBackgroundGradientEnd = "app_background_gradient_end"
            static let shareEnabled = "share_enabled"
            static let FAQsUrl = "faqs_url"
            static let TACsUrl = "tcs_url"
            static let pictureInPictureEnabled = "picture_in_picture_enabled"
            static let playerGestureControlEnabled = "player_gesture_control_enabled"
            static let notificationCenterEnabled = "enable_notification_center"
            static let sentrySampleRate = "sample_rate"
            static let remoteLogoutEnabled = "enable_lood"
            static let touchPeekEnabled = "enable_touch_peek"
            static let playerHeartbeatInterval = "player_heartbeat_seconds"
            static let reportButtonClicksEnabled = "report_button_clicks"
            static let segmentErrorLoggingEnabled = "enable_segment_error_logging"
            static let fullNetworkLogEnabled = "enable_nl"
            static let detailedDebugEnabled = "detailed_debug"
            static let mobileTvOtp = "mobile_tv_otp"
            static let appShortcuts = "enable_quick_actions"
            static let bitmovinAnalytics = "enable_bitmovin_logging"
            static let homeEvent = "braze_inapp_home_event"
            static let concurrencyCheckIntervalSeconds = "concurrency_check_interval_seconds"
            static let videoQuality = "video_quality"
            static let shouldDisableTimeToRefresh = "disable_ttr"
            static let remoteRecordingEnabled = "remote_recording"
            static let actionablePushNotificationEnabled = "actionable_notification"
            static let versionStatus = "version_status"
            static let isSentryEnabled = "enable_sentry"
            static let genericMessage = "generic_message"
            static let noInternetMessage = "no_internet_message"
            static let mobileDataAlert = "mobile_data_message"
            static let mobileDataDownloadAlert = "dl_mobile_data_message"
            static let deviceLimitMessage = "device_limit_message"
            static let isIrdetoControlsEnabled = "irdeto_ctr_pd_enabled"
            static let sentryResponseBodyLength = "sentry_response_body_length"
            static let outputObscuredMessage = "hdpc_error_message"
            static let isSSAIEnabled = "ssai_enabled"
            static let watchedThresholds = "watched_thresholds"
            static let geoBlockingKey = "geoblocking_message"
            static let dmpEnabled = "dmp_enabled"
            static let preRollLinearEnabled = "dai_preroll_linear"
        }

        struct DefaultValues {
            static let refreshOnLoadTimeoutms = 2000
            static let touchPeekEnabled = false
            static let playerSkipTime = 10
            static let playerControlsInCentre = false
            static let appBackgroundGradientStart = "#181818"
            static let appBackgroundGradientEnd = "#181818"
            static let shareEnabled = false
            static let FAQsUrl = FAQs.url
            static let TACsUrl = TACs.url
            static let pictureInPictureEnabled = false
            static let playerGestureControlEnabled = false
            static let playerHeartbeatInterval = 60
            static let reportButtonClicksEnabled = true
            static let segmentErrorLoggingEnabled = true
            static let concurrencyCheckIntervalSeconds:Int64 = 60
            static let remoteRecordingEnabled = true
            static let sentryResponseBodyLength = 5000
            static let irdetoControlProdDomain = "https://licensev2.dstv.com"
            static let irdetoControlStageDomain = "https://licensev2.alpha.dstv.com"
            static let irdetoControlSessionValidityBuffer: TimeInterval = 5
            static let consentForStrictlyNecessary = true
            static let consentForMarketing = true
            static let consentForPerformance = true
            static let ssaiProductName = "DStv"
            static let ssaiScheduleTag = "Linear"
            static let ssaiGDPRValue = "0"
            static let sentrySampleRateDefaultValue = "0.1"
            struct WatchedThresholds {
                static let upperLimit = Float(0.93)
                static let lowerLimit = Float(0.07)
            }
            static let autoPlayCountDown = 10
        }
    }

    struct Sentry {
        struct ClientKeys {
            static let iOS = "https://d7f73ef1a77040cb9bb78811ffa89da3@o437107.ingest.sentry.io/5420835"
            static let tvOS = "https://306363301d3547d9b5a45d1272a1caab@o437107.ingest.sentry.io/5420841"
        }
    }

    struct Entitlement {
        struct Control {
            struct Keys {
                static let session = "session"
                static let expiry = "expiry_date"
                static let type = "session_type"
                static let ucpFilter = "streaming_filter"
            }
        }

        struct RRM {
            struct Keys {
                static let sessionId = "sessionId"
                static let ticket = "ticket"
                static let vodAuthorisation = "vodAuthorisation"
                static let irdetoSession = "irdetoSession"
                static let irdetoSessionExpiry = "sessionExpiryDateTime"
            }
        }
    }

    struct IrdetoControl {
        struct Keys {
            static let contentKeyRenewalInterval = "x-irdeto-renewal-duration"
        }

        struct Values {
            static let contentKeyRenewalInterval: TimeInterval = 60
        }

        struct Error {
            struct Keys {
                static let code = "code"
            }

            struct Values {
                static let concurrency = 130401
            }
        }
    }

    struct Permutive {
        static let apiKey = "0983a98c-3a1d-4dcc-a41e-5c88b5dd4933"
        static let organisationId = "b2d7ba82-21e5-456c-bc98-05c7e0cd93de"
        static let workspaceId = "b2d7ba82-21e5-456c-bc98-05c7e0cd93de"
    }

    struct GodzilaMode {
        static var base: String {
            switch Environment.current {
            case .production: return "https://now.dstv.com"
            case .staging: return "https://beta-now.dstv.com"
            }
        }

        static let url = "\(base)/godzilla.json"
    }
}
