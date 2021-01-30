//
//  ViewController.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customNavigationBar: NavigationBarView!
    
    var stories = [Stories(name: "Koko", image: "avatar1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1"), Stories(name: "Koko", image: "ava1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavigationBar.delegate = self
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
