//
//  ContentView.swift
//  abbyapp
//
//  Created by Abby on 2021/04/21.
//
import SwiftUI

struct ContentView: View {
    @State var leftTextFieldValue: String = ""
    @State var rightTextFieldValue: String = ""
    @State var resultValue : String = ""
    
    var buttonDisable: Bool {
        return leftTextFieldValue.isEmpty || rightTextFieldValue.isEmpty
    }
    
    var body: some View {
        VStack {
            HStack {
                TextField("", text: $leftTextFieldValue)
                    .accessibility(identifier: "leftTextField")
                    .frame(height: 60)
                    .padding(.horizontal, 8)
                    .border(Color.gray)
                
                Text("✖︎")
                    .font(Font.system(size: 32))
                    .padding()
                TextField("", text: $rightTextFieldValue)
                    .accessibility(identifier: "rightTextField")
                    .frame(height: 60)
                    .padding(.horizontal, 8)
                    .border(Color.gray)
            }
            Button(action: {
                self.resultButtonOnTap()
            }) {
                Text("=")
                    .font(Font.system(size: 32))
                    .frame(height: 60)
                    .padding(.horizontal, 64)
                    .foregroundColor(Color.black)
            }
            .accessibility(identifier: "resultButton")
            .disabled(buttonDisable)
            .border(Color.gray)
            
            Text(resultValue)
                .accessibility(identifier: "resultLabel")
                .padding()
        }.padding(.horizontal, 48)
    }
    
    private func resultButtonOnTap() {
        guard let leftNumber = Float(leftTextFieldValue), let rightNumber = Float(rightTextFieldValue) else {
            return
        }
        setResultLabel(leftNumber: leftNumber, rightNumber: rightNumber)
    }
    
    private func setResultLabel(leftNumber: Float, rightNumber: Float) {
        resultValue = String(format: "%.1f", leftNumber * rightNumber)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
