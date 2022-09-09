//
//  UserDetailViewModel.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import Foundation

class UserDetailViewModel: BaseViewController {
    
    //MARK: - Variables
    private var userData: UsersList?
    
    init(userData: UsersList) {
        self.userData = userData
    }
    
    func getUserData() -> UsersList? {
        return userData
    }
    
}
