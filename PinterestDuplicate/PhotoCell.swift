//
//  PhotoCell.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-12.
//

import UIKit

class PhotoCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.contentMode = .scaleAspectFill

        // Initialization code
    }

    override func layoutSubviews() {
        self.layer.cornerRadius = 15.0
    }
}
