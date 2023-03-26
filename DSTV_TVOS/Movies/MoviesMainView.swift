//
//  MoviesMainView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 06/02/23.
//

import SwiftUI

struct MoviesMainView: View {
    @ObservedObject private var viewModel =  TvShowViewModel()
    var body: some View {
        VStack(spacing: 0){
            VStack (spacing: 0) {
                starOverlay
            }
            .frame(alignment: .topLeading)
            //.offset(y:-50)
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
