//
//  ProfileTableViewCell.swift
//  PictureApp
//
//  Created by Ilham on 14/04/20.
//  Copyright © 2020 ilham. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameAndEmail: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    func setupCell(_ email: String) {
        nameAndEmail.text = "Raka Purnama (" + email + ")"
        gender.text = "Male"
        phoneNumber.text = "+62876543210"
    }
}
