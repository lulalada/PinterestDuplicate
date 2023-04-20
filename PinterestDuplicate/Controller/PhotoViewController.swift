//
//  PhotoViewController.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-20.
//

import UIKit
import Alamofire
import SDWebImage

class PhotoViewController: UIViewController {
    
    var url = "https://picsum.photos/id/"
    var id: String = ""
    
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImage.contentMode = .scaleAspectFill
        // Do any additional setup after loading the view.
        loadData()
    }

    func loadData() {
        url.append(id)
        url.append("/info")
        print(url)
        let request = AF.request(url)
        
        request.responseDecodable (of: Photo.self) { (response) in
            guard let responsePhoto = response.value else {return}
            print(responsePhoto)
            self.photoImage.sd_setImage(with: URL(string: responsePhoto.url))
            self.authorLabel.text = responsePhoto.author
        }
    }
}
