//
//  Family.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/12/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import Foundation

struct Family {
    let id:String
    let name:String
    let members:[User]
    let creater:User?
    let code:String
    init(familyDict:[String:Any]) {
        id = familyDict["_id"] as? String ?? ""
        code = familyDict["code"] as? String ?? ""
        name = familyDict["name"] as? String ?? ""
        if let createrDict = familyDict["creater"] as? [String:Any] {
         creater = User(userDict: createrDict)
        } else {
            creater = nil
        }
        if let memberDicts = familyDict["members"] as? [[String:Any]] {
            var tempMembers = [User]()
            for memberDict in memberDicts {
                tempMembers.append(User(userDict: memberDict))
            }
            members = tempMembers
        } else {
            members = []
        }
    }
}
