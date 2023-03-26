//
//  CatchUpView.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 20/12/22.
//

import SwiftUI

struct CatchUpView: View {
    @ObservedObject private var viewModal =  CatchUpViewModel()
    @State var selectedItem: HorizontalModel?

    var body: some View {
        NavigationView {
            VStack {
                HorizontalList(viewModal: viewModal, selectedItem: selectedItem)
                    .frame( height: 40)
                List {
                    ForEach((1...10), id: \.self) {
                        Section(header: Text("Section:\($0)")
                            .foregroundColor(Color.white)
                        )
                        {
                            HorizontalCell(memes: [])
                        }
                    }.listRowBackground(Colors.black)
                }
                .modifier(ListModifier())
            }
            .modifier(NavigationModifier(navTitle: "Catch Up", isLogoHidden: true))
        }
    }
}

struct CatchUpView_Previews: PreviewProvider {
    static var previews: some View {
        CatchUpView()
    }
}
