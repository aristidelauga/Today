//
//  EKEventsStore+AsyncFetch.swift
//  Today
//
//  Created by Aristide LAUGA on 11/03/2023.
//

import EventKit
import Foundation

extension EKEventStore {
  func reminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
    try await withCheckedThrowingContinuation{ continuation in
      fetchReminders(matching: predicate) { reminders in
        if let reminders {
          continuation.resume(returning: reminders)
        } else {
          continuation.resume(throwing: TodayError.failedReadingReminders)
        }
      }
    }
  }
}
