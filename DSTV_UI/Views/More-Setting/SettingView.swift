//
//  SettingView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 13/04/22.
//

import SwiftUI

struct SettingView: View {
    
    @StateObject var viewModal: SettingViewModal = SettingViewModal()
    
    var body: some View {

        NavigationView {
                VStack(spacing: 0) {
                    SettingTopView()
                    FormView(lists: $viewModal.lists)
                }.modifier(NavigationModifier(navTitle: "More", isLogoHidden: true))
                .background(Color.black)
            }
        }
}
