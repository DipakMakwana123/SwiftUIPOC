//
//  DownloadViewModel.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 28/12/22.
//

import Foundation

class DownloadViewModal: ObservableObject{

    @Published var lists: [HorizontalModel] = [
        HorizontalModel(id: "0",title: "This Device", selected: true, subItems: []),
        HorizontalModel(id: "1",title: "Other Device", selected: true, subItems: [])]
}

