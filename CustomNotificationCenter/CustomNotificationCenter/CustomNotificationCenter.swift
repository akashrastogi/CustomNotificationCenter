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
  private init() {
    storage = [:]
  }

  private var storage: [String: [String: [Closure]]]

  func addObserver(_ _class: AnyClass, name: String, closure: @escaping Closure) {
    let className = String(describing: _class)
    if storage[className] != nil, storage[className]?[name] != nil {
      storage[className]?[name]?.append(closure)
    } else {
      storage[className] = [name: [closure]]
    }
  }

  func removeObserver(_ _class: AnyClass) {
    let className = String(describing: _class)
    storage.removeValue(forKey: className)
  }

  func removeObserver(_ _class: AnyClass, name: String) {
    let className = String(describing: _class)
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
