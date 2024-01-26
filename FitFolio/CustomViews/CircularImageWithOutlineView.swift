//
//  CircularImageWithOutlineView.swift
//  FitFolio
//
//  Created by Anjola Aina on 2024-01-25.
//

import SwiftUI

struct CircularImageWithOutlineView: View {
    let chosenImage: String
    let frameWidth: CGFloat
    let frameHeight: CGFloat
    let paddingSize: CGFloat
    let lineWidth: CGFloat
    
    var body: some View {
        Image(systemName: chosenImage) // Replace this with your image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: frameWidth, height: frameHeight).padding(paddingSize)
            .background(Circle().stroke(Color.black, lineWidth: lineWidth))
            .clipShape(Circle())
    }
}

#Preview {
    CircularImageWithOutlineView(chosenImage: "eraser", frameWidth: 50, frameHeight: 50, paddingSize: 10, lineWidth: 7.5)
}
