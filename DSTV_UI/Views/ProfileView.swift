//
//  ProfileView.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 03/01/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 60, height: 60)
                .cornerRadius(10)

            Image(systemName: "face.smiling.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
            .zIndex(1)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
