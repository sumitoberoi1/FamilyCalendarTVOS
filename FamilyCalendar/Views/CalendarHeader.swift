//
//  CalendarHeader.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/10/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import UIKit
import SwiftDate

protocol CalendarHeaderDelegate {
    func prevMonthTappedForMonth(_ date:Date?, in calendarHeader:CalendarHeader)
    func nextMonthTappedForMonth(_ date:Date?, in calendarHeader:CalendarHeader)
}
class CalendarHeader: UICollectionReusableView {
    var date:Date? {
        didSet {
            if let date = date {
                monthLabel.text = date.monthName(.default)
            }
        }
    }
    var delegate:CalendarHeaderDelegate?
    @IBOutlet weak var monthLabel: UILabel!
    @IBAction func prevMonthButtonTapped(_ sender: UIButton) {
        delegate?.prevMonthTappedForMonth(date, in: self)
    }
    @IBAction func nextMonthTapped(_ sender: UIButton) {
        delegate?.nextMonthTappedForMonth(date, in: self)
    }

}
