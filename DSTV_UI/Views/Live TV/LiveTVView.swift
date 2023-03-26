//
//  LiveTVView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 20/04/22.
//

import SwiftUI

class LiveTVHostingVC: UIHostingController<LiveTVView> {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
struct LiveTVView: View {
    
    @ObservedObject private var viewModal =  LiveTVViewModel()
    @State var selectedItem: HorizontalModel?

    var body: some View {
        NavigationView {
            VStack {
                HorizontalList(viewModal: viewModal, selectedItem: selectedItem)
                    .frame( height: 40)

                ScrollView {
                    ForEach(viewModal.lists,id:\.id) { item in
                        collapseView(item: item)
                        Divider()
                        .background(.white)

                        if let selectedItem = selectedItem,selectedItem.id == item.id,let list = selectedItem.subItems   {
                            ForEach(list) { subItem in
                                VStack {
                                    HStack {
                                        VStack() {
                                            LogoImageView()
                                                .padding(margin8)
                                            TextLabel(strTitle: "101")
                                        }

                                        VStack (alignment: .leading){
                                            TextLabel(strTitle: subItem.title)

                                            PlayerProgressView()
                                            if let url = URL(string: subItem.videoURL) {
                                                VideoPlayerView(videoURL: url)
                                                    .padding(margin8/2)
                                            }
                                            Spacer()
                                            TextLabel(strTitle: subItem.description)
                                                .padding(margin8)
                                        }
                                    }
                                }
                                .background(.black)
                                .accentColor(Color.white)
                            }
                        }
                    }.background(Color.black)
                }
            }
            .modifier(NavigationModifier(navTitle: "Live TV", isLogoHidden: true))
        }
    }

    private func collapseView(item:HorizontalModel) -> some View{
        Button(action: {
            selectedItem = selectedItem == nil ? item : nil
        }, label: {
            SectionHeaderWithArrow(str: item.title , isChangeImage: selectedItem?.id == item.id ? true : false )
                .padding(margin8)

        }).background(Color.black)
            .buttonStyle(PlainButtonStyle())


    }
    
    private func  resetValue(){
        selectedItem?.selected = false
        for var item in viewModal.lists {
            item.selected = false
            if  let selected = selectedItem , item.id == selected.id {
                item.selected = true
                selectedItem?.selected = true
            }
        }
    }
}

struct CellView: View {
    var item: ItemData
    
    var body: some View {
        HStack {
            Text(item.name)
        }
    }
}
//struct PlayerView: View {
//    var body: some View {
//        Rectangle()
//            .fill()
//            .foregroundColor(Color.white)
//            .cornerRadius(10)
//            .frame(height: 150)
//    }
//}

struct PlayerProgressView: View{
    var body: some View {
        ProgressView("",value:0.7,total:1.0)
            .accentColor(Color.blue)
    }
}
struct LogoImageView: View {
    var body: some View {
       // HStack {
            Image("discovery")
                .resizable()
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode:.fit)
       // }
    }
}
