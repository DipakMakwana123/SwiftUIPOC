//
//  ChannelMainView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 08/02/23.
//

import SwiftUI

struct ChannelMainView: View {
    @ObservedObject private var viewModel =  ChannelViewModel()
    var body: some View {
        VStack(spacing: margin16) {
            VStack {
                starOverlay
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width,alignment:.center)
            VStack(alignment: .leading) {
                listView
                    .padding(margin8)
            }
            .offset(y:100)
        }
        .background(.white.opacity(0.1))
        .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height,alignment:.topLeading)

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
    private var starOverlay: some View {
        ChannelListView(viewModel: viewModel)
    }
}

struct ChannelMainView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelMainView()
    }
}
/*

}*/
struct ChannelListView: View {

    @State var viewModel: ChannelViewModel
    @State var selectedItem: ChannelViewModel?


    var body: some View {
        VStack(alignment: .leading, spacing: margin16) {

            ScrollView(.horizontal) {
                HStack(spacing: margin32) {
                    ForEach(viewModel.lists) { item in
                        LabelView2(item: item)                    }
                }
            }
        }
    }
}

extension InsettableShape {
    func fill<Fill: ShapeStyle, Stroke: ShapeStyle>(_ fillStyle: Fill, strokeBorder strokeStyle: Stroke, lineWidth: Double = 1) -> some View {
        self
            .strokeBorder(strokeStyle, lineWidth: lineWidth)
            .background(self.fill(fillStyle))
    }
}
/*
 Button(
             action: { },
             label: {
                 VStack(spacing: margin32) {
                     Image(item.image)
                         .resizable()
                         .scaledToFit()
                         .frame(width: 100, height: 100)

                 }
                 .frame(width: 200,height: 200)
                 .overlay(content: {
                     RoundedRectangle(cornerRadius: 20)

                         //.background(self.fill(fillStyle))
                         .stroke(isFocused ? .red : .white,lineWidth: 5)

                 })
             }
         )
         .focused($isFocused)
         .buttonStyle(.card)
         .scaleEffect(1)
 */
