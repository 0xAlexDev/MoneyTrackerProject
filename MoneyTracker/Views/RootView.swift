//
//  ContentView.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 13/01/22.
//

import SwiftUI


struct RootView: View {
    
    @StateObject var user : ControllerUser
    @StateObject var settings: ControllerSettings
    @StateObject var managerPurchases: ControllerManagerPurchases
    
    init(user:StateObject<ControllerUser>,settings:StateObject<ControllerSettings>,managerPurchase:StateObject<ControllerManagerPurchases>) {
        
        _user = user
        _settings = settings
        _managerPurchases = managerPurchase
      
        
        //UITabBar.appearance().unselectedItemTintColor = UIColor(settings.wrappedValue.getColorUsed().secondaryColor.opacity(0.40))
        
        
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().barTintColor = UIColor(settings.wrappedValue.getColorUsed().primaryColor)
        
    }
    var body: some View {
        VStack{
            
            
            if(settings.checkFirstLogin()){
                SignUp(user: user, settings: settings, managerPurchases: managerPurchases)
            }
             
            
            else{
                
                TabView{
                    
                    Home(user: user, settings: settings, managerPurchases: managerPurchases)
                        .tabItem({
                            Image(systemName: "house.fill")
                                
                        })
                    
                    ListPurchases(user: user, settings: settings, managerPurchases: managerPurchases)
                        .tabItem({
                            //All purchases
                            Image(systemName: "doc.plaintext.fill")
                                
                        })
                    
                    Statistics(managerPurchases: managerPurchases,settings: settings)
                        .tabItem({
                            //All purchases
                            Image(systemName: "heart.fill")
                                
                        })
                    
                    
                }
                .accentColor(settings.getColorUsed().secondaryColor)
            
                
                
                
            }
            
            
        }
        
    }
}


