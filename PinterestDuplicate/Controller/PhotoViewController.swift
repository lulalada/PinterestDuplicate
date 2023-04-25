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
    @IBOutlet weak var urlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        photoImage.contentMode = .scaleAspectFill
        loadData()
    }

    func loadData() {
        url.append(id)
        url.append("/info")
        let request = AF.request(url)
        
        request.responseDecodable (of: Photo.self) { (response) in
            guard let responsePhoto = response.value else {return}
            self.photoImage.sd_setImage(with: URL(string: responsePhoto.url))
            self.authorLabel.text = responsePhoto.author
            let attributedString = NSMutableAttributedString(string: "You can download here")
            let url = URL(string: responsePhoto.url)!
            attributedString.addAttribute(.link, value: url, range: NSRange(location: 0, length: attributedString.length))
            self.urlLabel.attributedText = attributedString
        }
    }
}
