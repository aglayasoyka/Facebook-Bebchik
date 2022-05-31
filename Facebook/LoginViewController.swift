//
//  ViewController.swift
//  Facebook
//
//  Created by Дария Бебчик on 24.05.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var ImageViewLogo: UIImageView!
    
    @IBOutlet weak var loginView: UIView!
    
    var isLogoChanged = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(changeView))
        loginView.addGestureRecognizer(recognizer)

}
    @objc func changeView( sender: UITapGestureRecognizer){
        if isLogoChanged {
            self.ImageViewLogo.image = UIImage(named: "logo2")
            
        } else {
            self.ImageViewLogo.image = UIImage(named: "logo")
            
        }
        isLogoChanged.toggle()
        
    }
}
