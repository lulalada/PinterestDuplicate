//
//  PhotoCellDelegate.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-20.
//

import Foundation
protocol PhotoCellDelegate: AnyObject
{
    func addToFavourites(photo: Photo) 
}
