//
//  Cocktail.swift
//  cocktails
//
//  Created by Rachid Ben said on 01/04/2021.
//

import Foundation

struct Cocktails: Decodable {
    let drinks: [Cocktail]
}

struct Cocktail: Decodable {
    let name: String
    let category: String?
    let glass: String?
    let instructions: String?
    let image: String?
    
    private enum CodingKeys : String, CodingKey {
        case name = "strDrink"
        case category = "strCategory"
        case glass = "strGlass"
        case instructions = "strInstructions"
        case image = "strDrinkThumb"
    }
}
