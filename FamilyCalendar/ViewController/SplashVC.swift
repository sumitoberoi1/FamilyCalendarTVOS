//
//  SplashVC.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/12/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigate()
    }
    
    func navigate() {
        if UserDefaults.standard.string(forKey: "uid") != nil {
            Network.shared.getUser {[unowned self] (user) in
                if let user = user {
                    if user.family != nil {
                        self.pushToCalendarForUser(user)
                    } else {
                        self.pushToJoinFamilyforUser(user)
                    }
                }  else {
                    self.pushtoRegisterVC()
                }
            }
            
        } else {
            pushtoRegisterVC()
        }
        
    }
    
    func pushtoRegisterVC() {
        let registerNav = storyboard?.instantiateViewController(withIdentifier: "FamilyCalendarNav") as? UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = registerNav
    }

    func pushToJoinFamilyforUser(_ user:User) {
        let joinFamilyNav = self.storyboard?.instantiateViewController(withIdentifier: "JoinFamilyNav") as! UINavigationController
        (joinFamilyNav.topViewController as? JoinFamilyVC)?.user = user
        UIApplication.shared.keyWindow?.rootViewController = joinFamilyNav
    }
    
    func pushToCalendarForUser(_ user:User) {
        let calendarNavVC = self.storyboard?.instantiateViewController(withIdentifier: "CalendarNav") as! UINavigationController
        let calendarVC = calendarNavVC.topViewController as? CalendarVC
        calendarVC?.user = user
        UIApplication.shared.keyWindow?.rootViewController = calendarNavVC
    }
}
