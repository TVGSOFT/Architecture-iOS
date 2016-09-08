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

class SignInViewController: ViewController {

    // MARK: Property
    
    @IBOutlet weak var button: UIButton!
    
    internal override var viewModelDelegate: ViewModelDelegate? {
        return super.viewModelDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.rx_tap
              .subscribe(onNext: { [weak self] in
                self?.doSomething()
              })
              .addDisposableTo(self.disposeBag)
    }
    
    func doSomething() {
        let alertView = UIAlertView(
            title: "RxExample",
            message: "This is wonderful",
            delegate: nil,
            cancelButtonTitle: "OK"
        )
        
        alertView.show()
    }
    
}
