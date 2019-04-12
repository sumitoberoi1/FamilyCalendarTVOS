//
//  User.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/10/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class User {
    let email:String
    let isAdult:Bool
    let uid:String
    var family:Family?
    var color:UIColor {
        get {
            return UIColor(hex:colorString) ?? UIColor.blue
        }
    }
    let colorString:String
    init(userDict:[String:Any]) {
        uid = userDict["uid"] as? String ?? ""
        email = userDict["email"] as? String ?? ""
        colorString = userDict["color"] as? String ?? ""
        isAdult = userDict["isAdult"] as? Bool ?? true
        if let familyDict = userDict["family"] as? [String:Any] {
            family = Family(familyDict: familyDict)
        }
    }
    
}
