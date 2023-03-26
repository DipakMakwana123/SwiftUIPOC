//
//  MovieViewTV.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 30/12/22.
//

import SwiftUI

struct MovieViewTV: View {

    var body: some View {
        VStack {
            MovieView(contentMode: .fit)
                .padding(margin16)
            Text("Avengers")
            Spacer()
        }
    }
}
struct MovieViewTV1: View {

    var body: some View {
        VStack {
            MovieView(contentMode: .fit)
                .padding(margin8)
                .frame(height:400)
        }
    }
}

struct MovieView: View {
    let contentMode: ContentMode
    var body: some View {
        Image("movie")
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}
