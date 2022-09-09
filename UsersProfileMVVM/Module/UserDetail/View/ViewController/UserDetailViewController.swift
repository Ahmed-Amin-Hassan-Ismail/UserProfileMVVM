//
//  UserDetailViewController.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    //MARK: - Variables
    private var viewModel: UserDetailViewModel?
    
    
    //MARK: - Setter
    func setUserData(data: UsersList) {
        self.viewModel = UserDetailViewModel(userData: data)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(viewModel?.getUserData()!)
        // Do any additional setup after loading the view.
    }

}
