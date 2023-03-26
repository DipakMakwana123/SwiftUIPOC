//
//  NavigationBar.swift
//  Pargo_SwiftUI
//
//  Created by Apple on 11/01/22.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        
        
        NavigationView {
            
                Text("")
        
                .navigationBarItems(leading:
                                        HStack {
                    Button(action: {
                        print("Apple button tapped!")
                    }) {
                        Image(systemName: "applelogo")
                    }
                    .padding()
                    .accentColor(.black)
                    
                }, trailing:
                                        HStack {
                    Button(action: {
                        print("Info button tapped!")
                    }) {
                        Image(systemName: "magnifyingglass")
                    }
                    .accentColor(.black)
                }
                )
                
        }
        
        
    }
}


