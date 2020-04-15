//
//  AddView.swift
//  iExpense
//
//  Created by Maris Lagzdins on 14/04/2020.
//  Copyright © 2020 Developer Maris. All rights reserved.
//

import SwiftUI

struct AddView: View {
    static let types = ["Business", "Personal"]
    
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = Self.types[1]
    @State private var amount = ""
    @State private var showingWarning = false
    @State private var warningMessage = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }
            .navigationBarTitle("Add new expense")
            .navigationBarItems(trailing:
                Button("Save") {
                    guard let actualAmount = Int(self.amount) else {
                        self.warningMessage = "Provided amount is not an integer - \(self.amount)"
                        self.showingWarning = true
                        return
                    }

                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
        }
        .alert(isPresented: $showingWarning) {
            Alert(title: Text("Warning"), message: Text(warningMessage), dismissButton: .default(Text("OK")))
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
