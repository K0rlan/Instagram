//
//  Models.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import Foundation

struct Stories{
    var name: String
    var image: String
    
}

struct Posts {
    var user: Stories
    var postImage: String
    var postText: String
    var likes: Int
    
    init(user: Stories, postImage: String, postText: String) {
        self.user = user
        self.postImage = postImage
        self.postText = postText
        self.likes = Int.random(in: 1..<1000)
    }
    
}
