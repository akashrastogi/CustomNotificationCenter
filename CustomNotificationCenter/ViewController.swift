//
//  ViewController.swift
//  CustomNotificationCenter
//
//  Created by Akash Rastogi on 10/8/23.
//

import UIKit

class ViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    CustomNotificationCenter.shared.postNotification("viewDidLoadNotification", object: ["viewDidLoad": true])
  }
}
