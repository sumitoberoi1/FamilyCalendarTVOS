//
//  CreateFamilyVC.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/11/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class CreateFamilyVC: UIViewController {
    @IBOutlet weak var familyNameTextfield: UITextField!
    @IBOutlet weak var uniqueFamilyCodeTextField: UITextField!
    var user:User?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension CreateFamilyVC {
    @IBAction func createFamilyButtonTapped(_ sender: UIButton) {
        Network.shared.createFamilyWithName(familyNameTextfield.text ?? "", uniqueCode: uniqueFamilyCodeTextField.text ?? "") { (user) in
            if let user = user {
                let calendarVC = self.storyboard?.instantiateViewController(withIdentifier: "CalendarVC") as! CalendarVC
                calendarVC.user = user
                self.navigationController?.pushViewController(calendarVC, animated: true)
            }
        }
    }
}
