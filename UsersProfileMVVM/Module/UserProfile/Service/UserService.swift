//
//  UserService.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import Foundation

class UserService {
    
    func getUsersList(completion: ((_ data: [UsersList]) -> Void)?) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let users = try JSONDecoder().decode([UsersList].self, from: data)
                completion?(users)
            } catch {
                print("Location Description", error.localizedDescription)
            }

        }
        task.resume()
    }
    
}
