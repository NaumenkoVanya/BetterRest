//
//  ContentView.swift
//  BetterRestMy
//
//  Created by Ваня Науменко on 13.02.24.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var sleepAmountTwo = 9.0
    @State private var wakeUp = Date.now
    var someDate = Calendar(identifier: .gregorian)
    @State private var components = DateComponents()
    
    var body: some View {
        VStack {
            Text(Date.now.formatted(date: .long, time: .shortened))
            
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.hour().minute().day().month())
            DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
            Stepper("\(sleepAmountTwo.formatted()) hours", value: $sleepAmountTwo, in: 4...12, step: 0.25)
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
