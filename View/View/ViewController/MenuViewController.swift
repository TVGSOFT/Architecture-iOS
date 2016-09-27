//
//  MenuViewController.swift
//  View
//
//  Created by Giáp Trần on 9/20/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import UIKit
import ViewModel

class MenuViewController: ViewController {

    // MARK: Property
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatarImageView.layer.cornerRadius = 50
        avatarImageView.layer.borderWidth = 2.0
        avatarImageView.layer.borderColor = UIColor.appTintColor.CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
