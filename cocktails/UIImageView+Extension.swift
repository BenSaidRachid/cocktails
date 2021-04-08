//
//  UIImageView+Extension.swift
//  cocktails
//
//  Created by Rachid Ben said on 08/04/2021.
//

import Foundation
import UIKit

extension UIImageView {
    func fetchImage(from urlString: String?) {
        guard let urlString = urlString else { return }
        let session = URLSession.shared
        let url = URL(string: urlString)
            
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error fetching the image! 😢")
                DispatchQueue.main.async { self.image = nil }
            } else if let data = data {
                DispatchQueue.main.async { self.image = UIImage(data: data) }
            }
        }
            
        dataTask.resume()
    }
}
