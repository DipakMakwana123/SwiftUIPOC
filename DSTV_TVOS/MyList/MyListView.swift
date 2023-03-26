//
//  MyListView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 24/03/23.
//

import SwiftUI



struct MyListView: View {

    @ObservedObject private var viewModel =  MyListViewModel()

    var body: some View {
        VStack {
            listView
        }
    }
    private var starOverlay: some View {
        HorizontalListTV(viewModel: viewModel)
    }
    var listView: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                MovieView(contentMode:.fill)
                    .frame(width: UIScreen.main.bounds.size.width,height: 300)
                MovieInfoView()
                    .zIndex(1)
            }
            List{
                ForEach(0...10, id: \.self) { item in
                   // SectionView(title: "Section \(item)")
                    MovieItemView()
                        //.frame(width:UIScreen.main.bounds.size.width)
                }
            }.frame(width: UIScreen.main.bounds.size.width)
        }
    }

}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
