//
//  FamilyVC.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/12/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class FamilyVC: UIViewController {
    var family:Family?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FamilyVC:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return family?.members.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let familyMemberCell = tableView.dequeueReusableCell(withIdentifier: "FamilyMemberCell", for: indexPath) as! FamilyMemberCell
        familyMemberCell.member = family?.members[indexPath.row]
        return familyMemberCell
    }
    
}

extension FamilyVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let memberDetailVC = storyboard?.instantiateViewController(withIdentifier: "MemberDetailVC") as! MemberDetailVC
        memberDetailVC.member = family?.members[indexPath.row]
        navigationController?.pushViewController(memberDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
