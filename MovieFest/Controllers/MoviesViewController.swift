//
//  MoviesViewController.swift
//  MovieFest
//
//  Created by Pranalee Jadhav on 12/25/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var dataService: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
        
        self.tableView.dataSource = dataService
        
        
        self.tableView.delegate = dataService
    }


}
