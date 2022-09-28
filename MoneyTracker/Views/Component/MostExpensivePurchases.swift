//
//  MostExpensivePurchases.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 28/03/22.
//

import SwiftUI

struct MostExpensivePurchases: View {
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    

   
    
    var body: some View {
        VStack{
            
           
            var Vector : [Purchase] = managerPurchases.getMostExpensivePurchasesOfAll()
            HStack{
                Text("Most Expensive Purchase")
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }.padding(.bottom)
            if(!Vector.isEmpty || Vector.count != 0){
                
                
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        
                            ForEach(managerPurchases.getMostExpensivePurchasesOfAll()){
                                purchase in
                                
                                ShowStatPurchase(purchase: purchase,managerPurchases: managerPurchases, settings:settings)
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                }
            }
            
            else{
                HStack{
                    Spacer()
                    Text("Empty")
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Spacer()

                }
                
            }
            
        }.padding()
            .navigationBarHidden(true)
        
    }
    
}

struct MostExpensivePurchasesOfMonth1: View {
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    let month: Int? = Calendar.current.dateComponents([.month], from: Date()).month
    let year: Int? = Calendar.current.dateComponents([.year], from: Date()).year

   
    
    var body: some View {
        VStack{
            
           
            var Vector : [Purchase] = managerPurchases.getMostExpensivePurchasesOfMonth(month: month!)
            HStack{
                Text("Most Expensive Purchase Of Month")
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }
            if(!Vector.isEmpty || Vector.count != 0){
                
                
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        
                        ForEach(managerPurchases.GetPurchasesByYearAndMonth(year: year!, month: month!)){
                                purchase in
                                
                                ShowStatPurchase(purchase: purchase,managerPurchases: managerPurchases, settings:settings)
                            
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




