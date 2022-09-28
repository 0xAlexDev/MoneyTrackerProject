//
//  ShowMonthAnimation.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 29/03/22.
//

import SwiftUI

struct ShowMonthAnimation: View {
    @ObservedObject var managerPurchases : ControllerManagerPurchases
    @ObservedObject var settings : ControllerSettings
    var month : String
    var listPurchase : [Purchase]
    let total : Double
    @State var showPurchase : Bool = false
    var body: some View {
        
            HStack{
                Spacer()
                Text(month)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }.onTapGesture {
                showPurchase.toggle()
            }
            
            if(showPurchase == true){
            
                Text("Total expenses: $" + String(total)).font(.system(size: 15))
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                    ForEach(listPurchase){
                        purchase in
                        
                        ShowPurchaseForAllView(purchase: purchase,managerPurchases: managerPurchases,settings: settings)
                        
                            
                    }
             
                
                
            }
            
        
            
            
        
        
    }
}




