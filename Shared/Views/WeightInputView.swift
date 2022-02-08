//
//  WeightInputView.swift
//  WeighMe
//
//  Created by Boyce Estes on 2/7/22.
//

import SwiftUI

struct WeightInputView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @State private var weightInput: String = ""
    
    
    var body: some View {
        
        VStack {
        
            TextField(
                "Weight",
                text: $weightInput
            )
            .keyboardType(.decimalPad)

            Button {
                print("Submit")
                // save this weight for this day in core data
                
                guard !weightInput.isEmpty,
                      let weightValue = Double(weightInput) else {
                          return
                      }
                
                let day = getEarliestDateToday()
                
                let weight = Weight(context: viewContext)
                weight.date = day
                weight.value = weightValue
                
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                
//                guard weightInput has value
//                let moc = context
//                let day = getEarliestDateToday()
//
//                query weights for this day
//                        If there already is one get the object weight.date = day
//                        else, weight = new Weight
//
//                weight.value = weightInput
//                save context
            } label: {
                Text("Submit")
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.blue, lineWidth: 3)
        )
        .border(Color.gray)
        
    }
    
    func getEarliestDateToday() -> Date? {
        
        let date = Date()
        let calendar = Calendar.current
        
//        let day = calendar.component(.day, from: date)
//        let month = calendar.component(.month, from: date)
//        let year = calendar.component(.year, from: date)
        
        var dateComponents = calendar.dateComponents([.day, .month, .year], from: date)
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.nanosecond = 0
        
        return calendar.date(from: dateComponents)
    }
}


struct WeightInputView_Previews: PreviewProvider {
    static var previews: some View {
        WeightInputView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}


/*
 
 ContentView
    ContainerView - Hold NavigationView, statistics and weight input is here in one screen
        StatisticsView - Query the weight history. Format it into a line graph
        WeightInputView - Input weight for date, save into Core Data
    
 
 
 */
