//
//  ContentView.swift
//  WariKan
//
//  Created by Serrano Soria, Juan on 25/03/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var billAmount = 10
    @State private var numberOfPeople = 2
    
    var amountPerPerson: Int {
        return (billAmount / numberOfPeople)
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("何円ですか？", value: $billAmount, format: .currency(code: "JPY"))
                        .keyboardType(.decimalPad)
                    
                    Picker("何人ですか？", selection: $numberOfPeople) {
                        ForEach(1...100, id: \.self) {
                            Text("\($0)人")
                        }
                    }
                }
                Section("一人当たり") {
                    Text(amountPerPerson, format: .currency(code: "JPY"))
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
