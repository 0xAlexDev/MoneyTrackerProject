//
//  Home.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 26/02/22.
//

import SwiftUI

struct Home: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings: ControllerSettings
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    var body: some View {
        
        NavigationView{
            VStack{
                
            GeometryReader{
                geometry in
                VStack{
                    
                    ShowUserComponent(user: user,settings: settings, managerPurchases: managerPurchases).padding()
                    
                    
                    
                    
                    ShowCirclePurchase(user: user,settings: settings, managerPurchases: managerPurchases).padding()
                    
                    
                    
                    
                    
                    
                    NavigationLink(destination: {
                        AddNewPurchase(user: user, settings: settings, managerPurchases: managerPurchases)
                    }, label: {
                        
                        HStack{
                            Image(systemName: "plus.circle")
                                .foregroundColor(settings.getColorUsed().secondaryColor)
                                .font(.system(size: 30))
                                
                            
                            Text("New Purchase")
                                .font(.title)
                                .bold()
                                .foregroundColor(settings.getColorUsed().secondaryColor)
                            
                            Spacer()
                        }
                        
                        
                        
                    }).padding()
                    
                    
                    Spacer()
                    
                    
                    
                        
                    
                }.background(settings.getColorUsed().primaryColor)
                
            }
            .navigationBarHidden(true)
            
        }
            Spacer()
        }
    }
}




