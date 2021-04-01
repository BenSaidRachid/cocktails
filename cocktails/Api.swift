//
//  Api.swift
//  cocktails
//
//  Created by Rachid Ben said on 01/04/2021.
//

import Foundation

class Api {
    static var shared = Api()

    private let baseURL = "https://www.thecocktaildb.com/api/json/v1/1"
    private let session = URLSession(configuration: .default)
} 
