//
//  fetchImage.swift
//  cocktails
//
//  Created by Rachid Ben said on 05/04/2021.
//

import Foundation

func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
    let session = URLSession.shared
    let url = URL(string: urlString)
        
    let dataTask = session.dataTask(with: url!) { (data, response, error) in
        if error != nil {
            print("Error fetching the image! 😢")
            completionHandler(nil)
        } else {
            completionHandler(data)
        }
    }
        
    dataTask.resume()
}
