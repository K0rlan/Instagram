//
//  NavigationBarView.swift
//  Instagram
//
//  Created by Korlan Omarova on 31.01.2021.
//

import UIKit

@objc protocol NavBarDelegate: class{
    @objc optional func heartAction()
    @objc optional func sendAction()
}

@IBDesignable class NavigationBarView: UIView {

    weak var delegate: NavBarDelegate?
    
    @IBOutlet var navigationBar: UIView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sendButton: UIButton!
    
    lazy var isCheckedLikes: Bool = false {
        didSet {
            if isCheckedLikes == true {
                heartButton.setImage(UIImage(named: "heart_fill"), for: .normal)
            } else {
                heartButton.setImage(UIImage(named:"heart"), for: .normal)
            }
        }
    }
    
    lazy var isCheckedDirect: Bool = false {
        didSet {
            if isCheckedDirect == true {
                sendButton.setImage(UIImage(named: "send_fill"), for: .normal)
            } else {
                sendButton.setImage(UIImage(named:"send"), for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        let bundle = Bundle(for: NavigationBarView.self)
        bundle.loadNibNamed("NavigationBarView", owner: self, options: nil)
        addSubview(navigationBar)
        navigationBar.frame = self.bounds
        navigationBar.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    @IBAction func likeButtonPressed(_ sender: Any) {
        delegate?.heartAction?()
        isCheckedLikes = !isCheckedLikes
    }
    @IBAction func sendButtonPressed(_ sender: Any) {
        delegate?.sendAction?()
        isCheckedDirect = !isCheckedDirect
    }
}
