//
//  CalendarVC.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/10/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import SwiftDate

class CalendarVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var familyNameLabel: UILabel!
    var user:User?
    let mycalendar = MyCalendar()
    var activeDate = Date() {
        didSet {
            collectionView.reloadData()
        }
    }
    var dateArray:[Date] {
        get {
            return mycalendar.getDatesForMonth(activeDate)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
}

//MARk: UI methods
private extension CalendarVC {
    func configUI() {
        setLabels()
    }
    
    private func setLabels() {
        self.familyNameLabel.text = user?.family?.name ?? ""
    }
}


//MARK: IBactions

private extension CalendarVC {
    @IBAction func viewFamilyMemberTapped(_ sender: UIButton) {
        let familyVC = storyboard?.instantiateViewController(withIdentifier: "FamilyVC") as! FamilyVC
        familyVC.family = user?.family
        navigationController?.pushViewController(familyVC, animated: true)
    }
    
    @IBAction func addTaskTapped(_ sender: UIButton) {
        let createTaskVC = storyboard?.instantiateViewController(withIdentifier: "CreateTaskVC") as! CreateTaskVC
        createTaskVC.user = user
        navigationController?.pushViewController(createTaskVC, animated: true)
    }
    
}
extension CalendarVC:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dateArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let calendarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        let day = Calendar.current.component(.day, from: dateArray[indexPath.row])
        calendarCell.dateLabel.text = "\(day)"
        return calendarCell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CalendarHeader", for: indexPath) as? CalendarHeader else {
                fatalError("Invalid view Type")
            }
            headerView.date = activeDate
            headerView.delegate = self
            return headerView
        default:
            assert(false,"Invalid element type")
        }
    }
    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView != nil {
            coordinator.addCoordinatedAnimations({
                context.nextFocusedView?.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            }, completion: nil)
           
        }
        if context.previouslyFocusedView != nil {
            coordinator.addCoordinatedAnimations({
                context.previouslyFocusedView?.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }, completion: nil)
        }
    }
}

extension CalendarVC:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200.0, height: 165.0)
    }
}

extension CalendarVC:CalendarHeaderDelegate {
    func prevMonthTappedForMonth(_ date: Date?, in calendarHeader: CalendarHeader) {
        guard let date = date else {return}
        activeDate = date - 1.months
    }
    func nextMonthTappedForMonth(_ date: Date?, in calendarHeader: CalendarHeader) {
         guard let date = date else {return}
        activeDate = date + 1.months
    }
}
