//
//  PhotoCell.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-12.
//

import UIKit


class PhotoCell: UICollectionViewCell {
    
    weak var delegate:PhotoCellDelegate?
    var id: Int = 0
    var currentPhoto: Photo!
    var isAdded = false
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
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
    
    @IBAction func addToFavourite(_ sender: UIButton) {
        favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        isAdded = true
        delegate?.addToFavourites(photo: currentPhoto)

    }
}
