//
//  Reminder+EKReminder.swift
//  Today
//
//  Created by Aristide LAUGA on 11/03/2023.
//

import EventKit
import Foundation

extension Reminder {
  init(with ekReminder: EKReminder) throws {
    guard let dueDate = ekReminder.alarms?.first?.absoluteDate else  {
      throw TodayError.reminderHasNoDueDate
    }
    id = ekReminder.calendarItemIdentifier
    title = ekReminder.title
    self.dueDate = dueDate
    notes = ekReminder.notes
    isComplete = ekReminder.isCompleted
  }
}

