//
//  FeedViewController.swift
//  Prototype
//
//  Created by Pakhurde Pandit on 16/07/20.
//  Copyright © 2020 Pakhurde Pandit. All rights reserved.
//

import UIKit

class FeedViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "FeedImageCell")!
    }


}