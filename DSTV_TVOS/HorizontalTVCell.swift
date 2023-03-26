//
//  HorizontalTVCell.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 29/12/22.
//

import SwiftUI
struct HorizontalTVCell: View {
    @State var viewFrame: CGSize = .zero

    let cellHeight: CGFloat = UIScreen.main.bounds.height / 3
    let cellWidth:  CGFloat = UIScreen.main.bounds.width / 3.5

    var body: some View {
            ScrollView(.horizontal,content: {
                    LazyHStack {
                    ForEach(0...10, id: \.self) { item in
                        Image("movie")
                            .resizable()
                            .foregroundColor(.white)
                            //.frame(height:200)
                    }// X //
                }.background(Color.orange)
            })
            .frame(width: UIScreen.main.bounds.size.width - 100, height: 420 , alignment: .center)
    }

    func makeView(_ geometry: GeometryProxy) -> some View {
        print(geometry.size.width, geometry.size.height)

        DispatchQueue.main.async { viewFrame = geometry.size }
        print(viewFrame.width, viewFrame.height)
        return Text("qdlfld/fklfldfjldkjfljfldfjldsfjjfldjfldsjfldjfldjfdlfjldkjfldkfjdlkfjldsjfdlskfjdlfjdlskfjdlsfjdlkfjdslkfjdslkfjdslkfjdlksfjdlksfjdslkfdlksjfdklsfjdklsfjdlkfjdsklfjdslkfjr")
            .frame(width: geometry.size.width)
    }


}

/*
struct HorizontalTVCell: View {
    @State var viewFrame: CGSize = .zero

    let cellHeight: CGFloat = UIScreen.main.bounds.height / 3
    let cellWidth:  CGFloat = UIScreen.main.bounds.width / 3.5

    var body: some View {
            ScrollView(.horizontal,content: {
                LazyHStack {
                    ForEach(0...10, id: \.self) { item in
                        VStack(spacing: 0){
                            Spacer()
                            HStack(){
                                Spacer()
                                Image("movie")
                                //Image("movie")
                                    //.resizable()
                                    //.frame(width: cellWidth, height: cellHeight )
                                    .cornerRadius(10)
                                Spacer()
                            }// X //

                            Text("Avengers").foregroundColor(.white)
                            Spacer()
                        }// X //
                    }// X //
                }.background(Color.black)
            })
            .frame(height: cellHeight + 20 , alignment: .center)

    }

    func makeView(_ geometry: GeometryProxy) -> some View {
        print(geometry.size.width, geometry.size.height)

        DispatchQueue.main.async { viewFrame = geometry.size }
        print(viewFrame.width, viewFrame.height)
        return Text("qdlfld/fklfldfjldkjfljfldfjldsfjjfldjfldsjfldjfldjfdlfjldkjfldkfjdlkfjldsjfdlskfjdlfjdlskfjdlsfjdlkfjdslkfjdslkfjdslkfjdlksfjdlksfjdslkfdlksjfdklsfjdklsfjdlkfjdsklfjdslkfjr")
            .frame(width: geometry.size.width)
    }


}
*/
