//
//  CreateTaskVC.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/11/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit

class CreateTaskVC: UIViewController {
    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var taskDescriptionTextField: UITextField!
    @IBOutlet weak var childSafeSegment: UISegmentedControl!
    @IBOutlet weak var textLocationTextField: UITextField!
    
    var user:User?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: IBActions
private extension CreateTaskVC {
    @IBAction func chooseTaskDateTapped(_ sender:UIButton) {
        
    }
    @IBAction func createTaskTapped(_ sender:UIButton) {
        
    }
}

private extension CreateTaskVC {
    
}
