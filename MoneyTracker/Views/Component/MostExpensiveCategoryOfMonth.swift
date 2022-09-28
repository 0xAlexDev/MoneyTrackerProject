//
//  MostExpensiveCategoryOfMonth.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 20/04/22.
//

import SwiftUI
struct MostExpensiveCategoryOfMonth: View {
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    
    var body: some View {
        VStack{
            
            
            if(!managerPurchases.GetAllPurchases().isEmpty || managerPurchases.GetAllPurchases().count == 0){
                
                HStack{
                    Text("Most Expensive Category Of Month")
                        .bold()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Spacer()
                }
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        
                        ForEach(managerPurchases.getMostExpensiveCategoryOfMonth()){
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
