//
//  PathView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-09.
//

import SwiftUI

struct PathView: View {
    @Binding var selectedText: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear { selectedText = "Path" }
    }
}

#Preview {
    PathView(selectedText: .constant("Preview Text"))
}
