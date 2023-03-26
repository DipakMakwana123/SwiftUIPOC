//
//  ContentView.swift
//  DSTV_TVOS
//
//  Created by Dipakbhai Valjibhai Makwana on 16/12/22.
//

import SwiftUI
enum FocusField: Hashable {
    case fieldId(Int)
}
//protocol BaseView: View {
//    var body: View {get set}
//}

struct ContentView: View {
    @State private var viewModel =  HomeViewModel()

    var body: some View {
        NavigationView {
            HStack(){
                VStack {
                    menuBar
                    Spacer()
                }.frame(width: 300)
                VStack {
                    listView
                }
            }
            .onAppear{

            }
        }
    }
}

extension ContentView {
    var menuBar: some View{
        VStack {
            HStack {
                ProfileView().focusable()
                SearchView().focusable()
            }.frame(height: 200).focusable(true)
            List {

                // TODO: Need to improve 
                ForEach(viewModel.items) { item in
                    // Hide disclosure indicator Code Start
                    VStack(alignment: .leading) {

                        if (item.id == .liveTV) {
                            NavigationLink(destination: LiveTVView()) {
                                    EmptyView()
                                }
                                .opacity(0)
                        }
                        else if (item.id == .tvShows) {
                            NavigationLink(
                                destination: TvShowView()) {
                                    EmptyView()
                                }
                                .opacity(0)
                        }
                        else if (item.id == .kids) {
                            NavigationLink(
                                destination: KidsView()) {
                                    EmptyView()
                                }
                                .opacity(0)
                        }
                        else if (item.id == .myList) {
                            NavigationLink(
                                destination: MyListView()) {
                                    EmptyView()
                                }
                                .opacity(0)
                        }
                        else if (item.id == .sports) {
                            NavigationLink(
                                destination: SportsView()) {
                                    EmptyView()
                                }
                                .opacity(0)
                        }

                        else if (item.id == .movies) {
                            NavigationLink(
                                destination: MoviesMainView()) {
                                    EmptyView()
                                }
                                .opacity(0)
                        }
                        else if (item.id == .channel) {
                            NavigationLink(
                                destination: ChannelMainView()) {
                                    EmptyView()
                                }
                                .opacity(0)
                        }
                        else if (item.id == .settings) {
                            NavigationLink(
                                destination: SettingMainView()) {
                                    EmptyView()
                                }
                                .opacity(0)
                        }
                        LabelView(item: item)
                    }.background(.clear)
                    // Hide disclosure indicator Code End
                }
                .listRowBackground(Color.black)
            }

        }
        .background(.black)
    }

    var listView: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                MovieView(contentMode:.fill)
                    .frame(width: UIScreen.main.bounds.size.width - 400,height: 300)
                MovieInfoView()
                    .zIndex(1)
            }
            List{
                ForEach(0...10, id: \.self) { item in
                    SectionView(title: "Section \(item)")
                    MovieItemView()
                        .frame(width:UIScreen.main.bounds.size.width - 400,height: 400)
                }
            }.frame(width: UIScreen.main.bounds.size.width - 400)
        }
    }
}
struct LabelView: View {
    @Environment(\.isFocused) var focused: Bool
    @FocusState private var focusedField: FocusField?
    @State  var item: DataModel

    var body: some View {
        Button(item.sectionTitle) {}
            .frame(maxWidth: .infinity, alignment: .leading)
            .focused($focusedField,equals: .fieldId(item.id.hashValue))
            .foregroundColor(focused ? .white : .white)

        if focused {
            Divider()
                .frame(height:5)
                .background(.blue)
        }
    }
}
struct TitleDescriptionView: View {
    @FocusState private var focusedField: FocusField?
    @Binding var item: SettingModel
    @State private var dataSource = DataSource()

    var body: some View {

        CustomButtonWithDescription(action: {

        }, content: {
            VStack(alignment:.leading){
                Text(item.title)
                    .frame(alignment: .leading)
                    .multilineTextAlignment(.leading)
                if item.selected {
                    Text(item.desc)
                        .foregroundColor(.gray)
                        .font(.system(size: 24))
                    Divider()
                        .frame(height: 5)
                        .background(.blue)
                }
            }
        }, item: $item)
        .padding(margin8)
        .onDisappear(){
            self.item.selected = false
        }
    }
}


