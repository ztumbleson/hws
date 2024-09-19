//
//  ViewController.swift
//  StormViewer
//
//  Created by Zach Tumbleson on 5/30/24.
//

import UIKit

class ViewController: UITableViewController {

    var pictures: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Image List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        pictures = try! fileManager.contentsOfDirectory(atPath: path).filter {
            $0.hasSuffix(".jpg")
        }
        
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detailVC.imageName = pictures[indexPath.row]
            detailVC.currentImageNumber = indexPath.row + 1
            detailVC.numberOfImages = pictures.count
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

