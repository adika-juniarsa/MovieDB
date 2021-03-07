//
//  MovieCell.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import UIKit
import Kingfisher

protocol MovieCellDelegate: class {
    func showDetailPage(withIndex index: Int)
}

class MovieCell: BaseViewCell {

    @IBOutlet weak var imageMovie: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewBox: UIView!
    
    weak var delegate: MovieCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBox.applyShadow()
    }
    
    func setupView(withData data: Movie?) {
        guard let data = data else { return }
        labelTitle.text = data.title
        imageMovie.setImage(with: data.imageUrl())
    }
    
    @IBAction func buttonActionTouchUp(_ sender: Any) {
        delegate?.showDetailPage(withIndex: self.tag)
    }
}
