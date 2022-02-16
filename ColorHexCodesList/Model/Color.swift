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
    
    private enum XodingKeys : String, CodingKey {
        case name  = "name"
        case code = "hex"
    }
}
