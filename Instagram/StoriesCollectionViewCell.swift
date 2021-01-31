//
//  StoriesCollectionViewCell.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeImageRound()
        
    }
    
    func makeImageRound(){
        let gradient = CAGradientLayer()
        
        gradient.colors = [UIColor.blue.cgColor, UIColor.green.cgColor]
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
        imageView.layer.addSublayer(gradient)
    }
}
