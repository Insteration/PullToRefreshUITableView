//
//  ViewController.swift
//  PullToRefreshUITableView
//
//  Created by Артем Кармазь on 8/1/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items = [String]()
    
    let myRefreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        return refreshControl
    }()

    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.refreshControl = myRefreshControl

    }
    
    @objc private func refresh(sender: UIRefreshControl) {
        let string = "This is \(items.count) line"
        items.append(string)
        table.reloadData()
        sender.endRefreshing()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentString = items[indexPath.row]
        cell.textLabel?.text = currentString
        return cell
    }

}

