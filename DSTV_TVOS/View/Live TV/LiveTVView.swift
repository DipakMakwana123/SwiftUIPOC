//
//  LiveTVView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 03/01/23.
//




import SwiftUI

struct LiveTVView: View {

    @ObservedObject private var viewModel =  LiveTVViewModel()
    @State var selectedItem: HorizontalModel?
    @State private var isMenu = false
    @State var timeList: [String] = ["Today" , "11:00" , "12:00" , "01:00" , "02:00" , "03:00" , "04:00", "05:00", "06:00", "07:00", "08:00" ]

    var body: some View {
        if isMenu{
            ZStack{
                HorizontalListTV(viewModel: viewModel)
                    .zIndex(1)

            }.frame(width: UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height,alignment: .topLeading)
                .background{
                    Image("movie")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.size.width)
                }
        }
        else{
            VStack(alignment: .leading)  {
                VStack(alignment: .leading){
                    starOverlay
                }.overlay(alignment: .topLeading){
                    MovieInfoView()
                        .padding(margin32)
                        .frame(height:400,alignment: .topLeading)
                }
                HStack {
                    timeDisplayView
                }
                HStack(alignment: .top, spacing: margin8) {
                    VStack{
                        channelView
                            .padding(margin16)
                    }
                    VStack {
                        programView
                            .padding([.top],margin8)
                    }
                }.frame(width: UIScreen.main.bounds.size.width)
            }
        }
    }
    private var programView: some View {
        List {
            ForEach(0..<viewModel.lists.count,  id: \.self) { index in
                ScrollView(.horizontal) {
                    HStack(spacing: margin32) {
                        ForEach(viewModel.lists,id: \.id) { item in
                            channelCellView(item: item)
                        }
                    }
                }.background(.black)
            }
        }
    }
    private func channelCellView(item:HorizontalModel) -> some View {
        Button(action: {}) {
            HStack(spacing:margin40){
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
    private var channelView: some View {
        List{
            ForEach(0..<viewModel.lists.count,  id: \.self) { index in
                Button(action: {}) {
                    HStack(spacing:margin32) {
                        Text("20\(index)")
                            .frame(width:.infinity,alignment: .leading)
                        Image("discovery")
                            .resizable()
                            .frame(width:60,height: 30,alignment: .leading)
                            .background(.black)
                    }
                }
                //.padding()
                .frame(height: 100)
            }
            .listRowBackground(
                Color.gray
                    .clipped()
                    .cornerRadius(10))
            .environment(\.defaultMinListRowHeight, 100)
        }.frame(maxWidth: 200)
        // .listRowInsets(EdgeInsets(top: -margin16, leading: 0, bottom: -margin16, trailing: 0))
    }
    private var channelView1: some View {
        List{
            ForEach(0..<viewModel.lists.count,  id: \.self) { index in
                Button(action: {}) {
                    HStack(spacing:margin32) {
                        Text("20\(index)")
                            .frame(width:.infinity,alignment: .leading)

                        Image("discovery")
                            .resizable()
                            .frame(width:60,height: 30,alignment: .leading)
                    }
                }

                .frame(height: 100)
            }
            .listRowBackground(
                Color.gray
                    .clipped()
                    .cornerRadius(10))
            .environment(\.defaultMinListRowHeight, 100)
        }.frame(maxWidth: 200)
        // .listRowInsets(EdgeInsets(top: -margin16, leading: 0, bottom: -margin16, trailing: 0))
    }

    private var timeDisplayView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(timeList, id: \.self) {
                    Button($0){}
                        .buttonStyle(.plain)
                        .padding([.leading,.trailing],margin40)
                }
            }.padding([.leading,.trailing],margin40)
        }
    }
    private var starOverlay: some View {
        Image("movie")
            .resizable()
            .frame(width: UIScreen.main.bounds.size.width,alignment: .topLeading)
    }

}
//https://stackoverflow.com/questions/69074961/swiftui-button-tvosios-action-working-for-ios-not-on-tvos
struct HorizontalListTV: View {

    @State var viewModel: HorizontalViewModel
    @State var selectedItem: HorizontalModel?

    var body: some View {
        VStack(alignment: .leading, spacing: margin8) {
            ScrollView(.horizontal) {
                HStack(spacing: margin8) {
                    ForEach(viewModel.lists) { item in
                        LabelView1(item: item)
                    }
                }
            }
        }.background(Color.black.opacity(0.5))
    }
}

struct LabelView1: View {
    @State  var item: HorizontalModel

    var body: some View {
        VStack(alignment: .leading,spacing: margin8){
            CustomButton(action: {
                print("clicked 1")
            }) {
                HStack(alignment:.center){
                    Spacer()
                    Text(item.title)
                        .frame(width: .infinity,alignment: .center)
                    Spacer()
                }
            }
        }
    }
}
struct LabelView2: View {
    @State  var item: ChannelModel

    var body: some View {
        VStack(alignment: .leading,spacing: margin16){
            CustomHButton(action: {
                print("clicked 1")
            }) {
                VStack(alignment:.center,spacing: margin0){
                    Image(item.image)
                        .resizable()
                        .background(.clear)
                        .frame(width: 120,height: 120,alignment: .center)
                }
               .frame(width: 200,height: 200,alignment: .center)
            }
        }
    }
}
