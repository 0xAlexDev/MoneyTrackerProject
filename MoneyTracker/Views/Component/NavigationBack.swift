//
//  NavigationBack.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 28/03/22.
//

import SwiftUI

struct NavigationBack: View {
    @ObservedObject var settings: ControllerSettings
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "arrowshape.turn.up.left.fill")
                    .font(.system(size: 30))
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                    
                    
            })
            
        }
        
    }
}

