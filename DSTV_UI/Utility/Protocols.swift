//
//  Protocols.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 06/01/23.
//

import Foundation

protocol HorizontalViewModel {
    var lists: [HorizontalModel] {get set}
    
}
extension CatchUpViewModel: HorizontalViewModel {

}
extension LiveTVViewModel: HorizontalViewModel {

}
extension DownloadViewModal: HorizontalViewModel {

}
extension TvShowViewModel: HorizontalViewModel {

}
extension KidsViewModel: HorizontalViewModel {

}
extension SportsViewModel: HorizontalViewModel {
    
}
extension MyListViewModel: HorizontalViewModel {
    
}
