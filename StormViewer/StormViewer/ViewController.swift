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
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        pictures = try! fileManager.contentsOfDirectory(atPath: path).filter {
            $0.hasSuffix(".jpg")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
}

