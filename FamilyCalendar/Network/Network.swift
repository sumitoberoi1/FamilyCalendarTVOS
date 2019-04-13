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
    let familyPath = "family"
    let registerPath = "register"
    let join = "join"
    static let shared = Network()
    var uid:String? {
        get {
            return UserDefaults.standard.string(forKey: "uid")
        }
    }
}


extension Network {
    func registerUserWithEmail(_ email:String, password:String, isAdult:Bool, completion:@escaping (User?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(userPath)/\(registerPath)") else {return}
        Alamofire.request(url,
                          method: .post,
                          parameters: ["isAdult":isAdult,"email":email, "password":password],
                          encoding: JSONEncoding.default,
                          headers: nil).validate(statusCode: 200..<300)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    completion(nil)
                    return
                }
                guard let userDict = response.value as? [String: Any] else {return}
                completion(User(userDict: userDict))
        }
    }
    
    func createFamilyWithName(_ name:String,uniqueCode:String, completion:@escaping (User?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(familyPath)") else {return}
        guard let uid = uid else {return}
        Alamofire.request(url,
                          method: .post,
                          parameters: ["name":name,"code":uniqueCode,"uid":uid],
                          encoding: JSONEncoding.default,
                          headers: nil).validate(statusCode: 200..<300)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    completion(nil)
                    return
                }
                guard let userDict = response.value as? [String: Any] else {return}
                completion(User(userDict: userDict))
        }
    }
    
    func getUser(_ completion:@escaping (User?) -> Void) {
        guard let uid = uid else {return}
        guard let url = URL(string: "\(baseURL)/\(userPath)/\(uid)") else {return}
    
        Alamofire.request(url,
                          method: .get,
                          headers: nil).validate(statusCode: 200..<300)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    completion(nil)
                    return
                }
                guard let userDict = response.value as? [String: Any] else {return}
                completion(User(userDict: userDict))
        }
    }
    
    func createTask(_ completion:@escaping (User?) -> Void) {
        
    }
    
    
    func joinFamilyWithCode(_ code:String, completion:@escaping (User?) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(familyPath)/\(join)") else {return}
        guard let uid = uid else {return}
        Alamofire.request(url,
                          method: .post,
                          parameters: ["code":code,"uid":uid],
                          encoding: JSONEncoding.default,
                          headers: nil).validate(statusCode: 200..<300)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    completion(nil)
                    return
                }
                guard let userDict = response.value as? [String: Any] else {return}
                completion(User(userDict: userDict))
        }
    }
}
