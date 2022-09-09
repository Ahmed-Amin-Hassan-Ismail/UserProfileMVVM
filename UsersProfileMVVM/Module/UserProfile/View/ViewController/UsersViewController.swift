//
//  UsersViewController.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import UIKit

class UsersViewController: UIViewController {
    
    //MARK: - Variables
    private lazy var viewModel = UsersViewModel()
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupUsersViewModel()
    }
    
    
}

//MARK: - setupTableView
extension UsersViewController {
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: UsersTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: UsersTableViewCell.identifier)
    }
}

//MARK: - setupViewModel
extension UsersViewController {
    private func setupUsersViewModel() {
        viewModel.getUsersFromServer()
        viewModel.getUserSuccessfullyState { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }            
        }
    }
}


//MARK: - UItableViewDataSource
extension UsersViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as? UsersTableViewCell else {
            return UITableViewCell()
        }
        let user = viewModel.getUsersData()[indexPath.row]
        cell.configureCell(name: user.name ?? "", email: user.email ?? "", city: user.address?.city ?? "", street: user.address?.street ?? "")
        return cell
    }
}

//MARK: - UITableViewDelegate
extension UsersViewController: UITableViewDelegate {
    
}

