//
//  AddFoodView.swift
//  CaloriesTracker
//
//  Created by Jai  on 21/11/23.
//

import SwiftUI

struct AddFoodView: View {
    @Environment (\.managedObjectContext) var managedobjContext
    @Environment (\.dismiss) var dismiss
    
    @State private var  name = ""
    @State private var calories:Double = 0
    var body: some View {
        Form{
            Section {
                TextField("Food Name" , text : $name)
                VStack{
                    Text("Calories:\(Int(calories))")
                    Slider(value: $calories , in: 0...10000, step: 1)
                }
                .padding()
                
                HStack{
                    Spacer()
                    
                    Button("Submit"){
                        DataController().addfood(name: name, calories: calories, context: managedobjContext)
                        
                        
                        
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AddFoodView()
}
