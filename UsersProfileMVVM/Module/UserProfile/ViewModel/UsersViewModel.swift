//
//  UsersViewModel.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import Foundation

class UsersViewModel {
    //MARK: - Variables
    private var usersList: [UsersList]?
    private var getUsersSuccessfully: ((Bool) -> Void)?
    
    //MARK: - Setter and Getter
    func getUsersData() -> [UsersList] {
        return usersList ?? [UsersList]()
    }
    
    func getUserSuccessfullyState(action: ((Bool) -> Void)?) {
        return  getUsersSuccessfully = action
    }
    
    //MARK: - Helper Methods
    func getUsersFromServer() {
        getUsersList()
    }
    
    func getUsersCount() -> Int {
        return usersList?.count ?? 0
    }
    
    
    
}

//MARK: - APi Calling
extension UsersViewModel {
    
    private func getUsersList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let users = try JSONDecoder().decode([UsersList].self, from: data)
                self.usersList = users
                self.getUsersSuccessfully?(true)
            } catch {
                
            }

        }
        task.resume()
    }
}



