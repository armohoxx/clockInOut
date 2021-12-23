//
//  HistoryPageViewController.swift
//  clockInOut
//
//  Created armyxx on 20/12/2564 BE.
//  Copyright © 2564 BE ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HistoryPageViewController: UIViewController, HistoryPageViewProtocol {

	var presenter: HistoryPagePresenterProtocol?
    let searchController = UISearchController(searchResultsController: nil)
    var searching = false
    var searchingData = [DataHistory]()
    var dataHistory: [DataHistory] = []

    @IBOutlet weak var navBarHistory: UINavigationBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBarData: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "History"
        
        if #available(iOS 13.0, *) {
            navBarHistory.barTintColor = .secondarySystemBackground
        } else {
            navBarHistory.barTintColor = .white
        }
        
        configureSearchController()
        tableView.register(HistoryTableViewCell.nib(), forCellReuseIdentifier: "HistoryTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        navBarHistory.delegate = self
        self.showLoader()
        self.showTableHistory()
        self.presenter?.notifyHistoryData()
        self.presenter?.getNotiCenterSetup()
    }
    
    private func configureSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search History Data"
    }
    
    func showLoader() {
        indicator.color = .black
        indicator.startAnimating()
    }
    
    func showTableHistory() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.indicator.stopAnimating()
            self.indicator.hidesWhenStopped = true
        })
    }
    
    func showDataHistory(dataHistory: [DataHistory]) {
        self.dataHistory = dataHistory
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showErrorAlert(error: Error?) {
        guard error == nil else {
            let alertController = UIAlertController(title: "Someting Wrong",
                                                    message: "\(error!.localizedDescription)",
                                                    preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK",
                                             style: .cancel,
                                             handler: nil)
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            return
        }
    }

}

extension HistoryPageViewController: UINavigationBarDelegate {
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
    
    
}

extension HistoryPageViewController: UITableViewDelegate {
    
}

extension HistoryPageViewController: UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchingData.count
        } else {
            return dataHistory.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "History of Clock in - out"
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        
        if searching {
            cell.configure(with: searchingData[indexPath.item])
        } else {
            cell.configure(with: dataHistory[indexPath.item])
        }
    
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        
        if !searchText.isEmpty {
            searching = true
            searchingData.removeAll()
            for mapData in dataHistory
            {
                let timestamp = mapData.date_time
                let date = timestamp?.dateValue()
                let dayTimeFormatter = DateFormatter()
                dayTimeFormatter.timeZone = TimeZone.current
                dayTimeFormatter.dateFormat = "MMMM dd, yyyy - h:mm:ss a z"
                let currentDayTime = dayTimeFormatter.string(from: date ?? Date())
                
                if currentDayTime.lowercased().contains(searchText.lowercased())
                {
                    searchingData.append(mapData)
                }
            }
        } else {
            searching = false
            searchingData.removeAll()
            searchingData = dataHistory
        }
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchingData.removeAll()
        self.tableView.reloadData()
    }
}
