//
//  HorizontalCell.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI



struct HorizontalCell: View {
    var memes : [Meme]
    @State var viewFrame: CGSize = .zero
    
    let cellHeight: CGFloat = UIScreen.main.bounds.height / 5
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
                                    .resizable()
                                    .frame(width: cellWidth, height: cellHeight )
                                    .cornerRadius(10)
                                Spacer()
                            }// X //

                            Text("Avengers").foregroundColor(.white)
                            Spacer()
                        }// X //
                    }// X //
                }.background(Color.black)
            })
            .frame(width:UIScreen.main.bounds.width, height: cellHeight + 20 , alignment: .center)

    }
    
    func makeView(_ geometry: GeometryProxy) -> some View {
        print(geometry.size.width, geometry.size.height)

        DispatchQueue.main.async { viewFrame = geometry.size }
        print(viewFrame.width, viewFrame.height)
        return Text("qdlfld/fklfldfjldkjfljfldfjldsfjjfldjfldsjfldjfldjfdlfjldkjfldkfjdlkfjldsjfdlskfjdlfjdlskfjdlsfjdlkfjdslkfjdslkfjdslkfjdlksfjdlksfjdslkfdlksjfdklsfjdklsfjdlkfjdsklfjdslkfjr")
            .frame(width: geometry.size.width)
    }
   

}

