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
    func registerUserWithEmail(_ email:String, password:String, isAdult:Bool, completion:@escaping (DataResponse<Any>) -> ()) {
        guard let url = URL(string: "\(baseURL)/\(userPath)/\(registerPath)") else {return}
        Alamofire.request(url,
                          method: .post)
            .responseJSON { response in
                completion(response)
        }

    }
}
