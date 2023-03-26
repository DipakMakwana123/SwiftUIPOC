//
//  SegmentPicker.swift
//  LearningWithPOC
//
//  Created by Dipakbhai Valjibhai Makwana on 19/04/22.
//

import SwiftUI

struct SegmentPicker: View {
    
    @State private var selectedItem = "This Device"
    var colors = ["This Device", "Other Device"]
    
    var body: some View {
        VStack {
            Picker("", selection: $selectedItem) {
                ForEach(colors, id: \.self) {
                    Text($0)
                        .foregroundColor(Color(UIColor.systemRed))
                }
            }
            .background(Color(UIColor.systemGray))
            .pickerStyle(.segmented)
            Text("Selected Value: \(selectedItem)")
            Spacer()
        }
    }
}
