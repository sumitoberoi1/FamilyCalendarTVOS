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
    let color:UIColor
    init(withemail mail:String,isAdult adult:Bool, uid:String, colorString:String) {
        self.email = mail
        self.isAdult = adult
        self.uid = uid
        self.color = UIColor(hex:colorString) ?? UIColor.blue
    }
}
