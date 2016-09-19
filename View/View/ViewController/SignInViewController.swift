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

class SignInViewController: ViewController {

    // MARK: Property
    
    @IBOutlet weak var cancelButton: UIButton!
    
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
