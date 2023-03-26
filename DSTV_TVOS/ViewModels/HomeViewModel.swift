//
//  HomeViewModel.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 06/01/23.
//

import Foundation


class HomeViewModel: ObservableObject{

    var items: [DataModel] = [
        .init(id: .home, sectionTitle: "Home", items: [], selected: false),
        .init(id: .liveTV, sectionTitle: "Live TV", items: [], selected: false),
        .init(id: .tvShows, sectionTitle: "TV Shows", items: [], selected: false),
        .init(id: .movies, sectionTitle: "Movies", items: [], selected: false),
        .init(id: .sports, sectionTitle: "Sport", items: [], selected: false),
        .init(id: .kids, sectionTitle: "Kids", items: [], selected: false),
        .init(id: .channel, sectionTitle: "Channels", items: [], selected: false),
        .init(id: .myList, sectionTitle: "My List", items: [], selected: false),
        .init(id: .settings, sectionTitle: "Settings", items: [], selected: false),
    ]
}

enum AppSection {
    case home
    case liveTV
    case tvShows
    case movies
    case sports
    case kids
    case channel
    case myList
    case settings
}
