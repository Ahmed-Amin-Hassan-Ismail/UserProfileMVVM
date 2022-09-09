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
    var showDetailTapped: (() -> Void)?
    
    
    //MARK: - IBoutlets
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var userEmailLbl: UILabel!
    @IBOutlet weak var userCityLbl: UILabel!
    @IBOutlet weak var userStreetLbl: UILabel!
    @IBOutlet weak var showDetailsBtnView: UIButton! {
        didSet {
            showDetailsBtnView.layer.cornerRadius = 10
            showDetailsBtnView.layer.masksToBounds = true
        }
    }
    
    //MARK: - Actions
    @IBAction func showDetailsAction(_ sender: UIButton) {
        showDetailTapped?()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    //MARK: - configureCell...
    func configureCell(name: String, email: String, city: String, street: String) {
        self.userNameLbl.text = name
        self.userEmailLbl.text = email
        self.userCityLbl.text = city
        self.userStreetLbl.text = street
    }
}
