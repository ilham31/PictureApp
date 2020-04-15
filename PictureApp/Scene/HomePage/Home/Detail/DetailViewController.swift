//
//  DetailViewController.swift
//  PictureApp
//
//  Created by Ilham on 14/04/20.
//  Copyright © 2020 ilham. All rights reserved.
//

import UIKit
import ImageSlideshow

class DetailViewController: UIViewController {
    
    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    static func instantiate() -> DetailViewController {
        return UIStoryboard(name: "Detail", bundle: nil).instantiateInitialViewController() as! DetailViewController
    }
    
    @IBOutlet weak var fullScreenImage: ImageSlideshow!
    
    let localSource = [BundleImageSource(imageString: "cat1"), BundleImageSource(imageString: "cat2"), BundleImageSource(imageString: "cat3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullScreenImage.slideshowInterval = 5.0
        fullScreenImage.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        fullScreenImage.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        fullScreenImage.pageIndicator = pageControl
        fullScreenImage.activityIndicator = DefaultActivityIndicator()
        fullScreenImage.setImageInputs(localSource)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
        fullScreenImage.addGestureRecognizer(recognizer)
    }
    
    @objc func didTap() {
        let fullScreenController = fullScreenImage.presentFullScreenController(from: self)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
}
