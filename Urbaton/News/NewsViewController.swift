//
//  NewsViewController.swift
//  Urbaton
//
//  Created by Розалия Амирова on 18/05/2019.
//  Copyright © 2019 Розалия Амирова. All rights reserved.
//

import Foundation
import UIKit

class NewsViewController: UIViewController {
   
    @IBOutlet weak var newsTableView: UITableView!
    
    let pagingSpinner = UIActivityIndicatorView(style: .gray)
    
    var model: PossibilitiesModel = PossibilitiesModel()
    var currentPossibilitiesOffset: Int = 0
    let numberOfPossibilityInPage: Int = 20
    var loadingData: Bool = false
    var loadingMoreData: Bool = false
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(PossibilitiesViewController.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.gray
        return refreshControl
    }()
    
    override func viewDidLoad() {
        currentPossibilitiesOffset = 0
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.addSubview(self.refreshControl)
        self.navigationItem?.title = "Новости"
        vonfigurePagingSpinner()
        registerCell()
        loadData()
    }
    
    func vonfigurePagingSpinner() {
        pagingSpinner.color = UIColor(red: 22.0 / 255.0, green: 106.0 / 255.0, blue: 176.0 / 255.0, alpha: 1.0)
        pagingSpinner.hidesWhenStopped = true
        pagingSpinner.stopAnimating()
        newsTableView.tableFooterView = pagingSpinner
        pagingSpinner.isHidden = true
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        currentPossibilitiesOffset = 0
        //        loadData()
    }
    
    func registerCell() {
        self.newsTableView.register(UINib.init(nibName: "NewsCellPrototype", bundle: nil), forCellReuseIdentifier: "NewsCellPrototype")
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        let deltaOffset = maximumOffset - currentOffset
        print(deltaOffset)
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            loadMoreData()
        }
    }
    
    func disableRefreshControl() {
        refreshControl.isEnabled = false
    }
    
    func enableRefreshControl() {
        refreshControl.isEnabled = false
    }
    
    func hidePagingSpinner() {
        pagingSpinner.isHidden = true
        pagingSpinner.stopAnimating()
        pagingSpinner.hidesWhenStopped = true
    }
    
    func loadMoreData() {
        //        if !loadingData && !loadingMoreData {
        //            pagingSpinner.isHidden = false
        //            loadingMoreData = true
        //            print("Loading more data")
        //            self.currentPossibilitiesOffset += self.numberOfPossibilityInPage
        //
        
        
        //            model.loadData(pageSize: numberOfPossibilityInPage, pageOffset: currentPossibilitiesOffset) {
        //                articles, error in
        //                DispatchQueue.main.async {
        //                    self.hidePagingSpinner()
        //                    self.refreshControl.endRefreshing()
        //                    self.enableRefreshControl()
        //                    self.loadingMoreData = false
        //                    if error == nil && articles != nil {
        //                        self.newsFeedTableView.reloadData()
        //
        //                    }
        //                }
        //            }
        //        }
    }
    
    func loadData() {
        print(currentPossibilitiesOffset)
        if !loadingData {
            print("Loading data")
            loadingData = true
            disableRefreshControl()
            
            newsTableView.reloadData()
            
            
            //            model.loadData(pageSize: numberOfPossibilityInPage, pageOffset: currentPossibilitiesOffset) {
            //                articles, error in
            //
            //                DispatchQueue.main.async {
            //                    self.loadingData = false
            //                    self.refreshControl.endRefreshing()
            //                    self.enableRefreshControl()
            //                    print("Refreshing tableview")
            //                    if error == nil && articles != nil {
            //                        self.currentNewsOffset = 0
            //                        self.newsFeedTableView.reloadData()
            //                    }
            //                }
            //            }
        }
    }
    
    func stopRefreshControl() {
        refreshControl.endRefreshing()
    }
}

extension NewsViewController: UITableViewDelegate {
    
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if model.getPossibilities().count == 0 {
            refreshControl.isUserInteractionEnabled = false
        } else {
            refreshControl.isUserInteractionEnabled = true
        }
        return model.getPossibilities().count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsCellPrototype", for: indexPath) as! NewsCell
        print(model.getPossibilities().count)
        let cellInfo = model.getPossibilities()[indexPath.row]
        cell.setTitle(text: cellInfo.title)
        cell.setInfoLabel(text: cellInfo.info)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
