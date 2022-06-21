//
//  CustomTableViewCell.swift
//  Facebook
//
//  Created by Дария Бебчик on 07.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: avatarUIView!
    @IBOutlet weak var nameLabel: UILabel!
     

    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.photoImage = nil
        nameLabel.text = nil
        
        
    }
    
    func configure(image: UIImage?, name: String?) {
        photoImageView.photoImage = image
        nameLabel.text = name
        
    }
        
    func configure(_ group: Group) {
        photoImageView.photoImage = UIImage(named: group.avatar)
        nameLabel.text = group.name
    }
    
}
