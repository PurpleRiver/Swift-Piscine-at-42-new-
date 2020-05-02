//
//  ViewController.swift
//  Dates & Times
//
//  Created by Blurry Rabbit on 01.05.2020.
//  Copyright © 2020 Blurry Rabbit. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    private var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { (isAllowed, error) in
            if !isAllowed {
                print("Notifications not allowed")
            }
        }
        timePicker.addTarget(self, action: #selector(setTimer), for: .valueChanged)
    }
    
    @objc private func setTimer() {
        counter = timePicker.countDownDuration
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.countdownLabel.text = "\(Int(self.counter))"
            self.counter -= 1
            if self.counter <= 0 {
                self.createNotification()
                timer.invalidate()
            }
        }
    }
    
    internal func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

           completionHandler([.alert, .badge, .sound])
       }
    
    private func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time's up"
        content.subtitle = "Let's go already!"
        content.body = "Crabbish, Practish, Good!"
        content.badge = 1
                
        let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: nil)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request)
    }
}

