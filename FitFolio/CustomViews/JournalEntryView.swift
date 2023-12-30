//
//  JournalEntryView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-27.
//

import SwiftUI
import Combine

struct JournalEntry {
    var timestamp: Date
    var calories: Int
    var fats: Int
    var carbs: Int
    var protein: Int
}

class JournalEntryViewModel: ObservableObject {
    @Published var journalEntries: [JournalEntry] = []
    
    /// Returns whether the array is empty or not.
    ///
    func isEmpty() -> Bool {
        journalEntries.isEmpty
    }
    
    /// Returns the number of entries in the array.
    ///
    func numEntries() -> Int {
        journalEntries.count
    }

    /// Adds an entry to the end of the list of entries.
    ///
    /// - Parameters:
   ///     - entry: the new entry to be added into the list of  journal entries.
   ///
    func addEntry(entry: JournalEntry) -> Void {
        journalEntries.append(entry)
    } // addEntry
    
    /// Adds an entry into the list of entries at the specificed index.
    ///
    /// - Parameters:
    ///     - entry: the new entry to be added into the list of  journal entries.
    ///     - index: the position where the new entry should be placed
   ///
    func insertEntry(entry: JournalEntry, at index: Int) -> Void {
        guard index >= 0 && index <= journalEntries.count else {
            print("Invalid index. Entry not inserted.")
            return
        }
            journalEntries.insert(entry, at: index)
    } // insertEntry

    /// Removes an entry from the list of entries at the specificed index.
    ///
    /// - Parameters:
    ///     - index: the position where the chosen entry should be removed
   ///
    func removeEntry(at index: Int) {
        guard index >= 0, index < journalEntries.count else {
            print("Invalid index. Entry not removed.")
            return
        }
        journalEntries.remove(at: index)
    } // removeEntry
    
    /// Removes all entries from the list of journal entries.
    ///
    ///
    func removeAllEntries() {
        journalEntries.removeAll()
    }
    
    /// Updates the entry at the specificed index with new values for each property of the entry.
    ///
    /// - Parameters:
    ///     - index: the position where the chosen entry should be removed
    ///     - newTimestamp: the new time at when the entry was created
    ///     - newCalories: the updated calories value
    ///     - newFats: the updaed fats value
    ///     - newCarbs: the updated carbs value
    ///     - newProtein: the updated protein value
    ///
    func updateEntry(at index: Int, newTimestamp: Date? = nil, newCalories: Int? = nil, newFats: Int? = nil, newCarbs: Int? = nil, newProtein: Int? = nil) {
        guard index >= 0, index < journalEntries.count else {
            print("Invalid index. Entry not updated.")
            return
        }
        var updatedEntry = journalEntries[index]

        // Updating only the non-nil parameters
        updatedEntry.timestamp = newTimestamp ?? updatedEntry.timestamp
        updatedEntry.calories = newCalories ?? updatedEntry.calories
        updatedEntry.fats = newFats ?? updatedEntry.fats
        updatedEntry.carbs = newCarbs ?? updatedEntry.carbs
        updatedEntry.protein = newProtein ?? updatedEntry.protein

        journalEntries[index] = updatedEntry
    } // updateEntry
    
}

struct JournalEntryView: View {
    @ObservedObject var viewModel = JournalEntryViewModel()
    var body: some View {
        HStack {
            // Time stamp column
            VStack {
                createHourlyTimestampLabels()
            }
            // Actual journal entry column
            VStack {
                Text("Hello World 2")
            }
        } // HStack
    } // body
    
    private static func getMidnightDate() -> Date {
        let calendar = Calendar.current
        let components = DateComponents(hour: 0, minute: 0, second: 0)
        return calendar.date(from: components) ?? Date()
    } // getMidnightDate
    
    
    private func generateHourlyTimestamps(startingFrom startDate: Date, for numberOfHours: Int) -> [Date] {
        var timestamps: [Date] = []
        
        for hour in 0..<numberOfHours {
            if let timestamp = Calendar.current.date(byAdding: .hour, value: hour, to: startDate) {
                timestamps.append(timestamp)
            }
        }
        return timestamps
    } // generateHourlyTimestamps
    
    private func createHourlyTimestampLabels(startingFrom currDate: Date = getMidnightDate(), for numberOfHours: Int = 24) -> some View {
        let generatedTimestamps = generateHourlyTimestamps(startingFrom: currDate, for: numberOfHours)
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:00 a"  // "h" for 12-hour clock, "a" for AM/PM
        
        return VStack {
                ForEach(generatedTimestamps, id: \.self) { timestamp in
                    let formattedHour = dateFormatter.string(from: timestamp)
                    
                    Text(formattedHour)
                        .padding(4)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color.black.opacity(0.05))
                                .stroke(Color.gray, lineWidth: 2)
                        )
                        .bold()
                }
            }
    } // createHourlyTimestampLabels
    
} // JournalEntryView

#Preview {
    JournalEntryView()
}
