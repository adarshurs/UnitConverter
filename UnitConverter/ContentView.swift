//
//  ContentView.swift
//  UnitConverter
//
//  Created by Adarsh Urs on 18/03/21.
//

import SwiftUI

struct ContentView: View {
    @State private var valueToConvert = "0.0"
    @State private var unit = 0
    @State private var unitToConvert = 0
    @State private var units = ["mltr", "ltr", "cups", "pints", "gallons"]
    
    var valueAfterConversion : Double{
        var convertedValue = 0.0
        var valueInmLtr = 0.0
        
        switch unit {
        case 0:
            valueInmLtr = Double(valueToConvert) ?? 0
            break
        case 1:
            valueInmLtr = (Double(valueToConvert) ?? 0) * 1000
            break
        case 2:
            valueInmLtr = (Double(valueToConvert) ?? 0) * 240
            break
        case 3:
            valueInmLtr = (Double(valueToConvert) ?? 0) * 473.176
            break
        case 4:
            valueInmLtr = (Double(valueToConvert) ?? 0) * 3785.41
            break
        default:
            break
        }
        
        switch unitToConvert {
        case 0:
            convertedValue = valueInmLtr
            break
        case 1:
            convertedValue = Double(valueInmLtr) / 1000
            break
        case 2:
            convertedValue = Double(valueInmLtr) / 240
            break
        case 3:
            convertedValue = Double(valueInmLtr) / 473.176
            break
        case 4:
            convertedValue = Double(valueInmLtr) / 3785.41
            break
        default:
            break
        }
        
        return convertedValue
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("Value for Conversion")){
                    
                    TextField("Value", text:$valueToConvert)
                        .keyboardType(.decimalPad)
                    
                    Picker("Convert From", selection:$unit){
                        ForEach(0 ..< units.count){
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }.textCase(.none)
                
                Section(header:Text("After Conversion")){
                    
                    Text("\(valueAfterConversion, specifier: "%.2f")")
                    
                    Picker("Convert to", selection:$unitToConvert){
                        ForEach(0 ..< units.count){
                            Text("\(units[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    
                }.textCase(.none)
            }
            .navigationTitle("uConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
