//
//  ShowDescriptionPurchase.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 07/03/22.
//

import SwiftUI

struct ShowDescriptionPurchase: View {
    let purchase : Purchase
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    @State var alert : Bool = false
    var body: some View {
            VStack{
                ScrollView{
                    HStack{
                        Text(purchase.title)
                            .bold()
                            .font(.largeTitle)
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        
                        Spacer()
                    }.padding()
                    
                    HStack{
                        Text("Amount of pruchase")
                            .bold()
                            .font(.system(size: 30))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        
                            Spacer()
                    }.padding(.bottom)
                        .padding(.horizontal)
                    HStack{
                        Text("$"+String(purchase.amount))
                            .font(.system(size: 30))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        
                            Spacer()
                    }.padding(.bottom)
                        .padding(.horizontal)
                    
                    HStack{
                        Text("Date")
                            .bold()
                            .font(.system(size: 30))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        Spacer()
                    }.padding(.bottom)
                        .padding(.horizontal)
                    
                    HStack{
                        Text(purchase.date, format: .dateTime.day() .month() .year() .hour() .minute())
                            .font(.system(size: 30))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        Spacer()
                    }.padding(.bottom)
                        .padding(.horizontal)
                    
                    HStack{
                        Text("Tag")
                            .bold()
                            .font(.system(size: 30))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        Spacer()
                    }.padding(.bottom)
                        .padding(.horizontal)
                    
                    HStack{
                        Text(purchase.tag)
                            .font(.system(size: 30))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        Spacer()
                    }.padding(.bottom)
                        .padding(.horizontal)
                    
                    
                    if(purchase.description != ""){
                        HStack{
                            Text("Description ")
                                .font(.system(size: 30))
                                .bold()
                                .foregroundColor(settings.getColorUsed().secondaryColor)
                            Spacer()
                        }.padding(.bottom).padding(.horizontal)
                        
                        HStack{
                            Text(purchase.description!)
                                .font(.system(size: 30))
                                .foregroundColor(settings.getColorUsed().secondaryColor)
                            
                            Spacer()
                        }.padding(.horizontal)
                        
                        
                       
                            
                    
                        
                    }
                    
                    
                    
                
                Spacer()
                }
                
                    
                
            }.background(settings.getColorUsed().primaryColor)
    }
}


