//
//  LikeControlView.swift
//  Facebook
//
//  Created by Дария Бебчик on 16.06.2022.
//

import UIKit

@IBDesignable class LikeControlView: UIView {

    
    @IBOutlet weak var heartImageVIew: UIImageView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter = 0
    var isPressed = false
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func loadFromXIB() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: "LikeControlView", bundle: bundle)
        let xibView = xib.instantiate(withOwner: self).first as! UIView
        return xibView
    }
    
    private func setup() {
        let xibView = loadFromXIB()
        xibView.frame = self.bounds
        xibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(xibView)
    }

    @IBAction func pressLike(_ sender: UIButton) {
        isPressed = !isPressed
        
        if isPressed {
            counter += 1
            heartImageVIew.image = UIImage(systemName: "heart.fill")
            
        } else {
            counter -= 1
            heartImageVIew.image = UIImage(systemName: "heart")
            
        }
        
        counterLabel.text = String(counter)
    }
        
    }




