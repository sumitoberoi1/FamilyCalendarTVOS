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
        Network.shared.createFamilyWithName(familyNameTextfield.text ?? "", uniqueCode: uniqueFamilyCodeTextField.text ?? "") {[unowned self]  (user) in
            if let user = user {
                self.pushToCalendarForUser(user)
            }
        }
    }
    func pushToCalendarForUser(_ user:User) {
        let calendarNavVC = self.storyboard?.instantiateViewController(withIdentifier: "CalendarNav") as! UINavigationController
        let calendarVC = calendarNavVC.topViewController as? CalendarVC
        calendarVC?.user = user
        UIApplication.shared.keyWindow?.rootViewController = calendarNavVC
    }
}
