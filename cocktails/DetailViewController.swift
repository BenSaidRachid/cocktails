//
//  DetailViewController.swift
//  cocktails
//
//  Created by Rachid Ben said on 01/04/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var text: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let text = self.text {
            textLabel.text = text
        }
    }

}
