//
//  ShowMonthPurchases.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 26/02/22.
//

import SwiftUI

struct ShowMonthPurchases: View {
  
    init(user:ObservedObject<ControllerUser>,settings:ObservedObject<ControllerSettings>,managerPurchase:ObservedObject<ControllerManagerPurchases>) {
        
        _user = user
        _settings = settings
        _managerPurchases = managerPurchase
        
        //UITableViewCell.appearance().backgroundColor = UIColor(settings.wrappedValue.getColorUsed().primaryColor)
        UITableView.appearance().backgroundColor = UIColor(settings.wrappedValue.getColorUsed().primaryColor)
        
    }
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings: ControllerSettings
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    let month: Int? = Calendar.current.dateComponents([.month], from: Date()).month
    var body: some View {
        VStack{
            
            HStack{
            
                NavigationBack(settings:settings)
                   
                
                Text("Purchases of month")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }
            
            GeometryReader{
                g in
            List{
                let year: Int? = Calendar.current.dateComponents([.year], from: Date()).year
                let lists : [Purchase] = managerPurchases.GetPurchasesByYear(year: year!)
                if(!lists.isEmpty){
                    ForEach(managerPurchases.GetPurchasesByMonth(month: month!,listN: lists).reversed()){
                        purchase in
                        
                        ShowPurchase(purchase: purchase,managerPurchases: managerPurchases,settings: settings).frame (width: g.size.width * 0.8)
                            
                            
                            
                        
                        
                    }.listRowBackground(settings.getColorUsed().primaryColor.opacity(0.20)).listRowSeparator(.hidden)
                }
                else{
                    
                        HStack{
                            Spacer()
                            Text("Empty")
                                .foregroundColor(settings.getColorUsed().secondaryColor)
                            Spacer()

                        }
                        
                      
                }
                    
            }.listRowBackground(settings.getColorUsed().primaryColor.opacity(0.20))
    
        }
        }
        .background(settings.getColorUsed().primaryColor)
        .navigationBarHidden(true)
    }
    
    
}


