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
        Network.shared.joinFamilyWithCode(uniqueTextField.text ?? "") { (family) in
            let calendarVC = self.storyboard?.instantiateViewController(withIdentifier: "CalendarVC") as! CalendarVC
            self.navigationController?.pushViewController(calendarVC, animated: true)
        }
    }
}
