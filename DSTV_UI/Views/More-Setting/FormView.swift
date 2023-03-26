//
//  FormView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct FormView: View {
    @Binding var lists: [Setting]
    @State var isShowingDetailView = false
    
    //    var body: some View {
    //        List {
    //            //                NavigationLink(destination:  SettingDetail(), isActive: $isShowingDetailView) {
    ////            Button(action: {
    ////                debugPrint("Clicked")
    ////                isShowingDetailView = true
    ////            }, label: {
    ////
    ////            })
    //            ForEach(lists, id: \.id) { result in
    //                HStack {
    //                    Image(systemName: result.image)
    //                        .padding()
    //                    Text(result.title)
    //                    Spacer()
    //                }
    //                Divider()
    //            }
    //
    //
    //        }
    //
    //        }
    var body: some View{
        List {
            ForEach(lists, id: \.id) { result in
                HStack(){
                    Image(systemName: result.image)
                        .foregroundColor(.white)
                    Text(result.title)
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)

                }.frame(height:50)


            }.listRowBackground(Colors.black)
        }
        .modifier(ListModifier())
    }
}

