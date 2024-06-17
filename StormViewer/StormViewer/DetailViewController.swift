//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Zach Tumbleson on 6/17/24.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Stored Properties
    var imageName: String = ""
    var currentImageNumber: Int = 0
    var numberOfImages: Int = 0
    
    // MARK: - Outlets
    @IBOutlet var imageView: UIImageView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image \(currentImageNumber) of \(numberOfImages)"
        navigationItem.largeTitleDisplayMode = .never
        
        imageView.image = UIImage(named: imageName)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.hidesBarsOnTap = false
    }
}
