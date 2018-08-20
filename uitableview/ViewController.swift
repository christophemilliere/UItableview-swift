//
//  ViewController.swift
//  uitableview
//
//  Created by Christophe on 20/08/2018.
//  Copyright © 2018 Christophe. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableview: UITableView!
    
    var _70sShowList:[String] = []
    var _friendsLists:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        _70sShowList.append("Donna")
        _70sShowList.append("Eric")
        _70sShowList.append("Jackie")
        _70sShowList.append("Fez")
        _70sShowList.append("Hide")
        
        
        _friendsLists.append("Monica")
        _friendsLists.append("Rachel")
        _friendsLists.append("Phoebe")
        _friendsLists.append("Chandler")
        _friendsLists.append("Joey")
        _friendsLists.append("Roos")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title:String
        if section == 0 {
            title = "That 70's Show"
        } else {
            title = "Friends"
        }
        
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount: Int
        
        if section == 0 {
         rowCount = _70sShowList.count
        } else {
         rowCount = _friendsLists.count
        }
        return rowCount
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            _70sShowList.remove(at: indexPath.row)
        } else {
            _friendsLists.remove(at: indexPath.row)
        }
        
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:  UITableViewCell = tableview.dequeueReusableCell(withIdentifier: "number-cell", for: indexPath)
        if let titleLabel = cell.textLabel {
            if indexPath.section == 0 {
                titleLabel.text = "Cellule \(_70sShowList[indexPath.row]))"
            } else {
                titleLabel.text = "Cellule \(_friendsLists[indexPath.row]))"
            }
        }
        return cell
    }
}

