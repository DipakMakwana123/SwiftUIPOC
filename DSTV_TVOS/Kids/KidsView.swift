//
//  KidsView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 24/03/23.
//

import SwiftUI


struct KidsView: View {

    @ObservedObject private var viewModel =  KidsViewModel()

    var body: some View {
        VStack(spacing: 0){
            VStack (spacing: margin8) {
                starOverlay
            }
            .frame(alignment: .topLeading)
            VStack(alignment: .leading) {
                listView
                    .padding(margin8)
            }
            .offset(y:200)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.height,alignment: .topLeading)
        .background{
            Image("movie-")
                .resizable()
                .frame(width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.height)
        }
    }
    private var starOverlay: some View {
        HorizontalListTV(viewModel: viewModel)
    }
    var listView: some View {
        VStack(alignment: .leading) {
            List{
                ForEach(0...10, id: \.self) { item in
                    MovieItemView1()
                }
                .listRowBackground(Color.clear)
            }
        }
    }

}
