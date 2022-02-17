//
//  Color.swift
//  ColorHexCodesList
//
//  Created by Hamit Seyrek on 16.02.2022.
//

import Foundation

struct Color : Decodable, Identifiable {
    var id = UUID()
    let name : String
    let hexCode : String
    
    private enum CodingKeys : String, CodingKey {
        case name  = "name"
        case hexCode = "hex"
    }
}
