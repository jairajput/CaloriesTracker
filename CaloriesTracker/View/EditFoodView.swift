//
//  EditFoodView.swift
//  CaloriesTracker
//
//  Created by Jai  on 21/11/23.
//

import SwiftUI

struct EditFoodView: View {
    @Environment (\.managedObjectContext) var managedobjContext
    @Environment (\.dismiss) var dismiss
    
    var food:FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    var body: some View {
        Form{
            Section{
                TextField("\(food.name!)", text: $name)
                    .onAppear{
                        name = food.name!
                        calories = food.calories
                    }
                VStack{
                    Text("Calories:\(Int(calories))")
                    Slider(value: $calories , in: 0...1000, step: 1)
                }
                .padding()
                
                HStack{
                    Spacer()
                    Button("Submit"){
                        DataController().editFood(food: food, name: name, calories: calories, context: managedobjContext)
                        
                        
                        dismiss()
                    }
                    Spacer()
                }
            }
        }
    }
}


