//
//  UsersViewModel.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import Foundation

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

//MARK: - APi Calling
extension UsersViewModel {
    

}



