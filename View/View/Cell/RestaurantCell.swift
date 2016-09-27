//
//  RestaurantCell.swift
//  View
//
//  Created by Giáp Trần on 9/17/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import UIKit

class RestaurantCell: BaseTableViewCell {

    // MARK: Property
    
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
