//
//  ChannelProgramView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 12/01/23.
//

import SwiftUI


struct ChannelProgramView: View {
    @State var viewModel:  LiveTVViewModel
    var body: some View {
        List {
            ForEach(0..<viewModel.lists.count,  id: \.self) { index in

                ScrollView(.horizontal) {

                    HStack(spacing: 15) {
                        ForEach(viewModel.lists,id: \.id) { item in
                            ChannelCell(item: item)
                        }
                    }
                    .padding(.top, 10)
                }.background(.black)
                    .frame(height: 100)
            }
            .listRowInsets(EdgeInsets(top: margin8, leading: margin8, bottom: margin8, trailing: margin8))
        }
    }

}

struct ChannelCell: View {
    @State var item:  HorizontalModel
    var body: some View {
        Button(action: {}) {
            HStack {
                VStack(alignment: .leading, spacing:margin8) {
                    Text(item.title)
                        .frame(width:.infinity,alignment: .leading)
                    Text("44 mins remaining")
                        .frame(width:.infinity,alignment: .leading)
                        .font(.system(size: 20))
                }.frame(width:.infinity,alignment: .leading)
            }
            HStack (spacing:margin40) {
                Image(systemName: "play")
            }
        }.background(.black)
    }
}

