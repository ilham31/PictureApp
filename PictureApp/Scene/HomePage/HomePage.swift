//
//  HomePage.swift
//  PictureApp
//
//  Created by Ilham on 14/04/20.
//  Copyright © 2020 ilham. All rights reserved.
//

import UIKit

class HomePage: UITabBarController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: true);
        self.navigationItem.title = "Picture App"
    }
}
