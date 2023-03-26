//
//  DataModel.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 20/12/22.
//

import Foundation

struct DataModel: Identifiable {
    let id: AppSection 
    let sectionTitle: String
    let items: [ItemModel]
    var selected: Bool 
}
struct ItemModel: Identifiable {
    let id: String
    let name: String
    let imageName: String
}

