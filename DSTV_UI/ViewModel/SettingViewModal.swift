//
//  SettingViewModal.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 13/04/22.
//

import Foundation

class  SettingViewModal: ObservableObject{
    
    @Published var lists: [Setting] = [
        Setting(title: "Notification", image: "bell"),
        Setting(title: "Kids", image: "bell"),
        Setting(title: "TV Guide", image: "tv"),
        Setting(title: "My List", image: "list.triangle"),
        Setting(title: "showmax", image: "airpods.gen3"),
        Setting(title: "MyDStv", image: "person"),
        Setting(title: "Setting", image: "gearshape"),
    ]
}

struct Setting: Identifiable{
    let id = UUID()
    let title: String
    let image: String
}
