//
//  TimerViewController.swift
//  Stay Hydreted
//
//  Created by Blurry Rabbit on 02.05.2020.
//  Copyright © 2020 Blurry Rabbit. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var timerPicker: UIDatePicker!
    
    @IBAction func startButtonIsPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "START" {
            
            sender.setTitle("STOP", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            
            counter = timerPicker.countDownDuration
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.counter -= 1
                print(self.counter)
                if self.counter <= 0 {
                    self.createNotification()
                    timer.invalidate()
                }
            }
        } else {
            sender.setTitle("START", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            counter = 0.0
            
        }
    }
    
    @IBAction func closeButtonIsPressed(_ sender: UIButton) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    private var counter = 0.0
    private var buttonState = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: .alert) { (isAllowed, _) in
            if !isAllowed {
                print("Notifications not allowed")
            }
        }
        
        timerPicker.addTarget(self, action: #selector(startButtonIsPressed), for: .valueChanged)
    }
    
    internal func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .badge, .sound])
    }
    
    private func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "You need to drink!"
        content.subtitle = "Let's go already!"
        content.body = "Grab some beer!"
        content.badge = 1
        
        let request = UNNotificationRequest(identifier: "Notification", content: content, trigger: nil)
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().add(request)
    }
}
