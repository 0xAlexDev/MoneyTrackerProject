//
//  Purchase.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation
import SwiftUI

struct Purchase: Codable, Identifiable, Comparable{
    let id: UUID
    var title: String
    var description:String?
    var amount:Double
    var date:Date
    var tag:String
    
    init(title:String,description:String?,amount:Double,tag:String){
        self.id = UUID()
        self.title = title
        self.description = description ?? ""
        self.amount = amount
        self.date = Date()
        self.tag = tag
    }
    
    init(title:String,description:String?,amount:Double,tag:String, date1:Date){
        self.id = UUID()
        self.title = title
        self.description = description ?? ""
        self.amount = amount
        self.date = date1
        self.tag = tag
    }
    
    
    
    static func <(lhs: Purchase, rhs: Purchase) -> Bool {
            return lhs.title < rhs.title
        }
    
}
