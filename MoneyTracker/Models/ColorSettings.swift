//
//  ColorSettings.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation

struct ColorSettings: Codable{
    var color : Int
    
    init(color:Int){
        self.color = color
    }
}
