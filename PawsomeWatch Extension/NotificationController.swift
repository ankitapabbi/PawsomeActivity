//
//  NotificationController.swift
//  PawsomeWatch Extension
//
//  Created by Ankita Pabbi on 2020-08-24.
//  Copyright © 2020 Razeware LLC. All rights reserved.
//

import WatchKit
import Foundation
import UserNotifications


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var image: WKInterfaceImage!
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    /*
    override func didReceive(_ notification: UNNotification, withCompletion completionHandler: @escaping (WKUserNotificationInterfaceType) -> Swift.Void) {
        // This method is called when a notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.custom)
    }
    */
  
  // 1
  override func didReceive(_ notification: UNNotification,
                           withCompletion completionHandler:
    @escaping (WKUserNotificationInterfaceType) -> Void) {
    // 2
    let notificationBody = notification.request.content.body
    label.setText(notificationBody)
    // 3
    if let imageAttachment =
      notification.request.content.attachments.first {
      let imageURL = imageAttachment.url
      let imageData = try! Data(contentsOf: imageURL)
      let newImage = UIImage(data: imageData)
      image.setImage(newImage)
    } else {
      let catImageName = String(format: "cat%02d",
                                arguments: [Int.randomInt(1, max: 20)])
      image.setImageNamed(catImageName)
    }
    // 4
    completionHandler(.custom)
  }
  
}
