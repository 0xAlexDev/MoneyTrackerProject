//
//  ShowCirclePurchase.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 26/02/22.
//

import SwiftUI

struct ShowCirclePurchase: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings: ControllerSettings
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @State var fill : CGFloat = 0.0
    var body: some View {
        
        
        VStack{
            VStack{
                
                NavigationLink(destination: ShowMonthPurchases(user: _user, settings: _settings, managerPurchase: _managerPurchases), label: {
                    
                    ZStack{
                        
                        VStack{
                            Text("$"+String((round(managerPurchases.GetCurrentMonthSpent()*100)/100)))
                                .bold()
                                .font(.system(size: 45))
                                .foregroundColor(managerPurchases.GetColorTarget())
                            
                            Text("-")
                                .bold()
                                .font(.system(size: 45))
                                .foregroundColor(settings.getColorUsed().secondaryColor)
                            
                            Text("$"+String(managerPurchases.GetTarget()))
                                .bold()
                                .font(.system(size: 45))
                                .foregroundColor(settings.getColorUsed().secondaryColor)
                        }
                        
                        
                        //Circle
                        
                        Circle()
                            .stroke(Color.gray.opacity(0.3), style: StrokeStyle(lineWidth:30))
                            .frame(width: abs(300), height: abs(300))
                            
                        
                        //Animation
                        
                        Circle()
                        
                            .trim(from: 0, to: fill)
                            .stroke(managerPurchases.GetColorTarget(), style: StrokeStyle(lineWidth:30))
                            .rotationEffect(.init(degrees: -90))
                            .frame(width: abs(300), height: abs(300))
                            
                        
                    }
                    
                })
                
            }.padding()
            HStack{
                Spacer()
                Text(Date(), style: .date)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
                
            }.padding()
            
            
        
            .navigationBarHidden(true)
        }.onAppear(perform: {
            fill=0
            startLoading()
        })
        .onDisappear(perform: {
            let currentValue = (managerPurchases.GetPercentToTarget()/100)
            fill = currentValue
        })
        
  
        
    }
    
    
    
    
    func startLoading() {
        let currentValue = (managerPurchases.GetPercentToTarget()/100)
        _ = Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { timer in
            withAnimation() {
                self.fill += 0.01
                
                if self.fill >= currentValue {
                    timer.invalidate()
                }
            }
        }
    }
    
}

