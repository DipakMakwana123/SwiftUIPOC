//
//  ContentView.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 16/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MyTabView().background(Color.red)
    }
}


struct AppLaunchView: View {
    var body: some View{
        ContentView().background(.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


