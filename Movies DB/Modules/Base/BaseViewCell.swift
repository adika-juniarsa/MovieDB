//
//  BaseViewCell.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import Foundation
import UIKit

class BaseViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
