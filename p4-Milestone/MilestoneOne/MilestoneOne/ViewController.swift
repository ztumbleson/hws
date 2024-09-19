//
//  ViewController.swift
//  MilestoneOne
//
//  Created by Zach Tumbleson on 9/19/24.
//

import UIKit

class ViewController: UITableViewController {
    let countries = Country.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Countries of the World"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlagCell", for: indexPath)
        let country = countries[indexPath.row]
        
        cell.imageView?.image = country.flag
        cell.textLabel?.text = country.displayName
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = countries[indexPath.row]
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CountryDetail") as? DetailViewController {
            vc.country = country
            
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            print("failed")
        }
    }
}
