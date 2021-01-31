//
//  StoriesTableViewCell.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit

class StoriesTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var stories = [Stories(name: "Koko", image: "1"), Stories(name: "Aru", image: "2"), Stories(name: "China", image: "3"), Stories(name: "Samat", image: "4"), Stories(name: "Bola", image: "5"), Stories(name: "Danik", image: "6"), Stories(name: "Yuri", image: "7")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoriesCollectionViewCell
        let story = stories[indexPath.row]
        cell.imageView.image = UIImage(named: story.image)
        cell.textLabel.text = story.name
        
        return cell
    }

}
