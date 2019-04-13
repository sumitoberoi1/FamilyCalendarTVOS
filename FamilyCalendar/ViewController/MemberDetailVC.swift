//
//  MemberDetailVC.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/13/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class MemberDetailVC: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var isAdultLabel: UILabel!
    
    @IBOutlet weak var deleteMemberButton: UIButton!
    @IBOutlet weak var colorView: UIView!
    
    var member:User?
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }
}

//MARK: UI Elements
extension MemberDetailVC {
    func refreshUI() {
        
       configAccordingToUser()
    }
    func configAccordingToUser() {
        guard let member = member else {return}
        emailLabel.text = member.email
        isAdultLabel.text = member.isAdult ? "Yes":"No"
        colorView.backgroundColor = member.color
    }
    
}
