//
//  EditUser.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 01/03/22.
//

import SwiftUI

import SwiftUI

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


struct EditUser: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings: ControllerSettings
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @Environment(\.presentationMode) var presentationMode
    @State var textName:String = ""
    @State var textSurname:String = ""
    @State var textTarget:String = ""
    @State var textFavoriteColor:String = ""
    @State var error : Bool = false
    @State var editToggle : Bool = false
    @State var colorSet:Int = 0
    
    
    
    var body: some View {
        VStack{
            
            HStack{
                NavigationBack(settings: settings)
                
                
                Text("User")
                    .font(.title)
                    .bold()
                    .padding()
                    .onTapGesture(perform: {
                        self.hideKeyboard()
                    })
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
                
                
                
            }
            
            HStack{
                Image(systemName: "person").foregroundColor(settings.getColorUsed().secondaryColor)
                TextField("", text: $textName)
                    .frame(height: 43)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                
                
            }.padding(.horizontal)
            
            HStack{
                Image(systemName: "person").foregroundColor(settings.getColorUsed().secondaryColor)
                TextField("*Insert Surname", text: $textSurname)
                    .frame(height: 43)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                    .foregroundColor(settings.getColorUsed().secondaryColor)
            }.padding(.horizontal)
            
            HStack{
                Image(systemName: "person").foregroundColor(settings.getColorUsed().secondaryColor)
                TextField("*Insert Targhet", text: $textTarget)
                    .frame(height: 43)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding([.horizontal], 4)
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                    .foregroundColor(settings.getColorUsed().secondaryColor)
                    .keyboardType(.decimalPad)
                
            }.padding(.horizontal).padding(.bottom)
            
            HStack{
                Spacer()
                Text("Theme").font(.title).bold().padding().foregroundColor(settings.getColorUsed().secondaryColor)
                Spacer()
            }
            
            
            
            HStack{
                Spacer()
                
                
                                
                
                
                
                
                if(settings.getColorUsedNum() != 2){
                    VStack{
                        Button(action: {
                            colorSet = 2
                        }, label: {
                            Rectangle()
                                .foregroundColor(.cyan)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius:16).stroke(Color.black))
                                .frame(width: 50, height: 50)
                        }).onTapGesture(perform: {
                            self.hideKeyboard()
                        })
                        if(colorSet == 2){
                            Text("").padding()
                        }
                    }
                    
                    
                }
                
                if(settings.getColorUsedNum() != 3){
                    VStack{
                        Button(action: {
                            colorSet = 3
                        }, label: {
                            Rectangle()
                                .foregroundColor(Color.purple)
                                .cornerRadius(16)
                                .overlay(RoundedRectangle(cornerRadius:16).stroke(Color.black))
                                .frame(width: 50, height: 50)
                        }).onTapGesture(perform: {
                            self.hideKeyboard()
                        })
                        if(colorSet == 3){
                            Text("").padding()
                        }
                    }
                    
                    
                }
                
                if(settings.getColorUsedNum() != 1 ){
                    VStack{
                        
                        Button(action: {
                            colorSet = 1
                        }, label: {
                            ZStack{
                                
                                Rectangle()
                                    .foregroundColor(Color.white)
                                    .cornerRadius(16)
                                    .overlay(RoundedRectangle(cornerRadius:16).stroke(Color.black))
                                    .frame(width: 50, height: 50)
                                
                                Circle()
                                    
                                    .foregroundColor(Color.black)
                                    .frame(width: 20, height: 20)
                                
                            }
                        }).onTapGesture(perform: {
                            self.hideKeyboard()
                        })
                        
                        if(colorSet == 1){
                            Text("").padding()
                        }
                        
                        
                        
                    }
                    
                }

                
                if(settings.getColorUsedNum() != 4){
                    VStack{
                        Button(action: {
                            colorSet = 4
                        }, label: {
                            ZStack{
                                
                                Rectangle()
                                    .foregroundColor(Color.white)
                                    .cornerRadius(16)
                                    .overlay(RoundedRectangle(cornerRadius:16).stroke(Color.black))
                                    .frame(width: 50, height: 50)
                                
                                Circle()
                                    
                                    .foregroundColor(Color.pink)
                                    .frame(width: 20, height: 20)
                                
                            }
                            
                        }).onTapGesture(perform: {
                            self.hideKeyboard()
                        })
                        if(colorSet == 4){
                            Text("").padding()
                        }
                    }
                    
                    
                }
                
                if(settings.getColorUsedNum() != 5){
                    VStack{
                        Button(action: {
                            colorSet = 5
                        }, label: {
                            ZStack{
                                
                                Rectangle()
                                    .foregroundColor(Color.white)
                                    .cornerRadius(16)
                                    .overlay(RoundedRectangle(cornerRadius:16).stroke(Color.black))
                                    .frame(width: 50, height: 50)
                                
                                Circle()
                                    
                                    .foregroundColor(Color.purple)
                                    .frame(width: 20, height: 20)
                            }
                            
                        }).onTapGesture(perform: {
                            self.hideKeyboard()
                        })
                        if(colorSet == 5){
                            Text("").padding()
                        }
                    }
                    
                    
                }
                
                if(settings.getColorUsedNum() != 6){
                    VStack{
                        Button(action: {
                            colorSet = 6
                        }, label: {
                            ZStack{
                                
                                Rectangle()
                                    .foregroundColor(Color.white)
                                    .cornerRadius(16)
                                    .overlay(RoundedRectangle(cornerRadius:16).stroke(Color.black))
                                    .frame(width: 50, height: 50)
                                
                                Circle()
                                    
                                    .foregroundColor(Color.cyan)
                                    .frame(width: 20, height: 20)
                            }
                            
                        }).onTapGesture(perform: {
                            self.hideKeyboard()
                        })
                        if(colorSet == 6){
                            Text("").padding()
                        }
                    }
                    
                    
                }
                
                
                
                
                
                Spacer()
            }
            .padding(.bottom)
            
            
            
            
            
            
            
            HStack{
                Button(action: {
                    var flag = false
                    if(!checkFormatString(str: textName)){
                        flag = true
                        print("error1")
                    }
                    
                    if(!checkFormatString(str: textSurname)){
                        flag = true
                        print("error2")
                    }
                    
                    
                    if(!checkFormatAmount(amount: textTarget)){
                        print("error4")
                        flag = true
                        
                    }
                    
                    
                    
                    if(flag == false){
                        user.SetName(name: textName)
                        user.SetSurname(surname: textSurname)
                        textTarget = textTarget.replacingOccurrences(of: ",", with: ".")
                        managerPurchases.SetTarget(target: Double(textTarget)!)
                        
                        if(colorSet != 0){
                            settings.setColorUse(value: self.colorSet)
                        }
                        
                        user.SaveUser()
                        managerPurchases.SaveManagerPurchases()
                        settings.SaveSettings()
                        
                        editToggle.toggle()
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    if(flag == true){
                        error.toggle()
                    }
                    
                    
                }, label: {
                    HStack{
                        
                        Image(systemName: "pencil")
                            .padding()
                        
                        Text("Save Changes")
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                            .font(.title)
                            .bold()
                        
                        Spacer()
                    }
                })
            }
            
            
            
            
            
            if(error == true){
                Text("Invalid input insert")
                    .foregroundColor(Color.red)
                    .font(.largeTitle)
                    .bold()
                
            }
            Spacer()
            /*
            Button(action: {
                
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let someDateTime = formatter.date(from: "2024/03/08 22:31")
                let p : Purchase = Purchase(title: "hello", description: nil, amount: 100, tag: "Other",date1: someDateTime!)
                managerPurchases.PrintManagerPurchases()
                managerPurchases.addPurchase(purchase: p)
                
                let formatter1 = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let someDateTime1 = formatter.date(from: "2023/01/08 22:31")
                let p1 : Purchase = Purchase(title: "hello", description: nil, amount: 100, tag: "Other",date1: someDateTime1!)
                managerPurchases.PrintManagerPurchases()
                managerPurchases.addPurchase(purchase: p1)
                
                let formatter2 = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let someDateTime2 = formatter.date(from: "2022/01/08 22:31")
                let p2 : Purchase = Purchase(title: "hello", description: nil, amount: 100, tag: "Other",date1: someDateTime2!)
                managerPurchases.PrintManagerPurchases()
                managerPurchases.addPurchase(purchase: p2)
                
                let formatter3 = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let someDateTime3 = formatter.date(from: "2039/07/08 22:31")
                let p3 : Purchase = Purchase(title: "hello", description: nil, amount: 100, tag: "Other",date1: someDateTime3!)
                managerPurchases.PrintManagerPurchases()
                managerPurchases.addPurchase(purchase: p3)
                
                let formatter4 = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let someDateTime4 = formatter.date(from: "2027/12/08 22:31")
                let p4 : Purchase = Purchase(title: "hello", description: nil, amount: 100, tag: "Other",date1: someDateTime4!)
                managerPurchases.PrintManagerPurchases()
                managerPurchases.addPurchase(purchase: p4)
                
                let formatter5 = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let someDateTime5 = formatter.date(from: "2027/03/08 22:31")
                let p5 : Purchase = Purchase(title: "hello", description: nil, amount: 100, tag: "Other",date1: someDateTime5!)
                managerPurchases.PrintManagerPurchases()
                managerPurchases.addPurchase(purchase: p5)
                
                let formatter6 = DateFormatter()
                formatter.dateFormat = "yyyy/MM/dd HH:mm"
                let someDateTime6 = formatter.date(from: "2023/02/08 22:31")
                let p6 : Purchase = Purchase(title: "hello", description: nil, amount: 100, tag: "Other",date1: someDateTime6!)
                managerPurchases.PrintManagerPurchases()
                managerPurchases.addPurchase(purchase: p6)
            }, label: {
                Text("purchases test")
            })
            */
            
            
        }
        .navigationBarHidden(true)
        .background(settings.getColorUsed().primaryColor)
        .ignoresSafeArea(.keyboard)
        .interactiveDismissDisabled()
        .onTapGesture(perform: {
            self.hideKeyboard()
        })
        .onAppear(perform: {
            textName = user.GetName()
            textSurname = user.GetSurname()
            textTarget = String(managerPurchases.GetTarget())
        })
    }
    
    //Methods
    
    func checkFormatString(str:String) -> Bool{
        if(str == ""){
            return false
        }
        if(str.count > 50){
            return false
        }
        for char in str{
            if(char.isNumber || char.isSymbol){
                return false
            }
        }
        return true
    }
    
    func checkFormatAmount(amount:String) -> Bool{
        var occurencesOfComma = 0
        if(amount == "" || amount == ","){
            return false
        }
        for char in amount{
            if(char == ","){
                occurencesOfComma+=1
            }
            if(char.isLetter || char.isSymbol || occurencesOfComma>1){
                return false
            }
            
        }
        
        let targetWithPoint : String = amount.replacingOccurrences(of: ",", with: ".")
        let valueTarget = Double(targetWithPoint)
        
        if(valueTarget!>9999){
            return false
        }
        
        return true
    }
    
    func fixTarget(target:String) -> Double{
        let targetWithPoint : String = target.replacingOccurrences(of: ",", with: ".")
        let valueTarget = Double(targetWithPoint)
        return (round(valueTarget!*100)/100)
    }
}




