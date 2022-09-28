//
//  ControllerSettings.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation
import SwiftUI

class ControllerSettings : ObservableObject{
    @Published private var settings : Settings?
    init(){
        settings = Database.FatchSettings()
        if (settings == nil){
            settings = Settings(setColor: 0)
            
        }
        print("User created");
    }
    
    public func SaveSettings(){
        Database.StoreSettings(settings: settings)
    }
    
    //methods
    
    public func getColorUsedNum() -> Int{
        return settings!.colorSettings.color
    }
    public func getColorUsed() -> (primaryColor : Color, secondaryColor : Color){
        var colorUsed : (primaryColor : Color, secondaryColor : Color) = (Color.white,Color.black)
        if(self.settings?.colorSettings.color == 1){
            colorUsed.primaryColor = Color.white
            colorUsed.secondaryColor = Color.black
        }
        
       
        
        if(self.settings?.colorSettings.color == 2){
            colorUsed.primaryColor = Color.cyan
            colorUsed.secondaryColor = Color.white
        }
        
        if(self.settings?.colorSettings.color == 3){
            colorUsed.primaryColor = Color.purple
            colorUsed.secondaryColor = Color.white
        }
        
        if(self.settings?.colorSettings.color == 4){
            colorUsed.primaryColor = Color.white
            colorUsed.secondaryColor = Color.pink
        }
        
        if(self.settings?.colorSettings.color == 5){
            colorUsed.primaryColor = Color.white
            colorUsed.secondaryColor = Color.purple
        }
        
        
        
        if(self.settings?.colorSettings.color == 6){
            colorUsed.primaryColor = Color.white
            colorUsed.secondaryColor = Color.cyan
        }
        return colorUsed
    }
    
    public func setColorUse(value:Int){
        settings?.colorSettings.color = value
    }
    
    public func printSettings(){
        print(settings!)
    }
    
    public func checkFirstLogin() -> Bool{
        return settings!.firstLogin 
    }
    
    public func changeLoginStatus(status : Bool){
        settings!.firstLogin = status
    }
    
    
    
    
}
