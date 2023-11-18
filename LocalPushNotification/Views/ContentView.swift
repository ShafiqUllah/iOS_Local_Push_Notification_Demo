//
//  ContentView.swift
//  LocalPushNotification
//
//  Created by Shafiq  Ullah on 11/17/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectDate = Date()
    let notify = NotificationHandler()
    
    
    var body: some View {
        VStack{
            Spacer()
            Button("Notification in 5 Sec"){
                notify.sendNotification(date: Date(),
                                        type: "time",
                                        timeInterval: 5,
                                        title: "Hey there",
                                        body: "this is a reminded for 5 sec")
            }
            
            
            DatePicker("pick a date", selection: $selectDate, in: Date()...)
            
            Button("Sehedule notification"){
                notify.sendNotification(date: selectDate,
                                        type: "date",
                                        title: "What's up?",
                                        body: "this is a reminded for schedule")
            }.tint(.pink)
            
            Spacer()
            Text("Not Working")
                .foregroundColor(.gray)
                .italic()
            Button("Request Permission"){
                notify.askNotificationPermission()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
