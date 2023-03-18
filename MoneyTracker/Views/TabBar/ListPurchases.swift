//
//  ListPurchases.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 01/03/22.
//

import SwiftUI

struct ListPurchases: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings : ControllerSettings
    @ObservedObject var managerPurchases : ControllerManagerPurchases
    let currentYear : Int = Calendar.current.dateComponents([.year], from: Date()).year!+50
    
    
    
    let months : [String] = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ]
    
    
    
    
    var body: some View {
        
        VStack{
            HStack{
                Spacer()
                Image(systemName: "list.bullet.circle")
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                    .font(.system(size: 35))
                
                Text("All Purchases")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }
            
            
            
            List{
                if(!managerPurchases.GetAllPurchases().isEmpty){
                    
                    ForEach((2022...currentYear).reversed(),id: \.self){
                        year in
                        
                        ShowYearAnimation(user: user, managerPurchases: managerPurchases, settings: settings, year: year)
                        
                        
                    }
                    .listRowBackground(settings.getColorUsed().primaryColor)
                    .listRowSeparator(.hidden)
                    
                    
                }
                
                
                else{
                    HStack{
                        Spacer()
                        Text("Empty")
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        Spacer()
                    }
                }
                 
                    
                    
                
                
                
            }
            
            Spacer()
        }.background(settings.getColorUsed().primaryColor)
        
        
        
        
    }
}
