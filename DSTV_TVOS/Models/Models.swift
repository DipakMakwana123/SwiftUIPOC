//
//  Models.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 06/01/23.
//

import Foundation

struct StreamingDevice: Identifiable {
    var id = UUID()
    var title: String
    var subTitle: String
    var selected: Bool
}

struct LinkedDevice: Identifiable {
    var id = UUID()
    var title: String
    var isRegistered: Bool
}
