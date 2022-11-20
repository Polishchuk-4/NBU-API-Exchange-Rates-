//
//  ViewController.swift
//  NBU API(Exchange Rates)
//
//  Created by Denys Polishchuk on 19.11.2022.
//

import UIKit

class MainVC: UITableViewController {
    private var currencyElements: [Сurrency] = []
    private let searchControllerCurrency = UISearchController(searchResultsController: nil)
    private var filteringCurrencyElements: [Сurrency] = []
    private var searchBarIsEmpty: Bool {
        guard let text = self.searchControllerCurrency.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchControllerCurrency.isActive && !self.searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.settingNavBar()
        self.downloadJSON {
            self.tableView.reloadData()
            print("success")
        }
        self.settingSearchControllerCurrency()
        print(self.currencyElements.count)
    }
    
    private func settingNavBar() {
        self.navigationItem.title = "Національний банк України"
    }
    
    private func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json")
        
        URLSession.shared.dataTask(with: url!) { data, responce, error in
            if error == nil {
                do {
                    self.currencyElements = try JSONDecoder().decode( [Сurrency].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

//MARK: - TableViewDataSource -
extension MainVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return self.filteringCurrencyElements.count
        }
        return self.currencyElements.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idCell = "MainVC"
        var cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? CellInfoCurrency
        if cell == nil {
            cell = CellInfoCurrency.init(style: .value1, reuseIdentifier: idCell)
        }

        var currency: Сurrency
        if isFiltering {
            currency = self.filteringCurrencyElements[indexPath.row]
        } else {
            currency = self.currencyElements[indexPath.row]
        }
        
        cell?.label.text = "\(currency.txt) (\(currency.cc))      \(currency.rate)"
        cell?.selectionStyle = .none
        cell?.backgroundColor = .clear
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellInfoCurrency.height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//MARK: - SearchBar -
extension MainVC: UISearchResultsUpdating {
    private func settingSearchControllerCurrency() {
        self.searchControllerCurrency.searchResultsUpdater = self
        self.searchControllerCurrency.obscuresBackgroundDuringPresentation = false
        self.searchControllerCurrency.searchBar.placeholder = "search currency"
        self.navigationItem.searchController = self.searchControllerCurrency
        self.definesPresentationContext = true
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        self.filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        self.filteringCurrencyElements = self.currencyElements.filter({ currency in
            return currency.txt.lowercased().contains(searchText.lowercased())
        })
        
        self.tableView.reloadData()
    }
}
