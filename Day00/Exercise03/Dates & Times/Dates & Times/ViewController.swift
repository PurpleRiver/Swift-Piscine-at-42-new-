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
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    private var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { (isAllowed, error) in
            if isAllowed != true {
                print("Notifications not allowed")
            }
        }
        
        timePicker.addTarget(self, action: #selector(setTimer), for: .valueChanged)
        counter = timePicker.countDownDuration
    }
    
    @objc func setTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            self.counter -= 1
            print(self.counter)
            if self.counter <= 0 {
                self.createNotification()
                timer.invalidate()
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

           completionHandler([.alert, .badge, .sound])
       }
    
    private func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Time's up"
        content.subtitle = "Let's go already!"
        content.body = "Crabbish, Practish, Good!"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: trigger)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request)
    }
}

