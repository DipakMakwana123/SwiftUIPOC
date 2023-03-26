//
//  ListModifier.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 26/12/22.
//

import SwiftUI

struct ListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Colors.black)
            .scrollContentBackground(.hidden)
            .listStyle(PlainListStyle())
            .listRowBackground(Colors.black)
    }
}
