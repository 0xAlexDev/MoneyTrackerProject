//
//  SignUp.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 19/02/22.
//

import SwiftUI

struct SignUp: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings : ControllerSettings
    @ObservedObject var managerPurchases : ControllerManagerPurchases
    @State var textUsername : String = ""
    @State var textSurname : String = ""
    @State var textTarget : String = ""
    @State var error : Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader{
            geometry in
            
            
            
                VStack{
                    
                    
                    HStack{
                        Text("Sign Up")
                            .font(.title)
                            .bold()
                            .padding()
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        Spacer()
                    }.onTapGesture {
                        self.hideKeyboard()
                    }
                    
                    HStack{
                        
                        Image(systemName: "person")
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        TextField("*Insert Name", text: $textUsername)
                            .frame(height: 43)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                            .onReceive(textUsername.publisher.collect()) {
                                    self.textUsername = String($0.prefix(20))
                                }
                            
                    }.padding(.bottom).padding(.horizontal).onTapGesture {
                        self.hideKeyboard()
                    }
                    
                    HStack{
                        Image(systemName: "person")
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        TextField("*Insert Surname", text: $textSurname)
                            .frame(height: 43)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                            .onReceive(textSurname.publisher.collect()) {
                                    self.textSurname = String($0.prefix(20))
                                }
                    }.padding(.bottom).padding(.horizontal).onTapGesture {
                        self.hideKeyboard()
                    }
                    
                    HStack{
                        Image(systemName: "person")
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                        TextField("*Insert Target", text: $textTarget)
                            .frame(height: 43)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding([.horizontal], 4)
                            .cornerRadius(16)
                            .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                            .onReceive(textTarget.publisher.collect()) {
                                    self.textTarget = String($0.prefix(20))
                                }
                            .keyboardType(.decimalPad)
                    }.padding(.bottom).padding(.horizontal).onTapGesture {
                        self.hideKeyboard()
                    }
                    
                    
                    Button(action: {
                        
                        var flag = false
                        
                        if(!checkFormatString(str: textUsername)){
                            flag = true
                        }
                        
                        if(!checkFormatString(str: textSurname)){
                            flag = true
                        }
                        
                        if(!checkFormatTarget(target: textTarget)){
                            flag = true
                        }
                        
                        if(!flag){
                            DispatchQueue.main.asyncAfter(deadline: .now()) {
                                let target = fixTarget(target: textTarget)
                                user.SetName(name: textUsername)
                                user.SetSurname(surname: textSurname)
                                managerPurchases.SetTarget(target: target)
                                settings.changeLoginStatus(status: false)
                                user.SaveUser()
                                settings.SaveSettings()
                                managerPurchases.SaveManagerPurchases()
                            }
                        }
                        
                        else{
                            self.error = true
                            textUsername = ""
                            textSurname = ""
                            textTarget = ""
                        }
                        
                        
                        
                    }, label: {
                        Text("Create User!")
                            .bold()
                            .frame(width:200)
                            .font(.title)
                            .cornerRadius(10)
                            .foregroundColor(settings.getColorUsed().secondaryColor)
                            .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                            .cornerRadius(16)
                            
                            
                    })
                    Spacer()
                    if(error){
                        VStack{
                            Text("Error input format, please check your data")
                                .bold()
                                .foregroundColor(Color.red)
                            
                        }
                    }
                    
                    
                    
                                        
                    Spacer()
                    
                        .navigationBarHidden(true)
                    
                }.background(settings.getColorUsed().primaryColor)
                .onTapGesture {
                    self.hideKeyboard()
                }
                
            
        }
        
    }
    
    //Methods
    
    func checkFormatString(str:String) -> Bool{
        if(str == ""){
            return false
        }
        if(str.count > 15){
            return false
        }
        for char in str{
            if(char.isNumber || char.isSymbol){
                return false
            }
        }
        return true
    }
    
    func checkFormatTarget(target:String) -> Bool{
        if(target == ""){
            return false
        }
        for char in target{
            if(char.isLetter || char.isSymbol){
                return false
            }
        }
        
        let targetWithPoint : String = target.replacingOccurrences(of: ",", with: ".")
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


