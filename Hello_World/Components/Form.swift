//
//  Form.swift
//  Hello_World
//
//  Created by Enrique SFranco on 20/09/23.
//

import SwiftUI

struct CustomForm: View {
    
    @State private var name = ""
//    App selectect yout favorite character of harry potter
    @State private var defaultSelectionCharacter = "Harry"
    private var characters = ["Harry", "Hermione", "Ron", "Draco"]
    
//    App amount
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 30]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let total = checkAmount + tipValue
        let amountPerPeople = total / peopleCount
        return amountPerPeople
    }
    
    var body: some View {
        NavigationView {
            Form { // el form solo permite tener 10 elementos sin el group
                Section(header: Text("Personal Information")) { // el group podemos agregar mas elementos
                    TextField("Enter your name", text: $name)
                    Text("Your name is: \(name)")
                }
                
                Section(header: Text("Select your favorite character")) {
                    Picker("Character", selection: $defaultSelectionCharacter) {
                        ForEach(characters, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section(header: Text("distribute account")) {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(.green)
                        .fontWeight(.bold)
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline) // centra el titulo en la parte superior
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct CustomForm_Preview: PreviewProvider {
    static var previews: some View {
        CustomForm()
    }
}
