//
//  MeaningViewController.swift
//  MyName
//
//  Created by Danielle Smith on 10/13/23.
//

import Foundation
import UIKit

class MeaningViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var defTableView: UITableView!
    
    var fullName: [String] = []
    
    var nameDefs: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameDefs = CoreDataManager.shared.fetchMatchingNames(with: fullName)
        
        let trimmedNames = fullName.map { $0.trimmingCharacters(in: .whitespaces) }
        let joinedString = trimmedNames.joined(separator: " ")
        let regex = try! NSRegularExpression(pattern: "\\s+", options: .caseInsensitive)
        let fullNameString = regex.stringByReplacingMatches(in: joinedString, options: [], range: NSRange(location: 0, length: joinedString.utf16.count), withTemplate: " ")
        fullNameLabel.text = fullNameString
                
        defTableView.dataSource = self
        defTableView.register(AutoSizeCell.self, forCellReuseIdentifier: K.cellSubClass)
        defTableView.rowHeight = UITableView.automaticDimension
        defTableView.estimatedRowHeight = 100
        
        defTableView.backgroundColor = UIColor.clear
    }
}

extension MeaningViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameDefs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellSubClass, for: indexPath) as! AutoSizeCell
        let cellString = nameDefs[indexPath.row]
        
        cell.configure(withText: cellString)
           cell.backgroundColor = UIColor.clear
           let textColor = UIColor(red: 72/255, green: 33/255, blue: 33/255, alpha: 1.0)
           cell.customLabel.textColor = textColor
        
//        var configuration = cell.defaultContentConfiguration()
//        configuration.text = cellString
//        cell.contentConfiguration = configuration
//        cell.textLabel?.textColor = UIColor.red
//        cell.backgroundColor = UIColor.clear
//
        return cell
    }
}


