//
//  ViewController.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNavigationBar: NavigationBarView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var stories = [Stories(name: "Koko", image: "avatar1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1")]
    
    var posts = [Posts(user: Stories(name: "Koko", image: "ava1"), postImage: "avatar1", postText: "kanfl"), Posts(user: Stories(name: "Koko", image: "ava1"), postImage: "avatar1", postText: "kanfl"), Posts(user: Stories(name: "Koko", image: "ava1"), postImage: "avatar1", postText: "kanfl"), Posts(user: Stories(name: "Koko", image: "ava1"), postImage: "avatar1", postText: "kanfl"), Posts(user: Stories(name: "Koko", image: "ava1"), postImage: "avatar1", postText: "kanfl"), Posts(user: Stories(name: "Koko", image: "ava1"), postImage: "avatar1", postText: "kanfl"), Posts(user: Stories(name: "Koko", image: "ava1"), postImage: "avatar1", postText: "kanfl")]
    
    var likes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.delegate = self
        likes = [String](repeating: "heart", count: self.posts.count)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
            PostsTableViewCell
        let post = posts[indexPath.row]
        cell.postImageView.image = UIImage(named: post.postImage)
        cell.postLabel.text = post.postText
        cell.avaImageView.image = UIImage(named: post.user.image)
        cell.avaLabel.text = post.user.name
        cell.likeLabel.font = .boldSystemFont(ofSize: 18)
        
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        cell.likeButton.setImage(UIImage(named: likes[indexPath.row]), for: .normal)
        cell.likeLabel.text = "Нравится: \(post.likes)"
        
        return cell
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
   
    @objc func likeButtonPressed(sender: UIButton){
        if likes[sender.tag] == "heart"{
            likes[sender.tag] = "pink_heart"
            posts[sender.tag].likes += 1
        }else{
            likes[sender.tag] = "heart"
            posts[sender.tag].likes -= 1
        }
        tableView.reloadData()
    }
}
