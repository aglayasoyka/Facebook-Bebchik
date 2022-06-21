//
//  avatarUIView.swift
//  Facebook
//
//  Created by Дария Бебчик on 14.06.2022.
//

import UIKit

 class avatarUIView: UIView {
   
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var shadowView: UIView!
    
     @IBInspectable var shadowWidth:CGFloat = 8
     @IBInspectable var shadowСolor:UIColor = UIColor.black
     @IBInspectable var shadowOpacity:Float = 0.5
     
    var photoImage:UIImage? {
        didSet{
            avatarImageView.image = photoImage
        }
    }
    override init(frame: CGRect) {
        super .init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
    super .init(coder: coder)
        setup()
    }

    
    private func loadFromXiB() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "avatarUIView", bundle: bundle)
        let xibView = xib.instantiate(withOwner: self).first as! UIView
        return xibView
    }
    
    private func setup(){
        let xibView = loadFromXiB()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(xibView)
        
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.backgroundColor = .clear
        
        shadowView.layer.masksToBounds = false
        shadowView.layer.cornerRadius = 50
        shadowView.layer.shadowColor = shadowСolor.cgColor
        shadowView.layer.shadowOpacity = shadowOpacity
        shadowView.layer.shadowRadius = shadowWidth
        shadowView.layer.shadowOffset = CGSize.zero
        
        
    }
}


