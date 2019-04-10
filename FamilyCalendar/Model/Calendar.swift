//
//  Calendar.swift
//  FamilyCalendar
//
//  Created by sumit oberoi on 4/10/19.
//  Copyright © 2019 Stevens Institute of Technology. All rights reserved.
//

import Foundation


struct MyCalendar {
    let todayDate = Date()
    public func getDatesForMonth(_ date:Date) -> [Date] {
        let calendar = Calendar.current
        var allDates = [Date]()
        guard let totalDays = calendar.range(of: .day, in: .month, for: date) else {return allDates}
        for i in totalDays {
            let dateComponents = DateComponents(calendar: calendar,year: calendar.component(.year, from: date), month:  calendar.component(.month, from: date), day: i)
            if let curdate = calendar.date(from: dateComponents) {
                allDates.append(curdate)
            }
        }
        return allDates
    }
}
