//
//  FamilyMemberCell.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/12/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class FamilyMemberCell: UITableViewCell {
    @IBOutlet weak var memberLabel: UILabel!
    @IBOutlet weak var isAdultLabel: UILabel!
    @IBOutlet weak var colorLabel: UIView!
    @IBOutlet weak var createTaskButton: UIButton!
    
    @IBOutlet weak var deleteMemberButton: UIButton!
    var isbtnFirst  = false
    var isbtnSecond = false
    var isDefault   = false
    var member:User? {
        didSet {
            configUI()
        }
    }
    
    func configUI() {
        guard let member = member else  {return}
        memberLabel.text = member.email
        isAdultLabel.text = member.isAdult ? "Adult":"Child"
        colorLabel.backgroundColor = member.color
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

