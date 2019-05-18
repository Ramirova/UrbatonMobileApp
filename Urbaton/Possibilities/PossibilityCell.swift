//
//  PossibilityCell.swift
//  Urbaton
//
//  Created by Розалия Амирова on 18/05/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class PossibilityCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    func setTitle(text: String) {
        titleLabel.text = text
    }
    
    func setInfoLabel(text: String) {
        self.infoLabel.text = text 
    }
}
