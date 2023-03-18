//
//  Statistics.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 07/03/22.
//

import SwiftUI

struct Statistics: View {
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @ObservedObject var settings: ControllerSettings
    
    var body: some View {
        VStack{
            HStack{
                Text("Your Statistics")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                
                Spacer()
            }.padding()
            ScrollView{
                if(!managerPurchases.getMostExpensivePurchasesOfAll().isEmpty || managerPurchases.getMostExpensivePurchasesOfAll().count != 0){
                    MostExpensivePurchases(managerPurchases: managerPurchases, settings: settings)
                }
                    
                if(!managerPurchases.GetAllPurchases().isEmpty || managerPurchases.GetAllPurchases().count != 0){
                    MostExpensiveCategoryCircle(managerPurchases: managerPurchases, settings: settings)
                }
                
                if(!managerPurchases.getMostExpensiveCategoryOfMonth().isEmpty || managerPurchases.getMostExpensiveCategoryOfMonth().count != 0){
                    MostExpensivePurchasesOfMonth1(managerPurchases: managerPurchases, settings: settings)
                }
                
                if(!managerPurchases.getMostExpensiveCategoryCircleOfMonth().isEmpty || managerPurchases.getMostExpensiveCategoryCircleOfMonth().count != 0){
                    MostExpensiveCategoryCircleOfMonth(managerPurchases: managerPurchases, settings: settings)
                }
                
                
                
                
                
                
                
            
            }
            Spacer()
            
        }.background(settings.getColorUsed().primaryColor)
    }
}
