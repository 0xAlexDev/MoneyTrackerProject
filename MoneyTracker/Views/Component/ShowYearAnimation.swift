//
//  ShowYearAnimation.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 29/03/22.
//

import SwiftUI

struct ShowYearAnimation: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var managerPurchases : ControllerManagerPurchases
    @ObservedObject var settings : ControllerSettings
    var year : Int
    @State var showMonthAnim : Bool = false
    var body: some View {
        
            
            let listyear = managerPurchases.GetPurchasesByYear(year: year)
            
            if(!listyear.isEmpty){
                
                HStack{
                    Spacer()
                    Text(String(year))
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Spacer()
                }.onTapGesture {
                    showMonthAnim.toggle()
                }
                
                if(showMonthAnim == true){
                    ForEach((1...12), id: \.self){
                        n in
                        let list = managerPurchases.GetPurchasesByMonthSortedByName(month: n, purchasesListN: listyear)
                        if(!list.isEmpty){
                            
                           
                            ShowMonthAnimation(managerPurchases: managerPurchases, settings: settings, month: managerPurchases.convertMonth(value: n), listPurchase: list, total: managerPurchases.TotalAmountMonth(list: list))
                            
                            
                    
                                
                            
                        }
                        
                        
                    
                        
                    }
                            
 
                    
            }
                

            //ShowYearAnimation(managerPurchases: managerPurchases, year: year)
        }
        
            
           
    
}
}
