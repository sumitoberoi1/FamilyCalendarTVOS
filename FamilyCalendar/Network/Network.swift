//
//  Network.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/10/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import Foundation
import Alamofire

struct Network {
    let baseURL = "http://localhost:3001"
    let userPath = "user"
    let registerPath = "register"
    static let shared = Network()
}


extension Network {
    func registerUserWithEmail(_ email:String, password:String, isAdult:Bool, completion:@escaping (User?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(userPath)/\(registerPath)") else {return}
        Alamofire.request(url,
                          method: .post,
                          parameters: ["isAdult":isAdult,"email":email, "password":password],
                          encoding: JSONEncoding.default,
                          headers: nil)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    completion(nil)
                    return
                }
                guard let userJSON = response.value as? [String: Any],
                    let userDict = userJSON["user"] as? [String:Any],
                    let uid = userDict["uid"] as? String,
                    let email = userDict["email"] as? String,
                    let color = userDict["color"] as? String,
                    let isAdult = userDict["isAdult"] as? Bool else{return}
                completion(User(withemail: email, isAdult: isAdult, uid: uid, colorString: color))
        }
    }
}
