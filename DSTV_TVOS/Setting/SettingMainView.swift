//
//  SettingMainView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 09/02/23.
//

import SwiftUI

struct SettingMainView: View {
    @ObservedObject var viewModel =  SettingViewModel()

    @State private var isOn = false

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: margin0) {
                HStack(spacing: margin16) {
                    VStack(spacing: margin0) {
                        logoView
                            .frame(height: 250)
                        VStack(spacing: margin0) {
                            listView
                        }
                        
                    }.frame(width: geometry.size.width * 0.30)
                    VStack {
                        detailView(width: geometry.size.width * 0.70, height: geometry.size.height)
                    }
                }
            }
        }.background(.white.opacity(0.1))
    }
    private var listView: some View {
        List {
            ForEach($viewModel.items) { $item in
                VStack(alignment: .leading) {
                    TitleDescriptionView(item: $item)

                }.background(.clear)
            }
            .listRowBackground(Color.clear)
        }
    }
    private func detailView(width: CGFloat,height: CGFloat) -> some View{
        ForEach($viewModel.items) { $item in
            if item.selected, item.id == .aboutUs {
                aboutUsView
                    .frame(width: width,height: height,alignment: .topLeading)
                    .background(.black)
            }
            else  if item.selected, item.id == .linkedDevice{
                linkedDevicesView()
                .frame(width: width,height: height)
                .background(.black)
            }
            else  if item.selected, item.id == .streamingQuality {
                streamingView()
                    .frame(width: width,height: height,alignment: .topLeading)
                    .background(.black)
            }
            else  if item.selected, item.id == .autoPlay {
                autoPlayView()
                    .frame(width: width,height: height,alignment: .topLeading)
                    .background(.black)
            }
            else  if item.selected, item.id == .signOut {
                signOutView()
                    .frame(width: width,height: height,alignment: .topLeading)
                    .background(.black)
            }
            else {
                VStack {

                }
            }
        }
    }
    private func linkedDevicesView() -> some View {
        VStack(spacing: margin16) {
            ForEach(viewModel.deviceList) { item in
                HStack(spacing: margin0) {
                    VStack(spacing: margin0) {
                        configureText(text: item.title)
                    }
                    Button {
                        print("button was tapped")
                    } label: {
                        Text(item.isRegistered ? "Remove" : "Register")
                    }
                    .buttonStyle(.bordered)
                    Divider()

                }
                .frame(alignment: .leading)
            }
        }
    }
    private func streamingView() -> some View {
        VStack(spacing: margin16) {
            configureText(text: "Select the resolution you would like to use:")
            ForEach(viewModel.stremingList) { item in
                HStack(spacing: margin0) {
                    Button {
                        print("button was tapped")
                    } label: {
                        let imageName = item.selected ? "checkmark.circle.fill" : "circle"
                        Image(systemName: imageName)
                    }
                    .buttonStyle(.plain)
                    VStack(spacing: margin0) {
                        configureText(text: item.title)
                            .font(.headline)
                        configureText(text: item.subTitle)
                    }
                }
                .frame(alignment: .leading)
            }
        }
    }
    private func autoPlayView() -> some View {
        VStack(spacing: margin16) {
            configureText(text: "Autoplay Next Episode")
            HStack {
                configureText(text: "After an episode,automatically play next episode")
                Spacer()
                Toggle(isOn: $isOn){

                }
                .frame(width: 200)
            }
        }
    }
    private func signOutView() -> some View {
        VStack(spacing: margin16) {
            HStack {
                configureText(text: "Sign me out")
                Spacer()
                Button {

                } label: {
                    Text("Yes")
                }
                .buttonStyle(.bordered)
            }
            configureText(text: "You will require username and password to sign in again.")
        }
    }
    private var aboutUsView: some View {
        VStack(spacing: margin16) {
            configureText(text: "DStv Version")
                .font(.headline)
            configureText(text: "Version 1.25.1(1)")
            configureText(text: "For DStv Terms and Condition Please go to")
            configureText(text: "https://now.dstv.com/termsAndConditions/index.html")
        }
    }
    private func configureText(text: String) -> some View{
        Text(text)
            .padding(margin16)
            .frame(maxWidth: .infinity, alignment: .leading)
           // .background(.black)
    }

    private var logoView: some View{
        VStack(spacing: margin0) {
            Image("discovery")
                .resizable()
                .frame(width: 50,height: 50)
                .padding(margin8)

            Text("DStv Account")
                .padding(margin8)
            Text("Manage your DStv viewing experience")
                .lineLimit(0)
                .truncationMode(.tail)
        }
    }
}
