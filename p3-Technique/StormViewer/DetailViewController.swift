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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
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
    
    @objc
    func shareTapped() {
        guard let image = imageView.image,
              let jpeg = image.jpegData(compressionQuality: 0.8)
        else { return }
        
        let vc = UIActivityViewController(activityItems: [jpeg, imageName, "this is the description of the image"], applicationActivities: [])
        vc.popoverPresentationController?.sourceItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
