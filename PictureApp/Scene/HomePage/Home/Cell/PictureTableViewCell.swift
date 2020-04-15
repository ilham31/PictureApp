//
//  PictureTableViewCell.swift
//  PictureApp
//
//  Created by Ilham on 14/04/20.
//  Copyright © 2020 ilham. All rights reserved.
//

import UIKit

class PictureTableViewCell: UITableViewCell {
    
    @IBOutlet weak var animalPicture: UIImageView!
    
    func updateCell(_ image: UIImage) {
        animalPicture.image = image
    }
}
