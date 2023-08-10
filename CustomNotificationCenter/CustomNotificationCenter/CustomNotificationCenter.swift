//
//  CustomNotificationCenter.swift
//  CustomNotificationCenter
//
//  Created by Akash Rastogi on 10/8/23.
//

import Foundation

typealias Closure = (String, Any) -> Void

final class CustomNotificationCenter {
  static let shared = CustomNotificationCenter()
  init() {
    storage = [:]
  }

  private var storage: [String: [String: [Closure]]]

  func addObserver(_ observer: AnyObject, name: String, closure: @escaping Closure) {
    let className = String(describing: observer)
    if storage[className] != nil, storage[className]?[name] != nil {
      storage[className]?[name]?.append(closure)
    } else {
      storage[className] = [name: [closure]]
    }
  }

  func removeObserver(_ observer: AnyObject) {
    let className = String(describing: observer)
    storage.removeValue(forKey: className)
  }

  func removeObserver(_ observer: AnyObject, name: String) {
    let className = String(describing: observer)
    storage[className]?.removeValue(forKey: name)
  }

  func postNotification(_ name: String, object: Any) {
    for (_, notificationData) in storage {
      for (notificationName, closures) in notificationData {
        guard notificationName == name else { continue }
        for closure in closures {
          closure(name, object)
        }
      }
    }
  }
}
