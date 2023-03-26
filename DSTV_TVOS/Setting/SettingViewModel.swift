//
//  SettingViewModel.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 11/02/23.
//

import Foundation

class SettingViewModel: ObservableObject{

    @Published var items: [SettingModel] = [
        .init(id: .aboutUs, title: "About DStv", desc: "More information and Terms & Conditions",
              items: [
                .init(id: "1", title: "DStv Version", desc: "Version 1.24.1"),
                .init(id: "2", title: "For DStv Terms & Condition Please go to", desc: "https://now.dstv.com/termsAndConditions/index.html")], selected: false),
        .init(id: .linkedDevice, title: "Linked Devices", desc: "Manage up to 4 devices to watch DStv on",
              items: nil, selected: false),
        .init(id: .streamingQuality, title: "Streaming Quality", desc: "Adjust these setting to control your data consumption and viewing quality",
              items: nil, selected: false),
        .init(id: .autoPlay, title: "Autoplay Next Episode", desc: "Turn On or Off on Autoplay featire.",
              items: nil, selected: false),
        .init(id: .signOut, title: "Sign Out", desc: "This will sign you out",
              items: nil, selected: false)
    ]
    let stremingList: [StreamingDevice] = [
        StreamingDevice(title: "Highest - up to 4K", subTitle: "Uses approximately 100GB/hr", selected: true),
        StreamingDevice(title: "Higher - up to 1080p HD", subTitle: "Uses approximately 2.3GB/hr", selected: false),
        StreamingDevice(title: "High - up to 720p", subTitle: "Uses approximately 1.3GB/hr", selected: false),
        StreamingDevice(title: "Medium - up to 576p", subTitle: "Uses approximately 720MB/hr", selected: false),
        StreamingDevice(title: "Low - up to 360p", subTitle: "Uses approximately 210MB/hr", selected: false),
    ]

    let deviceList: [LinkedDevice] = [
        LinkedDevice(title: "Apple TV(This Device)", isRegistered: false),
        LinkedDevice(title: "iPhone 8", isRegistered: true),
        LinkedDevice(title: "iPhone 9", isRegistered: true),
        LinkedDevice(title: "iPhone 10",isRegistered: true),
        LinkedDevice(title: "iPhone 11",isRegistered: true),
        LinkedDevice(title: "iPhone 12",isRegistered: true),
    ]
}


struct SettingModel: Identifiable {
    let id: SettingId
    let title: String
    let desc: String
    let items: [SettingDetailModel]?
    var selected: Bool

    init(id: SettingId, title: String, desc: String, items: [SettingDetailModel]?, selected: Bool) {
        self.id = id
        self.title = title
        self.desc = desc
        self.items = items
        self.selected = selected
    }
}
struct SettingDetailModel: Identifiable {
    let id: String
    let title: String
    let desc: String
}
struct LinkedDevices: Identifiable {
    let id: String
    let sectoinTitle: String
    let deviceName: String
    let isRegistered: Bool
}
enum SettingId {
    case aboutUs
    case linkedDevice
    case streamingQuality
    case autoPlay
    case signOut

}
