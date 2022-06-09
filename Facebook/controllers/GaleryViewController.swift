//
//  GaleryViewController.swift
//  Facebook
//
//  Created by Дария Бебчик on 09.06.2022.
//

import UIKit

class GaleryViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let photoCollectionViewCellReuseIdentifier = "phtoCollectionViewCellReuseIdentifier"
    
    var fotoAlbum = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: photoCollectionViewCellReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    



}
extension GaleryViewController: UICollectionViewDelegate{
    
}

extension GaleryViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.fotoAlbum.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCollectionViewCellReuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.configure(image: UIImage(named: self.fotoAlbum[indexPath.item]))
        
        return cell
    }
    
}

extension GaleryViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let width = collectionView.bounds.width
        let whiteSpaces: CGFloat = 20
        let cellWidth = width / 3 - whiteSpaces

        return CGSize(width: cellWidth, height: cellWidth)
    }
}

