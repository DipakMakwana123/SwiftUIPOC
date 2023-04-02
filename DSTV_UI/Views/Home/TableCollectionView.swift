//
//  TableCollectionView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 11/04/22.
//

import SwiftUI
struct TableCollectionView: View {

    @State var memes = [Meme]()
    @ObservedObject private  var searchModal =  SearchModal()

    var body: some View {
        ZStack {

            List {
                ForEach((1...10), id: \.self) {
                    Section(header: Text("Section:\($0)")
                        .foregroundColor(Color.white)
                    )
                    {
                        HorizontalCell(memes: self.memes)
                    }
                }.listRowBackground(Colors.black)
            }
            .modifier(ListModifier())
            .environmentObject(searchModal)
        }
    }
}
