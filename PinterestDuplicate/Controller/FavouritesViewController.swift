//
//  FavouritesViewController.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-20.
//

import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet weak var favouritesCollection: UICollectionView!
    var favourites = [Photo]()
    var position = [IndexPath]()

    override func viewDidLoad() {
        super.viewDidLoad()
        favouritesCollection.dataSource = self

        favouritesCollection.register(UINib(nibName: "FavouriteCell", bundle: nil), forCellWithReuseIdentifier: "FavouritesCell")
        loadData()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
    }
    
    func loadData() {
       
        if let data = UserDefaults.standard.data(forKey: "FavouritesArray"){
           favourites = try! PropertyListDecoder().decode([Photo].self, from: data)
        }
        
        self.favouritesCollection.reloadData()
        
    }
    
}

//MARK: - UICollectionViewDataSource
extension FavouritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouritesCell", for: indexPath) as! FavouriteCell
        cell.configure(photo: favourites[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    
}

//MARK: - FavouriteCellDelegate
extension FavouritesViewController: FavouriteCellDelegate {
    func deleteFromFavourites(photo: Photo) {
        if let index = favourites.firstIndex(where: { value in
            return value == photo
        }) {
            favourites.remove(at: index)
        }
        if let data = try? PropertyListEncoder().encode(favourites) {
            UserDefaults.standard.set(data, forKey: "FavouritesArray")
        }
        
        favouritesCollection.reloadData()
    }
}
