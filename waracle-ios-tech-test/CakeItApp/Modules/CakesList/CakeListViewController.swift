//
//  CakeListViewController.swift
//  CakeItApp
//
//  Created by David McCallum on 20/01/2021.
//

import UIKit

protocol CakeListViewType:AnyObject {
    func updateUI()
    func showError()
}

class CakeListViewController: UIViewController, CakeListViewType, Storyboarded {
    
    @IBOutlet var tableView: UITableView!
    
    var viewModel:CakeListViewModelType!  // ViewModel
    weak var coordinator: Coordinator?        // Coordinator

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        title = "🎂CakeItApp🍰"
        
        viewModel.fetchCakes()
    }
    
    func updateUI() {
        tableView.reloadData()
    }
    
    func showError() {
        tableView.reloadData()
    }
}

extension CakeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let cake = viewModel.getCakes(for: indexPath.row)

        coordinator?.goToCakeDetails(cakeDetails: cake)
    }
    
}

extension CakeListViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as?  CakeTableViewCell else {
            return UITableViewCell()
        }
        
        let cake = viewModel.getCakes(for: indexPath.row)
        cell.configure(with: cake)
        return cell
    }
}



