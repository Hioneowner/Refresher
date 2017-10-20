//
//  ViewController.swift
//  Refresher
//
//  Created by MingChen on 2017/10/20.
//  Copyright © 2017年 MingChen. All rights reserved.
//

import UIKit

let refreshViews = ["IndicatorHeader", "TextHeader", "SmallGIFHeader", "GIFTextHeader", "BigGIFHeader", "IndicatorFooter", "TextFooter", "IndicatorAutoFooter", "TextAutoFooter"]

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate {
    var tableView: UITableView!
    
    private let cellID = "ViewController-cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refreshViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = refreshViews[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DemoViewController()
        vc.style = DemoViewController.Style(rawValue: indexPath.row) ?? .indicatorHeader
        navigationController?.pushViewController(vc, animated: true)
    }


}

