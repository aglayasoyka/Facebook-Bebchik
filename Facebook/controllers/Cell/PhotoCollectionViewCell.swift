//
//  PhotoCollectionViewCell.swift
//  Facebook
//
//  Created by Дария Бебчик on 09.06.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
   
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    func configure(image: UIImage?) {
        photoImageView.image = image
    }

}
