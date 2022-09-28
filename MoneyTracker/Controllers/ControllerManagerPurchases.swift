//
//  ControllerManagerPurchases.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 11/02/22.
//

import Foundation
import SwiftUI

class ControllerManagerPurchases : ObservableObject{
    @Published private var managerPurchases:ManagerPurchases?
    let keys : [String] = [
        "Other",
        "Accessories",
        "Take Away",
        "Electronics",
        "Sports",
        "Clothes",
        "App",
        "Restaurants",
        "Finance",
        "Books",
        "Utilies",
        "Vehicles",
        "Travels",
        "Legal Services",
        "Beauty",
        "House",
        "Groceries",
        "Shopping"
    ]
    let month: Int? = Calendar.current.dateComponents([.month], from: Date()).month
    
    init(){
        self.managerPurchases = Database.FatchManagerPurchases()
        if (managerPurchases == nil){
            let purchasesList : [String: [Purchase]] = [
                "January" : [Purchase](),
                "February" : [Purchase](),
                "March" : [Purchase](),
                "April" : [Purchase](),
                "May" : [Purchase](),
                "June" : [Purchase](),
                "July" : [Purchase](),
                "August" : [Purchase](),
                "September" : [Purchase](),
                "October" : [Purchase](),
                "November" : [Purchase](),
                "December" : [Purchase]()
            ]
            self.managerPurchases = ManagerPurchases(purchasesList: purchasesList, target: 9999)
        }
    
        
        
        
        
        print("ControllerManagerPurchases created");
       
        SaveManagerPurchases()
    }
    
    public func SaveManagerPurchases(){
        if(managerPurchases != nil){
            Database.StoreManagerPurchases(managerPurchases: managerPurchases)
        }
    }
    
    //methods
    
    public func PrintManagerPurchases(){
        if(managerPurchases != nil){
            print(managerPurchases!)
        }
    }
    
    public func GetTarget() -> Double{
        if(managerPurchases != nil){
            return managerPurchases!.targetAmount
        }
        return 0.0
    }
    
    public func SetTarget(target:Double){
        if(managerPurchases != nil){
            managerPurchases?.targetAmount = target
        }
    }
    
    public func GetColorTarget() -> Color{
        var currentAmount : Double = 0
        var nearestValue : Double = 0
        let month: Int? = Calendar.current.dateComponents([.month], from: Date()).month
        let year: Int? = Calendar.current.dateComponents([.year], from: Date()).year
        let lists : [Purchase] = GetPurchasesByYear(year: year!)
        for purchase in GetPurchasesByMonth(month: month!,listN: lists){
            currentAmount += purchase.amount
        }
        nearestValue = ((currentAmount / managerPurchases!.targetAmount) * 100)
        if(nearestValue <= 50){
            return Color.green
        }
        else if(nearestValue > 50 && nearestValue <= 75){
            return Color.orange
        }
        
        else{
            return Color.red
        }
    }
    
    public func GetPercentToTarget() -> CGFloat{
        var currentAmount : Double = 0
        var nearestValue : Double = 0
        let month: Int? = Calendar.current.dateComponents([.month], from: Date()).month
        let year: Int? = Calendar.current.dateComponents([.year], from: Date()).year
        let lists : [Purchase] = GetPurchasesByYear(year: year!)
        for purchase in GetPurchasesByMonth(month: month!,listN: lists){
            currentAmount += purchase.amount
        }
        nearestValue = ((currentAmount / managerPurchases!.targetAmount) * 100)
        return nearestValue
        
    }
    
    public func GetCurrentMonthSpent() -> Double{
        var currentAmount : Double = 0
        let month: Int? = Calendar.current.dateComponents([.month], from: Date()).month
        let year: Int? = Calendar.current.dateComponents([.year], from: Date()).year
        let lists : [Purchase] = GetPurchasesByYear(year: year!)
        for purchase in GetPurchasesByMonth(month: month!,listN: lists){
            currentAmount += purchase.amount
        }
        
        return currentAmount
    }
    
    public func GetAllPurchases()->[Purchase]{
        var list : [Purchase] = [Purchase]()
        let keys : [String] = [
            "January",
            "February",
            "March",
            "April",
            "May",
            "June",
            "July",
            "August",
            "September",
            "October",
            "November",
            "December"
        ]
        if(managerPurchases != nil){
            for key in keys{
                for purchase in managerPurchases!.purchasesList[key]!{
                    
                    list.append(purchase)
                }
            }
        }
        
        
        
        return list
    }
    public func TotalAmountMonth(list:[Purchase]) -> Double {
        var sum : Double  = 0
        if(!list.isEmpty){
            for purchase in list{
                sum = sum + purchase.amount
            }
            return sum
        }
        
        
        return 0.0
        
    }
    public func GetPurchasesByMonth(month:Int,listN:[Purchase])->[Purchase]{
        var list : [Purchase] = [Purchase]()
        if(managerPurchases != nil){
            
            for purchase in listN{
                let purchaseMonth = Calendar.current.dateComponents([.month], from: purchase.date)
                if(purchaseMonth.month == month){
                    list.append(purchase)
                }
                
            }
            
        }
        var date: Date = Date()
        
        var finalList : [Purchase] = [Purchase]()
        let currentYear = Calendar.current.dateComponents([.year], from: date)
        
        
        if(managerPurchases != nil){
            
            for purchase in list{
                var date2 : Date = purchase.date
                let purchaseYear = Calendar.current.dateComponents([.year], from: date2)
                if(purchaseYear == currentYear){
                    finalList.append(purchase)
                }
            }
            
        }
        
        return finalList
    }
    
    
    public func getMostExpensivePurchasesOfMonth(month:Int) -> [Purchase]{
        
        let year: Int? = Calendar.current.dateComponents([.year], from: Date()).year
        let lists : [Purchase] = GetPurchasesByYearAndMonth(year: year!, month: month)
        
        let duplicateArray = lists.sorted(by: { $0.amount > $1.amount })
        var array : [Purchase] = [Purchase]()
        let countElements : Int = duplicateArray.count
        
        if(duplicateArray.count >= 3){
            for i in 0..<3{
                array.insert(duplicateArray[i], at: i)
            }
        }
        
        else{
            for i in 0..<countElements{
                array.insert(duplicateArray[i], at: i)
            }
        }
        
        print(array)
        return array
      
    }
    
    public func getMostExpensivePurchasesOfAll()->[Purchase]{
        
        
        var duplicateArray = GetAllPurchases().sorted(by: { $0.amount > $1.amount })
        
        
        var array : [Purchase] = [Purchase]()
        let countElements : Int = duplicateArray.count
        
        if(duplicateArray.count >= 3){
            for i in 0..<3{
                array.insert(duplicateArray[i], at: i)
            }
        }
        
        else{
            for i in 0..<countElements{
                array.insert(duplicateArray[i], at: i)
            }
        }
        
        return array
 
    }
    
    public func getMostExpensiveCategory() -> [tupla]{
    
        
        
        var listCategory : [tupla] = [tupla]()
        if(managerPurchases != nil){
            for key in keys{
                var sum : Double = 0
                for purchase in GetAllPurchases(){
                    if(purchase.tag == key)
                    {
                        sum += purchase.amount
                    }
                }
                var t : tupla = tupla(name: key, amount: sum)
                
                
                listCategory.append(t)
            }
        }
        var duplicateArray = listCategory.sorted(by: { $0.amount > $1.amount })
        var tempoArr : [tupla] = [tupla]()
        var array : [tupla] = [tupla]()
        for cat in duplicateArray{
            
                if(cat.amount > 0){
                    tempoArr.append(cat)
                }
            
        }
        let countElements : Int = tempoArr.count
        
        if(countElements >= 3){
            for i in 0..<3{
                array.insert(tempoArr[i], at: i)
            }
        }
        
        else{
            for i in 0..<countElements{
                array.insert(tempoArr[i], at: i)
            }
        }
        
        return array.sorted(by: { $0.amount > $1.amount })
        
    
      
    }
    
    public func getMostExpensiveCategoryCircle() -> [tupla]{
    
        
        
        var listCategory : [tupla] = [tupla]()
        if(managerPurchases != nil){
            for key in keys{
                var sum : Double = 0
                for purchase in GetAllPurchases(){
                    if(purchase.tag == key)
                    {
                        sum += purchase.amount
                    }
                }
                var t : tupla = tupla(name: key, amount: sum)
                
                
                listCategory.append(t)
            }
        }
        
        var middleArray : [tupla] = [tupla]()
        for p in listCategory{
            if(p.amount > 0){
                middleArray.append(p)
            }
        }
        var duplicateArray = middleArray.sorted(by: { $0.amount > $1.amount })
        return duplicateArray
        
    
      
    }
    
    public func getMostExpensiveCategoryCircleOfMonth() -> [tupla]{
    
        
        
        let year: Int? = Calendar.current.dateComponents([.year], from: Date()).year
        let lists : [Purchase] = GetPurchasesByYear(year: year!)
        var listCategory : [tupla] = [tupla]()
        if(managerPurchases != nil){
            for key in keys{
                var sum : Double = 0
                for purchase in GetPurchasesByMonth(month: month!, listN:lists){
                    if(purchase.tag == key)
                    {
                        sum += purchase.amount
                    }
                }
                var t : tupla = tupla(name: key, amount: sum)
                
                
                listCategory.append(t)
            }
        }
        var duplicateArray = listCategory.sorted(by: { $0.amount > $1.amount })
        var tempoArr : [tupla] = [tupla]()
        var array : [tupla] = [tupla]()
        for cat in duplicateArray{
            
                if(cat.amount > 0){
                    tempoArr.append(cat)
                }
            
        }
        var middleArray : [tupla] = [tupla]()
        for p in tempoArr{
            if(p.amount > 0){
                middleArray.append(p)
            }
        }
        var s = middleArray.sorted(by: { $0.amount > $1.amount })
        return s
        
        
    
      
    }
    
    public func getMostExpensiveCategoryOfMonth() -> [tupla]{
    
        let year: Int? = Calendar.current.dateComponents([.year], from: Date()).year
        let lists : [Purchase] = GetPurchasesByYear(year: year!)
        var listCategory : [tupla] = [tupla]()
        if(managerPurchases != nil){
            for key in keys{
                var sum : Double = 0
                for purchase in GetPurchasesByMonth(month: month!, listN:lists){
                    if(purchase.tag == key)
                    {
                        sum += purchase.amount
                    }
                }
                var t : tupla = tupla(name: key, amount: sum)
                
                
                listCategory.append(t)
            }
        }
        var duplicateArray = listCategory.sorted(by: { $0.amount > $1.amount })
        var tempoArr : [tupla] = [tupla]()
        var array : [tupla] = [tupla]()
        for cat in duplicateArray{
            
                if(cat.amount > 0){
                    tempoArr.append(cat)
                }
            
        }
        let countElements : Int = tempoArr.count
        
        if(countElements >= 3){
            for i in 0..<3{
                array.insert(tempoArr[i], at: i)
            }
        }
        
        else{
            for i in 0..<countElements{
                array.insert(tempoArr[i], at: i)
            }
        }
        
        return array.sorted(by: { $0.amount > $1.amount })
        
    
      
    }
    public func GetPurchasesByYear(year:Int)->[Purchase]{
        var list : [Purchase] = [Purchase]()
        if(managerPurchases != nil){
            
            for purchase in GetAllPurchases(){
                let purchaseYear = Calendar.current.dateComponents([.year], from: purchase.date)
                
                if(purchaseYear.year == year){
                    list.append(purchase)
                }
                
            }
            
        }
        
        return list
    }
    
    public func GetPurchasesByYearAndMonth(year:Int,month:Int)->[Purchase]{
        var list : [Purchase] = [Purchase]()
        var list2 : [Purchase] = [Purchase]()
        if(managerPurchases != nil){
            
            for purchase in GetAllPurchases(){
                let purchaseYear = Calendar.current.dateComponents([.year], from: purchase.date)
                
                if(purchaseYear.year == year){
                    list.append(purchase)
                }
                
            }
            
            
            for purchase in list{
                let purchaseYear = Calendar.current.dateComponents([.month], from: purchase.date)
                
                if(purchaseYear.month == month){
                    list2.append(purchase)
                }
                
            }
            
        }
        
        return list2.sorted(by: { $0.amount > $1.amount })
    }
    public func GetPurchasesByMonthSortedByName(month:Int,purchasesListN:[Purchase])->[Purchase]{
        var list : [Purchase] = [Purchase]()
        if(managerPurchases != nil){
            let currentMonth : String = convertMonth(value: month)
            for purchase in purchasesListN{
                let purchaseMonth = Calendar.current.dateComponents([.month], from: purchase.date)
                if(purchaseMonth.month == month){
                    list.append(purchase)
                }
                
            }
            
        }
        
        return list.sorted()
    }
    
    public func addPurchase(purchase:Purchase){
        let month: Int? = Calendar.current.dateComponents([.month], from: purchase.date).month
        
        
        if(month != nil){
            managerPurchases?.purchasesList[convertMonth(value: month!)]?.append(purchase)
        }
        SaveManagerPurchases()
    }
    
    public func addPurchaseTEST(purchase:Purchase,month:Int){
        
        
        
        
        managerPurchases?.purchasesList[convertMonth(value: month)]?.append(purchase)
        
        SaveManagerPurchases()
    }
    
    public func deletePurchase(purchase:Purchase){
        let month: Int? = Calendar.current.dateComponents([.month], from: purchase.date).month
        let index = managerPurchases?.purchasesList[convertMonth(value: month!)]?.firstIndex(where: {$0.id == purchase.id})
        managerPurchases?.purchasesList[convertMonth(value: month!)]?.remove(at: index!)
        SaveManagerPurchases()
        
    }
    
    public func convertMonth(value:Int) -> String{
        if(value == 1){return "January"}
        if(value == 2){return "February"}
        if(value == 3){return "March"}
        if(value == 4){return "April"}
        if(value == 5){return "May"}
        if(value == 6){return "June"}
        if(value == 7){return "July"}
        if(value == 8){return "August"}
        if(value == 9){return "September"}
        if(value == 10){return "October"}
        if(value == 11){return "November"}
        if(value == 12){return "December"}
        return ""
    }
}

struct tupla : Identifiable{
    let id : UUID = UUID()
    var name : String
    var amount : Double
    
    init(name:String,amount:Double){
        self.name = name
        self.amount = amount
    }
}
