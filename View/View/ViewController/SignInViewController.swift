//
//  SignInViewController.swift
//  View
//
//  Created by Giáp Trần on 9/7/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import ViewModel
import RxSwift
import RxCocoa
import Model
import Material

class SignInViewController: ViewController {

    // MARK: Property
    
    @IBOutlet weak var emailTextField: TextField!
    
    @IBOutlet weak var passwordTextField: TextField!
    
    @IBOutlet weak var signInButton: RaisedButton!
    
    @IBOutlet weak var signUpButton: RaisedButton!
    
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    override var viewModelDelegate: ViewModelDelegate? {
        return viewModel
    }
    
    var viewModel: SignInViewModel?
    
    // MARK: Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    // MARK: Override method
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .Default
    }
    
}
