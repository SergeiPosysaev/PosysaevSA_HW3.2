//
//  ContentView.swift
//  PosysaevSA_HW3.2
//
//  Created by Sergei Posysaev on 13.12.2020.
//

import SwiftUI

class TextFieldOserved: ObservableObject {
    @Published var rTextFieldValue = ""
    @Published var gTextFieldValue = ""
    @Published var bTextFieldValue = ""
}

struct ContentView: View {
    
    @State var rSliderValue: Double
    @State var gSliderValue: Double
    @State var bSliderValue: Double
    
    @ObservedObject var TextFieldValue = TextFieldOserved()
    
    @State private var textFieldValue: String = ""
    @State private var isShowAlert = false
    
    var body: some View {
        ZStack{
            Color(.systemBlue)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.8)
            VStack(spacing: 20) {
               Color(red: rSliderValue,
                     green: gSliderValue,
                     blue: bSliderValue)
                    .frame(width: 350, height: 150)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 4))
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                
                HStack {
                   
                    ColorSlider(accentColor: Color.red,
                                valueToSlider: $rSliderValue)
                        .onAppear() {
                            rSliderValue = 0
                        }
                    TextFieldToSlider(value: $TextFieldValue.rTextFieldValue,
                                      valueToSlider: $rSliderValue)
                    Spacer()
                }
                HStack {
                  
                    ColorSlider(accentColor: Color.green,
                                valueToSlider: $gSliderValue)
                    TextFieldToSlider(value: $TextFieldValue.gTextFieldValue,
                                      valueToSlider: $gSliderValue)
                    Spacer()
                }
                HStack {
                   
                    ColorSlider(accentColor: Color.blue,
                                valueToSlider: $bSliderValue)
                    TextFieldToSlider(value: $TextFieldValue.bTextFieldValue,
                                      valueToSlider: $bSliderValue)
                    Spacer()
                }
                
                Text("\(TextFieldValue.rTextFieldValue)")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                
                Spacer()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rSliderValue: 0.5,
                    gSliderValue: 0.5,
                    bSliderValue: 0.5)
    }
}

struct ColorSlider: View {
    
    var accentColor: Color

    @Binding var valueToSlider: Double
    
    var body: some View {
        HStack(spacing: 5) {
            Text("\(Int(valueToSlider * 255))")
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.5),
                        radius: 2,
                        x: 2,
                        y: 2)
                .padding(.trailing)
            Spacer()
            Slider(value: $valueToSlider)
                .accentColor(accentColor)
                .shadow(color: Color.black.opacity(0.5),
                        radius: 2,
                        x: 2,
                        y: 2)
        }.padding(.horizontal, 16)
    }
}

struct TextFieldToSlider: View {
    
    @Binding var value: String
    @Binding var valueToSlider: Double
    
    var body: some View {
        TextField("\(Int(valueToSlider * 255))", text: $value)
            .frame(width: 40, alignment: .trailing)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
          
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(lineWidth: 2))
            .foregroundColor(.blue)
            .shadow(color: Color.gray.opacity(0.4),
                    radius: 3,
                    x: 1,
                    y: 2)
    }
}
