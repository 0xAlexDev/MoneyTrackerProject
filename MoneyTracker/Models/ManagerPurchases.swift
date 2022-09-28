//
//  ManagerPurchases.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation

struct ManagerPurchases: Codable{
    var purchasesList: [String: [Purchase]]
    var targetAmount : Double
    
    init(purchasesList:[String : [Purchase]], target:Double){
        self.purchasesList = purchasesList
        self.targetAmount = target
    }
}
