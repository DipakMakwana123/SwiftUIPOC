//
//  Extension.swift
//  DSTV_UI
//
//  Created by Dipakbhai Valjibhai Makwana on 26/03/23.
//

import Foundation
extension Data {

    public var json: Any? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: [])
        } catch let error {
            debugLog("Data+JSON", message: "Failed to process response data: \(error)")
            return nil
        }
    }

}
