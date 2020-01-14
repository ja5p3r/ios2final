//
//  picCollectionViewCell.swift
//  jasper
//
//  Created by User07 on 2019/6/23.
//  Copyright © 2019 User07. All rights reserved.
//

import UIKit

class picCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBAction func buttonPressed(_ sender: Any) {
        textField.text = "按三小 手賤逆"
    }
    
    
    
    var imageURL: URL!
    
}
