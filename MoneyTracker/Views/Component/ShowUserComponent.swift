//
//  ShowUserComponent.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 26/02/22.
//

import SwiftUI

struct ShowUserComponent: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings: ControllerSettings
    @ObservedObject var managerPurchases : ControllerManagerPurchases
    var body: some View {
        
        
        
        NavigationLink(destination: EditUser(user: user, settings: settings, managerPurchases: managerPurchases), label: {
            VStack{
                
                HStack{
                    ZStack{
                        
                        
                        Image(systemName: "person.circle")
                            .font(.system(size: 25))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                            
        
                        
                        
                    }
                    Text(user.GetName()+" "+user.GetSurname())
                        .bold()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    
                    Spacer()
                }
            }
        })
            
            
    }
}


