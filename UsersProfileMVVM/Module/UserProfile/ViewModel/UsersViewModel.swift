//
//  UsersViewModel.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import Foundation
import UIKit

class UsersViewModel: BaseViewController {
    //MARK: - Variables
    private var usersList: [UsersList]?
    private var userService = UserService()
    private var getUsersSuccessfully: ((Bool) -> Void)?
    
    //MARK: - Setter and Getter
    func getUsersData() -> [UsersList] {
        return usersList ?? [UsersList]()
    }
    
    func getUserSuccessfullyState(action: ((Bool) -> Void)?) {
        return  getUsersSuccessfully = action
    }
    
    func navigateToUserDetailScreen(user: UsersList) {
        let storyboard = UIStoryboard(name: "UserDetail", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "UserDetailViewController") as? UserDetailViewController else { return }
        vc.setUserData(data: user)
        self.presentVC?(vc)
    }
    
    //MARK: - Helper Methods
    func getUsersFromServer() {
        userService.getUsersList { data in
            self.usersList = data
            self.getUsersSuccessfully?(true)
        }
    }
    
    func getUsersCount() -> Int {
        return usersList?.count ?? 0
    }
    
    
    
}


