//
//  Database.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation

class Database{
    
    // store/fatch User
    
    static func StoreUser(user : User?){
        let encoder = JSONEncoder()
        let encoded : Data? = try? encoder.encode(user!)
        if (encoded != nil){
            UserDefaults.standard.set(encoded, forKey: "user")
        }
        else{
            print("Error during JSON encoded - User");
        }
    }
    
    
    static func FatchUser() -> User?{
        let JSONstring: Data? = UserDefaults.standard.object(forKey: "user") as? Data
        if (JSONstring != nil) {
            let decoder = JSONDecoder()
            let user : User? = try? decoder.decode(User.self, from: JSONstring!)
            return user;
        }
        return nil;
    }
    
    // store/fatch ManagerPurchases
    
    static func StoreManagerPurchases(managerPurchases : ManagerPurchases?){
        let encoder = JSONEncoder()
        let encoded : Data? = try? encoder.encode(managerPurchases!)
        if (encoded != nil){
            UserDefaults.standard.set(encoded, forKey: "managerPurchases")
        }
        else{
            print("Error during JSON encoded - ManagerPurchases");
        }
    }
    
    
    static func FatchManagerPurchases() -> ManagerPurchases?{
        let JSONstring: Data? = UserDefaults.standard.object(forKey: "managerPurchases") as? Data
        if (JSONstring != nil) {
            let decoder = JSONDecoder()
            let managerPurchases : ManagerPurchases? = try? decoder.decode(ManagerPurchases.self, from: JSONstring!)
            return managerPurchases;
        }
        return nil;
    }
    
    // store/fatch Settings
    
    static func StoreSettings(settings : Settings?){
        let encoder = JSONEncoder()
        let encoded : Data? = try? encoder.encode(settings!)
        if (encoded != nil){
            UserDefaults.standard.set(encoded, forKey: "settings")
        }
        else{
            print("Error during JSON encoded - settings");
        }
    }
    
    
    static func FatchSettings() -> Settings?{
        let JSONstring: Data? = UserDefaults.standard.object(forKey: "settings") as? Data
        if (JSONstring != nil) {
            let decoder = JSONDecoder()
            let settings : Settings? = try? decoder.decode(Settings.self, from: JSONstring!)
            return settings;
        }
        return nil;
    }
    
    
    
    
    
    
}
