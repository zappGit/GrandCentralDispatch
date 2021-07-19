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
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
        delay(delay: 5) {
            self.loginAlert()
        }
        
        
    }
    
    func loginAlert() {
        let ac = UIAlertController(title: "Регистрейшн?", message: "Введите логин и пассворд", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        ac.addTextField { loginTF in
            loginTF.placeholder = "Введите логин плз"
        }
        ac.addTextField { passwordTF in
            passwordTF.placeholder = "Введите пассворд плз"
            passwordTF.isSecureTextEntry = true
        }
        ac.addAction(ok)
        ac.addAction(cancel)
        present(ac, animated: true)
    }
    
    func delay (delay: Int, closure: @escaping () -> ()){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
    
    func getImage() {
        let imageURL = URL(string: "https://src.photogenica.ru/400/PHA/0004/PHA0004687.jpg")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            guard let image = imageURL, let imageData = try? Data(contentsOf: image) else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)
            }
            
        }
            
        
       
    }
    
    
}
