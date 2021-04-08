//
//  ImageTableViewCell.swift
//  cocktails
//
//  Created by Rachid Ben said on 08/04/2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imgView: UIImageView!
 
    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.layer.cornerRadius = 20
        imgView.clipsToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
