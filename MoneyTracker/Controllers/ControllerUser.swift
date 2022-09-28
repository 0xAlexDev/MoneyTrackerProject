//
//  ControllerUser.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation

class ControllerUser: ObservableObject{
    @Published private var user : User?
    init(){
        user = Database.FatchUser()
        if (user == nil){
            user = User(name: "", surname: "", dataCreation: Date())
            SaveUser()
        }
        print("User created");
    }
    
    public func SaveUser(){
        if (user != nil){
            Database.StoreUser(user: user)
        }
    }
    
    //methods
    
    public func PrintUser(){
        print(user!)
    }
    
    public func SetName(name:String){
        if(user != nil){
            user!.name = name
        }
    }
    
    public func SetSurname(surname:String){
        if(user != nil){
            user!.surname = surname
        }
    }
    
    public func GetName() -> String{
        if (user != nil){
            return user!.name
        }
        return ""
    }
    
    public func GetSurname() -> String{
        if (user != nil){
            return user!.surname
        }
        return ""
    }
    
    public func SetDataCreation(data:Date){
        if(user != nil){
            user?.dataCreation = data
        }
    }
    
    public func GetDataCreation() -> Date{
        if(user != nil){
            return user!.dataCreation
        }
        
        return Date()
    }
    
    
    
    
    
}
