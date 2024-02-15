//
//  ContentView.swift
//  BetterRestMy
//
//  Created by Ваня Науменко on 13.02.24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    // MARK: Day 25
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    // MARK: 24 day - 1

//    @State private var sleepAmount = 8.0
//    @State private var sleepAmountTwo = 9.0
//    @State private var wakeUp = Date.now
//    var someDate = Calendar(identifier: .gregorian)
//    @State private var components = DateComponents()

    var body: some View {
        // MARK: 25 day

        NavigationStack {
            Form {
                Text("Your ideal dedtime is...\(alertMessage)")
                    .font(.title)
                    .bold()
                Section("When do you wont wake up?") {
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                }
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("When do you wont wake up?")
//                        .font(.headline)
//                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                        .labelsHidden()
//                }
                Section("Desired amount og sleep") {
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
//                VStack(alignment: .leading, spacing: 0) {
//                    Text("Desired amount og sleep")
//                        .font(.headline)
//                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
//                }
                Section("Daily coffee intake") {
                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                }
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("Daily coffee intake")
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
//                    Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
//                }
                Image("Снимок экрана 2024-02-15 в 13.55.56")
                    .resizable()
                    .scaledToFit()
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
            .padding()
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Caiculate", action: calculateDedtime)
            }
            
        }
        
    }
    
    func calculateDedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal dedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            // print("Ivan tuta")
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
//        showingAlert = true
    }
    
}

#Preview {
    ContentView()
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
