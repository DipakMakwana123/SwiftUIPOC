//
//  CustomText.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI

struct CustomText : View {
    var name:String?
    var body: some View {
        Text(name ?? "Dipak")
            .font(.body)
            .textCase(.uppercase)
            .foregroundColor(.white)
    }
}
