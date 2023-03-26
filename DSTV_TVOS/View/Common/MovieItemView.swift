//
//  MovieItemView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 03/01/23.
//

import SwiftUI
struct SectionView:View{
    var title: String
    var body: some View{
        HStack {
            Text(title)
                .foregroundColor(.white)
            Spacer()
        }
    }
}
struct MovieItemView: View {
    @State var selected = false
    var body: some View {
        ScrollView(.horizontal,content: {
            HStack {
                ForEach(0...10, id: \.self) { _ in
                    Button(action: {self.selected.toggle()}) {
                        MovieViewTV()
                    }.buttonStyle(.card)
                        .background(RoundedRectangle(cornerRadius: 5.0)
                            .fill(self.selected ? Color.white : Color.black))
                }
            }
        }).background(.black)
    }
}
struct MovieItemView1: View {
    @State var selected = false
    var body: some View {
        ScrollView(.horizontal,content: {
            HStack {
                ForEach(0...10, id: \.self) { _ in
                    Button(action: {self.selected.toggle()}) {
                        MovieViewTV1()
                    }.buttonStyle(.card)
                       // .background(RoundedRectangle(cornerRadius: 5.0)
                            //.fill(self.selected ? Color.white : Color.black))
                }
            }
        }).background(.clear)
    }
}
struct MovieInfoView: View {
    var body: some View{
        VStack(alignment: .leading) {
            Text("Avengers")
                .font(.system(size:50))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(margin8)
                .background(Color.black.opacity(0.5))

            Text("S18, E17")
                .font(.system(size:30))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .background(Color.black.opacity(0.5))

            Text("9:00 - 12:00 | 180 min | PG")
                .font(.system(size:30))
                .fontWeight(.bold)
                .foregroundColor(.gray)
                .padding(margin8)
                .background(Color.black.opacity(0.5))

            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .font(.body)
                .background(Color.black.opacity(0.5))
        }
    }
}
