//
//  AddView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2023-12-09.
//

import SwiftUI

struct AddView: View {
    @Binding var selectedText: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear { selectedText = "Add" }
    }
}

#Preview {
    AddView(selectedText: .constant("Preview Text"))
}
