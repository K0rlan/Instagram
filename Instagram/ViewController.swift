//
//  ViewController.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customNavigationBar: NavigationBarView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var stories = [Stories(name: "Koko", image: "avatar1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.delegate = self
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false

        
    }


}
extension ViewController: NavBarDelegate{
    func heartAction() {
        print("Likes Button Tapped")
    }
    func sendAction() {
        print("Direct Button Tapped")
    }
   
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
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
