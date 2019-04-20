//
//  RegisterVC.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/3/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit


class RegisterVC: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var adultSegmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//MARK: IBActions
extension RegisterVC {
    @IBAction func registerButtonTapped(_ sender: Any) {
        let isAdult = adultSegmentControl.selectedSegmentIndex == 0 ? true:false
        let defaults = UserDefaults.standard
        Network.shared.registerUserWithEmail(emailTextField.text ?? "",
                                             password: passwordTextField.text ?? "",
                                             isAdult: isAdult) { (user) in
                                                if let user = user {
                                                    defaults.set(user.uid, forKey: "uid")
                                                    let joinFamilyNav = self.storyboard?.instantiateViewController(withIdentifier: "JoinFamilyNav") as! UINavigationController
                                                    (joinFamilyNav.topViewController as? JoinFamilyVC)?.user = user
                                                   UIApplication.shared.keyWindow?.rootViewController = joinFamilyNav
                                                }
        }
    }
}
