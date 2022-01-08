//
//  ImageViewController.swift
//  NewSwiftTest
//
//  Created by Arslan Abdullaev on 08.01.2022.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var authorPhoto: UIImageView!
// MARK: - Properties
    
    var authors: Author!
// MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authorPhoto.image = UIImage(named: authors.nickname)
    }
    
    override func viewWillLayoutSubviews() {
        authorPhoto.layer.cornerRadius = authorPhoto.frame.width / 2
    }
    
}
