//
//  NewsFeedViewController.swift
//  BalticMuseums
//
//  Created by Tomasz Marzeion on 17/03/2018.
//  Copyright © 2018 Grzegorz Sagadyn. All rights reserved.
//

import UIKit
import Snapify

class NewsFeedViewController: UIViewController, UIStoryboardInstantiate {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var news: [NewsFeedModel] {
        return NewsFeedService.getNewsFeed()
    }
    
    var header: ExhibitionDetailHeaderView? {
        didSet {
            updateView()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.layoutIfNeeded()
        header = ExhibitionDetailHeaderView(tableView: tableView, minHeight: 140, maxHeight: 200)
        header?.imageView.contentMode = .scaleAspectFit
        header?.blurEnabled = true
    }
    
    func updateView() {
        header?.imageView.image = UIImage.init(named: "experyment_logo_black")
    }
}

extension NewsFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
    }
}

extension NewsFeedViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell", for: indexPath) as! NewsFeedCell
        cell.model = news[indexPath.row]
        return cell
    }
}
