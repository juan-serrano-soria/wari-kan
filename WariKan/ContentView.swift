//
//  ContentView.swift
//  WariKan
//
//  Created by Serrano Soria, Juan on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = 2000
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 20]
    
    var amountPerPerson: Int {
        return billAmount / numberOfPeople
    }
    
    var extraAmount: Int {
        return billAmount % numberOfPeople
    }
    
    var tipAmountPerPerson: Int {
        return amountPerPerson * tipPercentage / 100 + (extraAmount > 0 ? extraAmount * tipPercentage / 100 : 0)
    }
    
    var tipReceived: Int {
        return tipAmountPerPerson * (numberOfPeople - 1)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("何円ですか？", value: $billAmount, format: .currency(code: "JPY"))
                        .keyboardType(.numberPad)
                    
                    Picker("何人ですか？", selection: $numberOfPeople) {
                        ForEach(1...100, id: \.self) {
                            Text("\($0)人")
                        }
                    }
                }
                Section("幹事への感謝金") {
                    Picker("幹事への感謝金", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.palette)
                }
                Section("一人当たり") {
                    Text(amountPerPerson, format: .currency(code: "JPY"))
                }
                if extraAmount > 0 {
                    Section("調整額") {
                        Text("幹事様が \(extraAmount, format: .currency(code: "JPY")) を調整させていただきます")
                    }
                }
                if (tipPercentage > 0) {
                    Section("感謝金") {
                        Text("一人当たりの感謝金額：\(tipAmountPerPerson, format: .currency(code: "JPY"))")
                        Text("幹事様への総感謝金：\(tipReceived, format: .currency(code: "JPY"))")
                    }
                }
            }
            .navigationTitle("割り勘")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
