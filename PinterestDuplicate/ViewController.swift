//
//  ViewController.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-12.
//

import UIKit

class ViewController: UIViewController {
    
    
    var photos = [Photo]()

    @IBOutlet weak var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadData()
        collection.dataSource = self
        collection.delegate = self
        collection.register(UINib(nibName: "PhotoCell", bundle: nil), forCellWithReuseIdentifier: "ReusableCell")
    }

    func loadData() {
        photos.append(Photo(author: "fghjkl"))
        photos.append(Photo(author: "hjkl"))
        photos.append(Photo(author: "ghjk"))
        photos.append(Photo(author: "hhgjkl"))
    }

}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ReusableCell", for: indexPath) as! PhotoCell
        
        cell.authorLabel.text = photos[indexPath.row].author
        
        return cell
    }
    
    
}
