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
            print(favourites)
        }
        
        self.favouritesCollection.reloadData()
        
    }
    
}

extension FavouritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favourites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouritesCell", for: indexPath) as! FavouriteCell
        cell.configure(photo: favourites[indexPath.row])
        
        return cell
    }
    
    
}
