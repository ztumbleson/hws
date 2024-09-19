//
//  DetailViewController.swift
//  MilestoneOne
//
//  Created by Zach Tumbleson on 9/19/24.
//

import UIKit

final class DetailViewController: UIViewController, UIActivityItemSource {
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        "Egg"
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        country.flag
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController, subjectForActivityType activityType: UIActivity.ActivityType?) -> String {
        "\(country.displayName) Flag"
    }
    
    
    // MARK: - Local State
    var country: Country = .us
    
    // MARK: - Outlets
    
    @IBOutlet var countryName: UILabel!
    @IBOutlet var flagImage: UIImageView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = country.displayName
        self.flagImage?.image = country.flag
        self.countryName?.text = country.displayName
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @objc
    func shareTapped() {
        guard let image = flagImage?.image,
              let jpeg = image.jpegData(compressionQuality: 0.8)
        else { return }
        
        let shareSheet = UIActivityViewController(activityItems: [jpeg, "Picture of the flag of \(country.displayName)"], applicationActivities: [])
        
        shareSheet.popoverPresentationController?.sourceItem = navigationItem.rightBarButtonItem
        present(shareSheet, animated: true)
    }
}
