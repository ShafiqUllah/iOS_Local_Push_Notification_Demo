//
//  NotificationHandler.swift
//  LocalPushNotification
//
//  Created by Shafiq  Ullah on 11/17/23.
//

import Foundation
import UserNotifications

class NotificationHandler{
    func askNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]){ success, error in
            if success {
                print("Access granted")
            }else if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func sendNotification(date:Date, type: String, timeInterval:Double = 10, title: String, body:String){
        var trigger : UNNotificationTrigger?
        
        if type == "date" {
            let dateComponenet = Calendar.current.dateComponents([.day,.month, .year, .hour, .minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponenet, repeats: false)
            
        }else if type == "time"{
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        }
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
