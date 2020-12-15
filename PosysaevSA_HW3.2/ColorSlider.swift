//
//  ColorSlider.swift
//  PosysaevSA_HW3.2
//
//  Created by Sergei Posysaev on 15.12.2020.
//

import SwiftUI

struct ColorSlider: View {
    
    var accentColor: Color
    
    @Binding var valueToSlider: Double
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(Int(valueToSlider))")
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.5),
                        radius: 2,
                        x: 2,
                        y: 2)
                .padding(.trailing)
            Spacer()
            
            Slider(value: $valueToSlider, in: 0...255, step: 1)
                .accentColor(accentColor)
                .shadow(color: Color.black.opacity(0.5),
                        radius: 2,
                        x: 2,
                        y: 2)
            
        }.padding(.horizontal, 16)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(accentColor: .red, valueToSlider: .constant(50))
    }
}
