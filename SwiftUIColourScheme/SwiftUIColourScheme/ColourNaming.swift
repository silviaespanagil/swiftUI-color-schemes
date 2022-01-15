//
//  ColourNaming.swift
//  SwiftUIColourScheme
//
//  Created by Silvia España on 15/1/22.
//

import SwiftUI

struct ColourNaming: View {
    
    @State private var showAlert = false
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    @Environment(\.colorScheme) var currentMode
    
    var body: some View {
        
        ScrollView {
            
            //Using ColorScheme with name
            Text("Color scheme")
                .font(.title)
                .foregroundColor(currentMode == .dark ? Color("Yellow") : Color("Wine"))
            LazyVGrid(columns: columns, spacing: 10) {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Wine"))
                    .frame(width: 80, height: 80)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("BrightRed"))
                    .frame(width: 80, height: 80)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Red"))
                    .frame(width: 80, height: 80)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Orange"))
                    .frame(width: 80, height: 80)
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("Yellow"))
                    .frame(width: 80, height: 80)
            }.padding()
            
            // Using extension
            
            Text("Beware")
                .font(.title)
                .foregroundColor(currentMode == .dark ? Color.primaryTitleDM : Color.primaryTitle)
            
            Button(action: {
                showAlert = true
            }){
                Text("Don't click here")
                    .foregroundColor(Color.buttonLabel)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.button)
                    .shadow(color: .brightRed, radius: 2, x: 0, y: 2)
            )
            .buttonStyle(PlainButtonStyle())
        }.alert(isPresented: $showAlert) { () -> Alert in
            Alert(title: Text("Told you not to click"),
                  primaryButton: .default(Text("Boom")),
                  secondaryButton: .default(Text("Boom")))
        }
    }
}

struct ColourNaming_Previews: PreviewProvider {
    static var previews: some View {
        ColourNaming()
    }
}
