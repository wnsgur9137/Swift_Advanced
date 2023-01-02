//
//  ContentView.swift
//  SwiftUINotificationStudy
//
//  Created by 이준혁 on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedDate = Date()
    let notify = NotificationHandler()
    
    var body: some View {
        VStack(spacing: 20.0) {
            Spacer()
            Button("Send a notification in 5 seconds") {
                notify.sendNotification(date: Date(), type: "time", timeInterval: 5, title: "Hey there!", body: "This is a reminder you set 5 seconds ago!")
            }
            Spacer()
            Text("Not working?")
                .foregroundColor(.gray)
                .italic()
            Button("Request permissions") {
                notify.askPermission()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
