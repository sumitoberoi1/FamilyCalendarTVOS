//
//  JoinFamilyVC.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/10/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class JoinFamilyVC: UIViewController {
    var user:User?
    
    
    @IBOutlet weak var uniqueTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}


extension JoinFamilyVC {
    @IBAction func joinFamilyTapped(_ sender: UIButton) {
        Network.shared.joinFamilyWithCode(uniqueTextField.text ?? "") {[unowned self] (user) in
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
