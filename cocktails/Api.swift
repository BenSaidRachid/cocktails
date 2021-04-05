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
    
    func listCocktailsByLetter(_ letter: String, completion: @escaping (Cocktails?) -> Void) {
        guard let url = URL(string: "\(baseURL)/search.php?f=\(letter)") else {
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let cocktails = try decoder.decode(Cocktails.self, from: data)
                    DispatchQueue.main.async { completion(cocktails) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil) }
                    print("Deserialisation failed")
                }
            } else {
                DispatchQueue.main.async { completion(nil) }
                print("No data")
            }
        }

        task.resume()
    }
} 
