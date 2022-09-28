//
//  ShowPurchase.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 26/02/22.
//

import SwiftUI

struct ShowPurchase: View {
    let purchase : Purchase
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    @State var alert : Bool = false
    @State var navigationLink : Bool = false
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(settings.getColorUsed().secondaryColor.opacity(0.20))
                .frame(width: abs(330), height:abs(110))
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
            }.frame(width: 280, height: 100)
 
            
        }
        .swipeActions {
            Button("Delete") {
                alert.toggle()
                print(alert)
            }
            .tint(.red)
            
        }.alert(isPresented: self.$alert){
            Alert(title: Text("Delete Purchase"), message: Text("Are you sure for delite this purchase?"), primaryButton: Alert.Button.default(Text("Confirm")){ managerPurchases.deletePurchase(purchase: purchase) }, secondaryButton: .cancel(Text("Cancel")))
            }
        .onTapGesture(perform: {
            navigationLink.toggle()
            print(navigationLink)
        })
        
        .sheet(isPresented: $navigationLink, onDismiss: {print("dismiss")}, content:{ ShowDescriptionPurchase(purchase: purchase, managerPurchases: managerPurchases,settings:settings)})
    }
}

struct ShowPurchaseForAllView: View {
    let purchase : Purchase
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    @State var alert : Bool = false
    @State var navigationLink : Bool = false
    var body: some View {
        VStack{
            Divider().background(settings.getColorUsed().secondaryColor)
        }
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(settings.getColorUsed().secondaryColor.opacity(0))
                .frame(width: abs(330), height:abs(110))
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
            }.frame(width: 280, height: 100)
 
            
        }
        .swipeActions {
            Button("Delete") {
                alert.toggle()
                print(alert)
            }
            .tint(.red)
            
        }.alert(isPresented: self.$alert){
            Alert(title: Text("Delete Purchase"), message: Text("Are you sure for delite this purchase?"), primaryButton: Alert.Button.default(Text("Confirm")){ managerPurchases.deletePurchase(purchase: purchase) }, secondaryButton: .cancel(Text("Cancel")))
            }
        .onTapGesture(perform: {
            navigationLink.toggle()
            print(navigationLink)
        })
        
        .sheet(isPresented: $navigationLink, onDismiss: {print("dismiss")}, content:{ ShowDescriptionPurchase(purchase: purchase, managerPurchases: managerPurchases,settings:settings)})
    }
}




