//
//  ViewController.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-12.
//

import UIKit
import Alamofire
import SDWebImage
class ViewController: UIViewController {
    
    let url = "https://picsum.photos/v2/list?page=2&limit=100"
    var photos = [Photo]()
    var favourites = [Photo]()
    let defaults = UserDefaults.standard
    var position = 0
    
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
            self.collection.reloadData()
        }
        
        if let data = UserDefaults.standard.data(forKey: "FavouritesArray"){
           favourites = try! PropertyListDecoder().decode([Photo].self, from: data)
        }
    }
}



//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        position = indexPath.row
        performSegue(withIdentifier: "goToPhoto", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let secondVC = segue.destination
          as? PhotoViewController else {return}
        //secondVC.delegate = self

        if segue.identifier == "goToPhoto" {
            secondVC.id = photos[position].id
        }

    }
}

//MARK: - UICollectionViewDataSource
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
