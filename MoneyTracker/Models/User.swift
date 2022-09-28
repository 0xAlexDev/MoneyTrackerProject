//
//  User.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation

struct User : Codable, Identifiable{
    let id: UUID
    var name : String
    var surname : String
    var dataCreation : Date
    
    init(name:String,surname:String,dataCreation:Date){
        self.id = UUID()
        self.name = name
        self.surname = surname
        self.dataCreation = Date()
    }
}
