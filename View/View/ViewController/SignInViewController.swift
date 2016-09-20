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
    
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var emailTextField: TextField!
    
    @IBOutlet weak var passwordTextField: TextField!
    
    @IBOutlet weak var signInButton: RaisedButton!
    
    @IBOutlet weak var signUpButton: RaisedButton!
    
    override var viewModelDelegate: ViewModelDelegate? {
        return viewModel
    }
    
    var viewModel: SignInViewModel?
    
    // MARK: Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cancelButton.rx_tap
              .subscribe(onNext: { [weak self] in
                
                self?.viewModel?.signInCommand()
              
              })
              .addDisposableTo(self.disposeBag)
    }
    
    
}
