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
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    let toTabBarController = "toTabBarController"
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
    
    @IBAction func TapLoginButton(_ sender: UIButton) {
       
        UIView.animate( withDuration: 0.5,
                       delay: 0,
                        usingSpringWithDamping: 0.5 ,
                       initialSpringVelocity:0 ,
                       options: [],
                       animations: {
            self.LoginButton.frame.origin.y += 100
            self.LoginButton.alpha = 0
        },
                       completion: nil)
        
        UIView.animate(withDuration: 0.5,
                       animations: {
            self.ImageViewLogo.transform = CGAffineTransform(translationX: 0, y: -80)
            self.emailTextField.transform =  CGAffineTransform(translationX: -400, y: 0)
            self.passwordTextField.transform =  CGAffineTransform(translationX: 400, y: 0)
        },
                       completion: { [self] _ in self.performSegue(withIdentifier: toTabBarController, sender: nil)
            
        })
        
        
    }
}
