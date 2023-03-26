//
//  ChannelViewModel.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 08/02/23.
//

import Foundation

struct ChannelModel: Identifiable {
    var id: String
    var title: String
    var selected: Bool
    var image: String
}

class ChannelViewModel: ObservableObject{

    @Published var lists: [ChannelModel] = [
        ChannelModel(id: "1", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "2", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "3", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "4", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "5", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "6", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "7", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "8", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "9", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "10", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "11", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "12", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "13", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "14", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "15", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "16", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "17", title: "", selected: false, image: "discovery"),
        ChannelModel(id: "18", title: "", selected: false, image: "discovery"),
    ]
}
