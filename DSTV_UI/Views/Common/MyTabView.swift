//
//  MyTabView.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 26/12/22.
//

import SwiftUI

struct MyTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .modifier(TabModifier(resource: Resource(title: "Home", imageName: "house")))
            LiveTVView()
                .modifier(TabModifier(resource: Resource(title: "Live TV", imageName: "tv")))
            CatchUpView()
                .modifier(TabModifier(resource: Resource(title: "Catch Up", imageName: "play")))
            DownloadView()
                .modifier(TabModifier(resource: Resource(title: "Downloads", imageName: "square.and.arrow.down")))
            SettingView()
                .modifier(TabModifier(resource: Resource(title: "More", imageName: "line.3.horizontal.circle.fill")))            
        }
    }
}

