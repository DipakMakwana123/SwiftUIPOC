//
//  ItemData.swift
//  Expandable_Menu_Items
//
//  Created by Anmol Maheshwari on 03/11/20.
//

import Foundation
import UIKit

struct ItemData: Identifiable {
    let id = UUID()
    let name: String
   // let image: UIImage
    var subItems: [ItemData]?
    
    static private let itemsA = [ItemData(name: "A - 1"),
                                 ItemData(name: "A - 2"),
                                 ItemData(name: "A - 3"),
                                 ItemData(name: "A - 4")]
    
    static private let itemsBB = [ItemData(name: "BB - ")]
    
    static private let itemsB = [ItemData(name: "B - 1"),
                                 ItemData(name: "B - 2"),
                                 ItemData(name: "B - 3"),
                                 ItemData(name: "B - 4")]
    
    static private let itemsC = [ItemData(name: "C - 1"),
                                 ItemData(name: "C - 2"),
                                 ItemData(name: "C - 3"),
                                 ItemData(name: "C - 4")]
    
    static let FirstData = ItemData(name: "First", subItems: ItemData.itemsA)
    
    static let SecondData = ItemData(name: "Second", subItems: ItemData.itemsB)
    
    static let ThirdData = ItemData(name: "Third", subItems: ItemData.itemsC)
}
