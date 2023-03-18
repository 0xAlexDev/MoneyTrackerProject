//
//  MostExpensiveCategory.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 29/03/22.
//

import SwiftUI

struct MostExpensiveCategory: View {
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    
    var body: some View {
        VStack{
            HStack{
                Text("Most Expensive Category")
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }
            
            
            if(!managerPurchases.GetAllPurchases().isEmpty){
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        
                        ForEach(managerPurchases.getMostExpensiveCategory()){
                            category in
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .frame(width: abs(350), height:abs(110))
                                
                                
                                VStack{
                                    HStack{
                                        Text(category.name)
                                            .bold()
                                            .foregroundColor(settings.getColorUsed().secondaryColor)
                                        Spacer()
                                        Text("$"+String(category.amount))
                                            .bold()
                                            .foregroundColor(settings.getColorUsed().secondaryColor)
                                    }.padding(.bottom)
                                    
                                    
                                }.frame(width: 300, height: 100)
                                
                                
                            }
                        }
                    }
                }
            }
            
            
            else{
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(settings.getColorUsed().secondaryColor.opacity(0.20))
                        .frame(width: abs(350), height:abs(110))
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text("Empty")
                                .foregroundColor(Color.black)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                
            }
            
        }.padding()
            .navigationBarHidden(true)
        
    }
    
}

struct MostExpensiveCategoryCircle: View {
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    
    var body: some View {
        VStack{
            
            HStack{
                Text("Most Expensive Category")
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }.padding(.bottom)

            
            if(!managerPurchases.GetAllPurchases().isEmpty || managerPurchases.GetAllPurchases().count != 0){
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        
                        ForEach(managerPurchases.getMostExpensiveCategoryCircle()){
                            category in
                            
                            ZStack{
                                Circle()
                                    .fill(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .frame(width: abs(120), height:abs(120))
                                
                                
                                VStack{
                                    Spacer()
                                    Text(category.name)
                                        .bold()
                                        .foregroundColor(settings.getColorUsed().secondaryColor)
                                        .padding(.bottom)
                                        .offset(x: 0, y: -5)
                                    Text("$"+String((round(category.amount*100)/100)))
                                        .bold()
                                        .foregroundColor(settings.getColorUsed().secondaryColor)
                                        .offset(x: 0, y: -10)
                                    
                                    
                                }.padding(.bottom)
                                
                                
                                
                                
                                
                            }
                        }
                    }
                }
            }
            
            
            else{
                Spacer()
                Text("Empty")
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
                
            }
            
        }.padding()
            .navigationBarHidden(true)
        
    }
    
}

struct MostExpensiveCategoryCircleOfMonth: View {
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    
    var body: some View {
        
        VStack{
        var purchases : [tupla] = managerPurchases.getMostExpensiveCategoryCircleOfMonth()
        
            HStack{
                Text("Most Expensive Category Of Month")
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }.padding(.bottom)
            
            
            if(!managerPurchases.GetAllPurchases().isEmpty || managerPurchases.GetAllPurchases().count != 0){
                
                
                
                if(!purchases.isEmpty || purchases.count != 0){
                    VStack{
                        
                        ScrollView(.horizontal,showsIndicators: false){
                            
                            HStack{
                                
                                ForEach(purchases){
                                    category in
                                    
                                    ZStack{
                                        Circle()
                                            .fill(settings.getColorUsed().secondaryColor.opacity(0.20))
                                            .frame(width: abs(120), height:abs(120))
                                        
                                        
                                        VStack{
                                            Spacer()
                                            Text(category.name)
                                                .bold()
                                                .foregroundColor(settings.getColorUsed().secondaryColor)
                                                .padding(.bottom)
                                                .offset(x: 0, y: -5)
                                            
                                            Text("$"+String((round(category.amount*100)/100)))
                                            
                                                .bold()
                                                .foregroundColor(settings.getColorUsed().secondaryColor)
                                                .offset(x: 0, y: -10)
                                            
                                            
                                        }.padding(.bottom)
                                        
                                        
                                        
                                        
                                        
                                    }
                                }
                            }
                        }
                    }
                        .navigationBarHidden(true)
                }
                
                
                
                
                
                
            }
            else{
                Spacer()
                Text("Empty")
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
                
            }
        
        }.padding()
        
    }
    
}

