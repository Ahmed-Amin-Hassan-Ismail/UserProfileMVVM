//
//  UsersTableViewCell.swift
//  UsersProfileMVVM
//
//  Created by Ahmed Amin on 09/09/2022.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    //MARK: - Variables
    static let identifier = "UsersTableViewCell"
    
    
    //MARK: - IBoutlets
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userCityLbl: UILabel!
    @IBOutlet weak var userStreetLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    func configureCell(name: String, email: String, city: String, street: String) {
        self.userNameLbl.text = name
        self.userEmailLbl.text = email
        self.userCityLbl.text = city
        self.userStreetLbl.text = street
    }
}
