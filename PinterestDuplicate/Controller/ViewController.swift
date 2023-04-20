//
//  ViewController.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-12.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
class ViewController: UIViewController {
    
    let url = "https://picsum.photos/v2/list?page=2&limit=100"
    var photos = [Photo]()
    var favourites = [Photo]()
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "ReusableCell")
        loadData()
    }

    func loadData() {
       
        let request = AF.request(url)
        
        request.responseDecodable (of: [Photo].self) { (response) in
            guard let responsePhoto = response.value else {return}
            for item in responsePhoto {
                self.photos.append(item)
            }
            //defaults.set(photos, forKey: "FavouritesArray")
            self.collection.reloadData()
        }
    }
}



//MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as! PhotoCell
        cell.configure(photo: photos[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    
}
//MARK: - PhotoCellDelegate
extension ViewController: PhotoCellDelegate {
    func addToFavourites(photo: Photo) {
        print(photo)
        favourites.append(photo)
        print(favourites)
        if let data = try? PropertyListEncoder().encode(favourites) {
            defaults.set(data, forKey: "FavouritesArray")
        }
    }
    
    
}
