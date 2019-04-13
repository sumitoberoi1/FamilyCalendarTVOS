//
//  Task.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/13/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import Foundation

class Task {
    let id:String
    let creater:User?
    let taskName:String
    let taskDescription:String
    let taskLocation:String
    let isParentalControlled:Bool
    let taskDate:Date
    let family:Family?
    init(jsonDict:[String:Any]) {
        id = jsonDict["id"] as? String ?? ""
        if let createrDict = jsonDict["creater"] as? [String:Any] {
            creater = User(userDict: createrDict)
        } else {
            creater = nil
        }
        taskName = jsonDict["taskName"] as? String ?? ""
        taskDescription = jsonDict["taskDescription"] as? String ?? ""
        taskLocation = jsonDict["location"] as? String ?? ""
        isParentalControlled = jsonDict["isParentalControlled"] as? Bool ?? false
        taskDate = jsonDict["taskDate"] as? Date ?? Date()
        if let familyDict = jsonDict["family"] as? [String:Any] {
            family = Family(familyDict: familyDict)
        } else {
            family = nil
        }
    }
}
