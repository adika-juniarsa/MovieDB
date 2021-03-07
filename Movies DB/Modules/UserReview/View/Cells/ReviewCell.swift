//
//  ReviewCell.swift
//  Movies DB
//
//  Created by Alo-Adika on 07/03/21.
//

import UIKit

class ReviewCell: BaseViewCell {

    @IBOutlet weak var viewBox: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBox.applyShadow()
        viewBox.setRadius(8)
    }
    
    func setupView(withData data: Review?) {
        guard let data = data else { return }
        
        labelName.text = data.author
        labelDate.text = data.getReleaseDate()
        labelRating.text = "\(data.authorDetails?.rating ?? 0)"
        labelContent.text = data.content
    }
}
