//
//  CustomTableViewCell.swift
//  cocktails
//
//  Created by Rachid Ben said on 02/04/2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var picture: UIImageView!
    
    func setImageToImageView(url imageUrl: String) {
        fetchImage(from: imageUrl) { (imageData) in
            
            print(imageData)
            if let data = imageData {
                DispatchQueue.main.async {
                    self.picture.image = UIImage(data: data)
                }
            } else {
                print("Error loading image");
            }
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
