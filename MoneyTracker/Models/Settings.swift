//
//  Settings.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation

struct Settings : Codable{
    var colorSettings : ColorSettings
    var firstLogin : Bool
    init(setColor:Int){
        colorSettings = ColorSettings(color: setColor)
        firstLogin = true
    }
}
