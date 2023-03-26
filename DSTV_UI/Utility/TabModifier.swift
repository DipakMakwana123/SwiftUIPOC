//
//  TabModifier.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 28/12/22.
//

import SwiftUI

struct TabModifier: ViewModifier {
    var resource: Resource
    func body(content: Content) -> some View {
        content
            .tabItem {
                Label(resource.title, systemImage: resource.imageName)
            }
                .toolbar(.visible, for: .tabBar)
                .toolbarBackground(Color.black, for: .tabBar)
    }
}
