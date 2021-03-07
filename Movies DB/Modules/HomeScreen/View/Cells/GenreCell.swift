//
//  GenreCell.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import UIKit

protocol GenreCellDelegate: class {
    func selected(withIndex index: Int)
}

class GenreCell: BaseViewCell {

    @IBOutlet weak var viewBox: UIView!
    @IBOutlet weak var labelGenre: UILabel!
    
    weak var delegate: GenreCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func buttonSelectedTouchUp(_ sender: Any) {
        delegate?.selected(withIndex: self.tag)
    }
}
