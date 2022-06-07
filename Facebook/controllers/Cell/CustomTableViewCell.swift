//
//  CustomTableViewCell.swift
//  Facebook
//
//  Created by Дария Бебчик on 07.06.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        nameLabel.text = nil
    }
    
    func configure(image: UIImage?, name: String?) {
        photoImageView.image = image
        nameLabel.text = name
    }
        

    
}
