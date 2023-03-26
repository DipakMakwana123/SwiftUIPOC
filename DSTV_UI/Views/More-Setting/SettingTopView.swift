//
//  SettingTopView.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct SettingTopView: View {
    var body: some View {
        VStack{
            ProfileListView()
            EditProfileView()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4.5 )
        .background(Color.black)
        Divider()
            .background(Color.gray)
    }
}


struct ProfileListView: View {
    var body: some View{
        ScrollView(.horizontal,content: {
            LazyHStack(spacing:margin16) {
                ForEach(0...5, id: \.self) { item in
                    VStack {
                        ProfileView()
                        Text("John")
                            .foregroundColor(.white)
                    }
                }
            }
        })
    }
}
struct EditProfileView: View {
    var body: some View{
        HStack(alignment: .center){
            Image(systemName: "pencil.circle")
                .renderingMode(.template)
                .foregroundColor(.white)
            Text("Edit Profile")
                .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width, height: 50)
        .background(Color.clear)
        .accentColor(.white)
    }
}


