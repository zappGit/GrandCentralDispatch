//
//  SecondViewController.swift
//  GrandCentralDispatch
//
//  Created by Артем Хребтов on 17.07.2021.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image: UIImage? {
        get{
            return imageView.image
        }
        set {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
        
    }
    
    func getImage() {
        let imageURL = URL(string: "https://src.photogenica.ru/400/PHA/0004/PHA0004687.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let image = imageURL, let imageData = try? Data(contentsOf: image) else { return }
        self.image = UIImage(data: imageData)
    }
    
    
}
