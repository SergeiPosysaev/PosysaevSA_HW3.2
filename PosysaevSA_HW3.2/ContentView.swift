//
//  ContentView.swift
//  PosysaevSA_HW3.2
//
//  Created by Sergei Posysaev on 13.12.2020.
//

import SwiftUI

class Model: ObservableObject {
    
    @Published var rTextFieldValue: Double = 50
    @Published var gTextFieldValue: Double = 50
    @Published var bTextFieldValue: Double = 50
    
}


struct ContentView: View {    
    
    @ObservedObject var model = Model()
    
    var body: some View {
        ZStack{
            Color(.systemBlue)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.9)
            
            VStack(spacing: 20) {
                Color(red: model.rTextFieldValue / 255,
                      green: model.gTextFieldValue / 255,
                      blue: model.bTextFieldValue / 255)
                    .frame(width: 350, height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 4))
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                
                HStack {
                    ColorSlider(accentColor: Color.red,
                                valueToSlider: $model.rTextFieldValue)
                    TextFieldForSlider(value: $model.rTextFieldValue)
                      
                    Spacer()
                }
                
                HStack {
                    ColorSlider(accentColor: Color.green,
                                valueToSlider: $model.gTextFieldValue)
                    TextFieldForSlider(value: $model.gTextFieldValue)
                    Spacer()
                }
                
                HStack {
                    ColorSlider(accentColor: Color.blue,
                                valueToSlider: $model.bTextFieldValue)
                    TextFieldForSlider(value: $model.bTextFieldValue)
                    Spacer()
                }

                
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


