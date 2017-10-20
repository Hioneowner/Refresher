//
//  DemoViewController.swift
//  Refresher
//
//  Created by MingChen on 2017/10/20.
//  Copyright © 2017年 MingChen. All rights reserved.
//

import UIKit
extension DemoViewController {
    
    enum Style: Int {
        case indicatorHeader, textHeader, smallGIFHeader, gifTextHeader, bigGIFHeader, indicatorFooter, textFooter, indicatorAutoFooter, textAutoFooter
    }
}


class DemoViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    var tableView: UITableView!
    private let cellID = "DemoViewController-cellId"
    var style: Style = .indicatorHeader
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        view.addSubview(tableView)
        
        //初始化Header
        initHeader()
        // Do any additional setup after loading the view.
    }

    func initHeader() {
        switch style {
        case .indicatorHeader:
            tableView.ref_setIndicatorHeader { [weak self] in
                self?.action()
            }
        case .textHeader:
            tableView.ref_setTextHeader { [weak self] in
                self?.action()
            }
        case .smallGIFHeader:
            guard let url = Bundle.main.url(forResource: "loading", withExtension: "gif"), let data = try? Data(contentsOf: url) else { return }
            
            tableView.ref_setGIFHeader(data: data, isBig: false, height: 60) { [weak self] in
                self?.action()
            }
        case .gifTextHeader:
            guard let url = Bundle.main.url(forResource: "loading", withExtension: "gif"), let data = try? Data(contentsOf: url) else { return }
            
            tableView.ref_setGIFTextHeader(data: data) { [weak self] in
                self?.action()
            }
        case .bigGIFHeader:
            guard let url = Bundle.main.url(forResource: "loading", withExtension: "gif"), let data = try? Data(contentsOf: url) else { return }
            
            tableView.ref_setGIFHeader(data: data, isBig: true, height: 120) { [weak self] in
                self?.action()
            }
        case .indicatorFooter:
            tableView.ref_setIndicatorFooter { [weak self] in
                self?.action()
            }
        case .textFooter:
            tableView.ref_setTextFooter { [weak self] in
                self?.action()
            }
        case .indicatorAutoFooter:
            tableView.ref_setIndicatorAutoFooter { [weak self] in
                self?.action()
            }
        case .textAutoFooter:
            tableView.ref_setTextAutoFooter { [weak self] in
                self?.action()
            }
        }
    }
    
    func action() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.ref_endRefreshing()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }


}
