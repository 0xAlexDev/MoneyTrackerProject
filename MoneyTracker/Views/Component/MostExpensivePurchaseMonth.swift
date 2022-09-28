//
//  MostExpensivePurchaseMonth.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 29/03/22.
//

import SwiftUI

struct MostExpensivePurchaseMonth: View {
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    let month: Int? = Calendar.current.dateComponents([.month], from: Date()).month
    @ObservedObject var settings: ControllerSettings
    var body: some View {
        VStack{
            HStack{
                Text("Most Expensive Purchase Of Month")
                    .bold()
                //.foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }
            
            if(!managerPurchases.GetAllPurchases().isEmpty){
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        
                        ForEach(managerPurchases.getMostExpensivePurchasesOfMonth(month: month!)){
                            purchase in
                            
                            ShowStatPurchase(purchase: purchase,managerPurchases: managerPurchases,settings: settings)
                        }
                    }
                }
            }
            else{
                ZStack{
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color.red)
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
