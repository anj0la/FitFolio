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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    JournalEntryView()
}
