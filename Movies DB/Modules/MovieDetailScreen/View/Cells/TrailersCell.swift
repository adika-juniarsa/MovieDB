//
//  TrailersCell.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import UIKit

protocol TrailersCellDelegate: class {
    func gotoPlayer(withIndex index: Int)
}

class TrailersCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    weak var delegate: TrailersCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(TrailersCell.tappedMe))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    func setupView(withTrailers trailer: Trailer?) {
        guard let trailer = trailer else { return }
        imageView.setImage(with: trailer.getThumbnail())
    }
    
    @objc func tappedMe() {
        delegate?.gotoPlayer(withIndex: self.tag)
    }
}
