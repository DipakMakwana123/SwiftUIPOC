//
//  SettingDetailViewModal.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import Foundation

class SettingDetailViewModal: ObservableObject{
    
    @Published var lists: [SettingDetailModal] = [
        SettingDetailModal(title: "ACCOUNT",
                           lists:[
                                 TitleDescriptionModal(title: "Manage Device", description: nil, isToggle: false),
                                 TitleDescriptionModal(title: "Log Out", description: nil, isToggle: false)
                                ]
                            ),
        SettingDetailModal(title: nil,
                           lists:[
                                 TitleDescriptionModal(title: "Log in to TV", description: "Use this optiin to log in to the DSTV app.", isToggle: false),
                                ]
                            ),
        SettingDetailModal(title: "NOTIFICATIONS",
                           lists:[
                            TitleDescriptionModal(title: "Push Notification", description: "Get Updates on your favorites show,movies,sport",isToggle: true),
                                 TitleDescriptionModal(title: "Manage Reminders", description: nil, isToggle: false)
                                ]
                            ),
        SettingDetailModal(title: "KIDS",
                           lists:[
                            TitleDescriptionModal(title: "Kids PIN", description: "Enable this if you   want to be asked for the PIN when you exist from Kids Mode  ",isToggle: true),
                                ]
                            ),
        SettingDetailModal(title: "HELP",
                           lists:[
                            TitleDescriptionModal(title: "FAQs", description: "",isToggle: false),
                            TitleDescriptionModal(title: "Live Chat", description: "",isToggle: false),
                            TitleDescriptionModal(title: "Device Info", description: "",isToggle: false),
                                ]
                            ),
    ]
}

struct SettingDetailModal: Identifiable{
    let id = UUID()
    let title: String?
    let lists: [TitleDescriptionModal]
}

struct TitleDescriptionModal:Identifiable {
    let id = UUID()
    let title: String
    let description: String?
    let isToggle: Bool
}


