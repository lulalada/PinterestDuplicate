//
//  FavouriteCell.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-19.
//

import UIKit

class FavouriteCell: UICollectionViewCell {
    
    weak var delegate:FavouriteCellDelegate?
    var id: Int = 0
    var currentPhoto: Photo!

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        image.contentMode = .scaleAspectFill
        // Initialization code
    }
    func configure(photo: Photo) {
        self.currentPhoto = photo
        image.sd_setImage(with: URL(string: photo.url))
        authorLabel.text = photo.author
        
    }
    
    override func layoutSubviews() {
        self.layer.cornerRadius = 15.0
    }
    
    @IBAction func deleteFromFavourites(_ sender: UIButton) {
        delegate?.deleteFromFavourites(photo: currentPhoto)
    }
    
}
