//
//  FavouriteCell.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-19.
//

import UIKit

class FavouriteCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var authorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(photo: Photo) {
        //self.currentPhoto = photo
        image.sd_setImage(with: URL(string: photo.url))
        authorLabel.text = photo.author
        
    }
}
