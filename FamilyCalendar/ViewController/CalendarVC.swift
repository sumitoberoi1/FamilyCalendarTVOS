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
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView!.remembersLastFocusedIndexPath = false
        }
    }
    var user:User?
    var cellSize: CGSize {
        get {
            if let collectionView = collectionView {
                let window = UIApplication.shared.keyWindow
                let safeAreapTop = window?.safeAreaInsets.top ?? 0.0
                let safeAreaBottom = window?.safeAreaInsets.bottom ?? 0.0
                let safeAreaLeft = window?.safeAreaInsets.left ?? 0.0
                let safeAreaRight = window?.safeAreaInsets.right ?? 0.0
                
                return CGSize(width: (collectionView.bounds.width-safeAreaLeft+safeAreaRight)/7.0, height: (collectionView.bounds.height-safeAreapTop+safeAreaBottom)/5.0)
            } else {
                return CGSize(width: 0.0, height: 0.0)
            }
        }
    }
    
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

        // Do any additional setup after loading the view.
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
}

extension CalendarVC:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200.0, height: 100.0)
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
