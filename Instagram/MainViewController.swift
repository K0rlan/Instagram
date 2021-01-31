//
//  ViewController.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNavigationBar: NavigationBarView!
    
    var posts = [Posts(user: Stories(name: "Koko", image: "avatar1"), postString: "avatar1", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "1"), postString: "p1", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "2"), postString: "p2", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "3"), postString: "p3", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "4"), postString: "p4", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "5"), postString: "p5", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "6"), postString: "p1", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"), Posts(user: Stories(name: "Koko", image: "7"), postString: "p2", postText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s")]
    
    var likes: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.delegate = self
        likes = [String](repeating: "heart", count: self.posts.count)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        if !Post.sharedInstance.arr.isEmpty{
            addNew()
        }
    }
    func addNew(){
        for newPosts in Post.sharedInstance.arr{
            posts.append(newPosts)
            likes.append("heart")
        }
        tableView.reloadData()
    }
}
extension MainViewController: NavBarDelegate{
    func heartAction() {
        print("Likes Button Tapped")
    }
    func sendAction() {
        print("Direct Button Tapped")
    }
}

extension MainViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as!
                StoriesTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
                PostsTableViewCell
            let post = posts[indexPath.row]
            cell.postImageView.image = post.postImage
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
class Post {
    static let sharedInstance = Post()
    var arr = [Posts]()
}
