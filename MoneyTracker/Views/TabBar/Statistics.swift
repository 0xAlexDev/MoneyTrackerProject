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
                MostExpensivePurchases(managerPurchases: managerPurchases, settings: settings)
                MostExpensiveCategoryCircle(managerPurchases: managerPurchases, settings: settings)
                MostExpensivePurchasesOfMonth1(managerPurchases: managerPurchases, settings: settings)
                MostExpensiveCategoryCircleOfMonth(managerPurchases: managerPurchases, settings: settings)
            
                
                
                
                
                
                
                
            
            }
            Spacer()
            
        }.background(settings.getColorUsed().primaryColor)
    }
}
