//
//  TimestampsView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2024-01-01.
//

import SwiftUI

struct TimestampsView: View {
   // let dailyTimestamps: [Date] // this is a dynamic array that will change accordingly to the amount of food items that a user has put in a day. by default, the dailytimestamps will be full of ONLY timestamps with a :00
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color(red: 0.90, green: 0.90, blue: 0.90)).frame(width: 2, height: 200).rotationEffect(.degrees(180.0)) // the height would change
            VStack(spacing: 10.0) {
               // for timestamp in dailyTimestamps {
                    
             //   }
                
                createLargeTimestamp(currTime: "12:00 AM")
                createSmallTimestamp(currTime: "12:20 AM")
                createLargeTimestamp(currTime: "1:00 AM")
                createSmallTimestamp(currTime: "1:20 AM")
                createSmallTimestamp(currTime: "1:26 AM")
            } // timestamps
        } // ZStack
        
        
    } // body
    
    private func createLargeTimestamp(currTime: String) -> some View {
        Text(currTime).padding(10).background(RoundedRectangle(cornerRadius: 5).fill(Color(red: 0.95, green: 0.95, blue: 0.95)) // Set the corner radius here
            .stroke(Color.gray.opacity(0.1), lineWidth: 2)
        ).bold()
    } // createLargeTimestamp
    
    private func createSmallTimestamp(currTime: String) -> some View {
        Text(currTime).font(.caption).padding(4).background(RoundedRectangle(cornerRadius: 5).fill(Color(red: 0.95, green: 0.95, blue: 0.95)) // Set the corner radius here
            .stroke(Color.gray.opacity(0.15), lineWidth: 1.5)
        ).bold()
    } // createSmallTimestamp
    
} // TimestampsView


#Preview {
    TimestampsView()
}
