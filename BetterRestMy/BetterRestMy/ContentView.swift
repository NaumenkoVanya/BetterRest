//
//  ContentView.swift
//  BetterRestMy
//
//  Created by Ваня Науменко on 13.02.24.
//

import SwiftUI

struct ContentView: View {
    //MARK: Day 25
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeamount = 1
    
    //MARK: 24 day - 1
//    @State private var sleepAmount = 8.0
//    @State private var sleepAmountTwo = 9.0
//    @State private var wakeUp = Date.now
//    var someDate = Calendar(identifier: .gregorian)
//    @State private var components = DateComponents()
//    
    func calculateBedtime() {
        
    }
    var body: some View {
        //MARK: 25 day
        NavigationStack {
            Spacer()
            VStack {
                Text("When do you wont wake up?")
                    .font(.headline)
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("Desired amount og sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            }
            .padding()
            
            Spacer()
            
            VStack {
                Text("Daily coffee intake")
                Stepper("\(coffeeamount)  cup(s)", value: $coffeeamount, in: 1...20)
            
            }
            .padding()
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Caiculate", action: calculateBedtime)
            }
            
            Spacer()
            Spacer()
            
        }

//            //MARK: 24 day - 2
//        VStack {
//            Text(Date.now.formatted(date: .long, time: .shortened))
//            
//            Text(Date.now, format: .dateTime.hour().minute())
//            Text(Date.now, format: .dateTime.hour().minute().day().month())
//            DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                .labelsHidden()
//            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
//            Stepper("\(sleepAmountTwo.formatted()) hours", value: $sleepAmountTwo, in: 4...12, step: 0.25)
//        }
    }
}

#Preview {
    ContentView()
}
