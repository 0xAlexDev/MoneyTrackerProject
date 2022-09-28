//
//  ShowStatPurchase.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 28/03/22.
//

import SwiftUI

struct ShowStatPurchase: View {
    var purchase : Purchase
    @State var navigationLink : Bool = false
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(settings.getColorUsed().secondaryColor.opacity(0.20))
                
                .frame(width: abs(350), height:abs(110))
                .onTapGesture {
                    navigationLink = true
                }
                
            VStack{
                HStack{
                    Text(purchase.title)
                        .bold()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Spacer()
                    Text("$"+String((round(purchase.amount*100)/100)))
                        .bold()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                }.padding(.bottom)
                
                HStack{
                    Text("Date: ")
                        .bold()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Text(purchase.date, format: .dateTime.day() .month() .year() .hour() .minute())
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Spacer()
                }
                
                HStack{
                    Text("Tag: ")
                        .bold()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Text(purchase.tag)
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Spacer()
                }
            }.frame(width: 300, height: 100)
 
            
        }.sheet(isPresented: $navigationLink, onDismiss: {print("dismiss")}, content:{ ShowDescriptionPurchase(purchase: purchase, managerPurchases: managerPurchases,settings:settings)})
    }
}

