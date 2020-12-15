//
//  TextFieldForSlider.swift
//  PosysaevSA_HW3.2
//
//  Created by Sergei Posysaev on 15.12.2020.
//

import SwiftUI


struct TextFieldForSlider: View {
    
    @Binding var value: Double
    @State private var isShowAlert = false
    
    private let digitalFormatter = NumberFormatter()
    
    var body: some View {

        TextField("", value: $value,
                  formatter: digitalFormatter,
                  onCommit: {
            if value > 255 || value < 0 {
                value = 0
                isShowAlert = true
            }
        })
            .alert(isPresented: $isShowAlert, content: {
                Alert(title: Text("Wrong numbers!"),
                      message: Text("Please enter number from 0 to 255"))
            })
        .frame(width: 50, alignment: .trailing)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .background(Color.white)
        .foregroundColor(.blue)        
    }
}

struct TextFieldForSlider_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldForSlider(value: .constant(50))
    }
}
