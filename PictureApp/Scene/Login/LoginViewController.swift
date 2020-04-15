//
//  LoginViewController.swift
//  PictureApp
//
//  Created by Ilham on 14/04/20.
//  Copyright (c) 2020 ilham. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SwiftMessages

protocol LoginDisplayLogic: class {
    func displaySuccessLogin()
    func displayErrorSaveData(_ message: String)
}

class LoginViewController: UIViewController {
    var email: String!
    var password: String!
    var interactor: LoginBusinessLogic?
    var router: LoginRoutingLogic?
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // MARK: Setup
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
      setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
    
    // MARK: View lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        interactor?.checkLoginData()
    }
    
    @IBAction func loginButtontapped(_ sender: Any) {
        email = emailField.text
        password = passwordField.text
        interactor?.saveLoggedinData(email: email ?? "", password: password ?? "")
    }
}

extension LoginViewController: LoginDisplayLogic {
    func displaySuccessLogin() {
        router?.routeToHomePage()
    }
    
    func displayErrorSaveData(_ message: String) {
        let messageAlert = MessageView.viewFromNib(layout: .messageView)
        messageAlert.configureTheme(.error)
        messageAlert.configureContent(title: "Error", body: message)
        messageAlert.button?.isHidden = true
        
        SwiftMessages.show(view: messageAlert)
    }
}