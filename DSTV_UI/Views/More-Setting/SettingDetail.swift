//
//  SettingDetail.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct SettingDetail: View {
    private let viewModal: SettingDetailViewModal = SettingDetailViewModal()
    
    @State var isToggle: Bool = false
    
    var body: some View {
        Form {
            
            ForEach(viewModal.lists,id:\.id) {item in
                SectionHeader(strTitle: item.title ?? "")
                    ForEach(item.lists,id:\.id) {subItem in
                        SettingToggleView(subItem:subItem, isToggle: $isToggle)
                    }
            
            }
        }
        .background(Color(UIColor.systemRed).opacity(0.9))
    }
}

struct SectionHeader: View {
    var strTitle: String
    
    var body: some View {
        HStack {
            Text(strTitle)
                .foregroundColor(Color.blue)
                .font(.system(size: 12, weight: .bold, design: .default))
        }
    }
}
struct TextLabel: View {
    var strTitle: String
    
    var body: some View {
       // HStack {
            Text(strTitle)
                .foregroundColor(Color.white)
                .font(.system(size: 14, weight: .regular, design: .default))
            Spacer()
       // }
        
    }
}
struct SectionHeaderWithArrow: View {
    
    var str: String
    var isChangeImage: Bool
    
    var body: some View {
        HStack {
            LogoImageView()

            Text(str)
                .foregroundColor(Colors.white)
                //.frame(maxWidth: .infinity, alignment: .leading)
                //.font(.system(size: 14, weight: .bold, design: .default))
            Spacer()

            Image(systemName: isChangeImage ? "chevron.up" : "chevron.down")
                .foregroundColor(.white)
        }.background(Color.black)
    }
}
