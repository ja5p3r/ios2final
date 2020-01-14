//
//  CityTableViewCell.swift
//  jasper
//
//  Created by User07 on 2019/6/22.
//  Copyright © 2019 User07. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var endtime: UILabel!
    @IBOutlet weak var begintime: UILabel!
    @IBOutlet weak var daybegin: UILabel!
    @IBOutlet weak var dayend: UILabel!
    @IBOutlet weak var weatherdescription: UILabel!
    @IBOutlet weak var lowtem: UILabel!
    @IBOutlet weak var hightem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
