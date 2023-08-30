//
//  Date+Ext.swift
//  MovieDB
//
//  Created by Ahmad Hassan Ansari on 25.08.23.
//

import Foundation
extension Date {
  /*
   * Removes time component from date and return new date
   */
  func stripTime() -> Date {
    let components = Calendar.current.dateComponents([.year, .month, .day], from: self)
    let date = Calendar.current.date(from: components)
    return date!
  }

  func stringValue(format: String) -> String? {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
    formatter.dateFormat = format
    return formatter.string(from: self)
  }
}
