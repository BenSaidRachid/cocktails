//
//  DetailViewController.swift
//  cocktails
//
//  Created by Rachid Ben said on 01/04/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var glass: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var instructions: UITextView!
    @IBOutlet weak var image: UIImageView!
    var cocktail: Cocktail?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let cocktail = self.cocktail {
            name.text = cocktail.name
            glass.text = cocktail.glass
            category.text = cocktail.category
            instructions.text = cocktail.instructions
            if let image = cocktail.image {
                setImageToImageView(imageUrl: image)
            }
        }
    }

    func setImageToImageView(imageUrl url: String) {
        fetchImage(from: url, completionHandler: { (imageData) in
                if let data = imageData {
                    DispatchQueue.main.async {
                        self.image.image = UIImage(data: data)
                    }
                } else {
                    print("Error loading image");
                }
            })
    }
}
