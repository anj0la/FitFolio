//
//  File: ContentView.swift
//  App: FitFolio
//  Author: Anjola aina
//  Last Modified: Saturday, December 9th, 2023
//
// Description:
//
// This Swift file defines the ContentView struct, which serves as the main content view for FitFolio. The ContentView includes a TabView to handle navigation between different screens within the application.
//
// Structure:
// - ContentView: SwiftUI View struct responsible for the main content layout.
//   - TabView: A SwiftUI container view that manages multiple child views, allowing users to navigate between them using tabs.
//
// Usage:
// - ContentView is typically set as the root view in the application's main file (e.g., App.swift).
// - Inside the TabView, different child views represent distinct screens or functionalities of the application.
// - Each child view can be customized and extended as needed.

// Example:
//
// struct ContentView: View {
//      var body: some View {
//          TabView {
//              Child view 1
//              Text("Screen 1")
//              .tabItem {
//              Image(systemName: "1.circle")
//              Text("Screen 1")
//              }
//

import SwiftUI

struct ContentView: View {
    @State var currentView = "" // default value

    var body: some View {
        Text(currentView)
        TabView {
            ScrollView {
                DashboardView(selectedText: $currentView)
            }
            .tabItem {
                    Label("Dashboard", systemImage: "square.grid.2x2.fill")
                }
            ScrollView {
                JournalView(selectedText: $currentView)
            }
                .tabItem {
                    Label("Journal", systemImage: "book.pages.fill")
                }
            AddView(selectedText: $currentView)
                .tabItem {
                    Label("Add", systemImage: "plus.circle.fill")
                }
            PathView(selectedText: $currentView)
                .tabItem {
                    Label("Path", systemImage: "point.topleft.down.to.point.bottomright.curvepath.fill")
                }
            MoreView(selectedText: $currentView)
                .tabItem {
                    Label("More", systemImage: "ellipsis")
                }
        }.tint(.black)
        
    } // body
    
   
} // ContentView

#Preview {
    ContentView()
} // #Preview
