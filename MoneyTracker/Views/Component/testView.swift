//
//  testView.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 20/02/22.
//

import SwiftUI

struct testView: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings: ControllerSettings
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    var body: some View {
        VStack{
            HStack{
                Text("ciao")
                
                    Button(action: {
                        user.PrintUser()
                        managerPurchases.PrintManagerPurchases()
                        print("----------------")
                        print(managerPurchases.GetAllPurchases())
                        managerPurchases.addPurchase(purchase: Purchase(title: "NewPurchase", description: nil, amount: 10, tag: "other"))
                        managerPurchases.GetColorTarget()
                    }, label: {
                        Text("button")
                    })
                
                Spacer()
            }
            Spacer()
                
    //}
        
        
        .navigationTitle("hello")
                    
                    
                    
               
            
            
            
            
            
                
        }
    }
}

