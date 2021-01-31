//
//  PostsTableViewCell.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit

class PostsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var moreButton: UIImageView!
    @IBOutlet weak var avaLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var avaImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        makeImageRound()
    }

    func makeImageRound(){
        avaImageView.layer.borderWidth = 1
        avaImageView.layer.masksToBounds = false
        avaImageView.layer.borderColor = UIColor.black.cgColor
        avaImageView.layer.cornerRadius = avaImageView.frame.height/2
        avaImageView.clipsToBounds = true
    }

}
