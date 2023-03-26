//
//  SettingToggleView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct SettingToggleView: View {
    
    var subItem: TitleDescriptionModal
    @Binding var isToggle: Bool

    
    var body: some View {
        if subItem.isToggle {
            HStack {
                Toggle(subItem.title, isOn: $isToggle)
                    .padding(margin8)
            }
        }
        else {
            VStack {
                HStack {
                    Text(subItem.title)
                        .padding(margin8)
                    Spacer()
                }
                if let desc = subItem.description , !desc.isEmpty {
                    HStack {
                        Text(desc)
                            .padding(margin8)
                        Spacer()
                    }
                }
            }
        }
    }
}
