//
//  StatisticView.swift
//  WeighMe
//
//  Created by Boyce Estes on 2/7/22.
//

import SwiftUI
import CoreData

struct StatisticView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Weight.date, ascending: true)],
        animation: .default
    )
    
    private var weights: FetchedResults<Weight>
    
    var body: some View {
        List {
            ForEach(weights) { weight in
                
                HStack {
                    Text("Day")
                        .font(.caption)
                    Text("\(getString(for: weight.date ?? Date()))" )
                    
                    Spacer()
                    
                    Text("\(weight.value)")
                }
            }
        }
    }
    
    
    func getString(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateStyle = .medium
        
        return formatter.string(from: date)
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
            .environment(
                \.managedObjectContext,
                 PersistenceController.preview.container.viewContext
            )
    }
}
