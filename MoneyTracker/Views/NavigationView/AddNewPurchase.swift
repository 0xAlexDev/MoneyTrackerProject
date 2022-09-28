//
//  AddNewPurchase.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 26/02/22.
//

import SwiftUI



struct AddNewPurchase: View {
    @ObservedObject var user : ControllerUser
    @ObservedObject var settings: ControllerSettings
    @ObservedObject var managerPurchases: ControllerManagerPurchases
    @Environment(\.presentationMode) var presentationMode
    @State var textTitle:String = ""
    @State var textDescription:String = ""
    @State var textAmount:String = ""
    @State var textTag:String = "Other"
    @State var error : Bool = false
    @State var text:String = "else"
    
    
    
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false){
                
                
                HStack{
                    NavigationBack(settings:settings)
                    
                    Text("New Purchase")
                        .font(.title)
                        .bold()
                        .padding()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Spacer()
                }
                
                HStack{
                    Image(systemName: "person").foregroundColor(settings.getColorUsed().secondaryColor)
                    TextField("*Insert Title", text: $textTitle)
                        .frame(height: 43)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                        .onReceive(textTitle.publisher.collect()) {
                                self.textTitle = String($0.prefix(20))
                            }
                    
                }.padding(.horizontal)
                    .onTapGesture(perform: {
                        self.hideKeyboard()
                    })
                
                HStack{
                    Image(systemName: "person").foregroundColor(settings.getColorUsed().secondaryColor)
                    TextField("*Insert Amount", text: $textAmount)
                        .frame(height: 43)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                        .keyboardType(.decimalPad)
                        .onReceive(textAmount.publisher.collect()) {
                                self.textAmount = String($0.prefix(7))
                            }
                    
                    
                }.padding(.horizontal).onTapGesture(perform: {
                    self.hideKeyboard()
                })
                
                
                HStack{
                    Image(systemName: "person").foregroundColor(settings.getColorUsed().secondaryColor)
                    TextField("*Insert Description", text: $textDescription)
                        
                        .frame(height: 43)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding([.horizontal], 4)
                        .cornerRadius(16)
                        .overlay(RoundedRectangle(cornerRadius:16).stroke(settings.getColorUsed().secondaryColor))
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                        .onReceive(textDescription.publisher.collect()) {
                                self.textDescription = String($0.prefix(100))
                            }
                        
                    
                }.padding(.horizontal).onTapGesture(perform: {
                    self.hideKeyboard()
                })
                
                HStack{
                    Spacer()
                    Text("TAG")
                        .bold()
                        .padding()
                        .foregroundColor(settings.getColorUsed().secondaryColor)
                    Spacer()
                }
                
                .onTapGesture(perform: {
                    self.hideKeyboard()
                }).onTapGesture(perform: {
                    self.hideKeyboard()
                })
                
                
                // TAG -------------------------------------------
                ScrollView(.horizontal,showsIndicators: false){
                    
                    
                    HStack{
                        
                        Button(action: {
                            textTag = "Other"
                        }, label: {
                            
                            if(textTag != "Other"){
                                HStack{
                                    Image(systemName: "Other")
                                    Text("Other")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Other")
                                    Text("Other")
                                        
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                                    
                                    
                            }
                            
                        })
                        
                        
                        //2 button
                        Button(action: {
                            textTag = "App"
                        }, label: {
                            
                            if(textTag != "App"){
                                HStack{
                                    Image(systemName: "App")
                                    Text("App")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "App")
                                    Text("App")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        //3 button
                        Button(action: {
                            textTag = "Accessories"
                        }, label: {
                            
                            if(textTag != "Accessories"){
                                HStack{
                                    Image(systemName: "Accessories")
                                    Text("Accessories")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Accessories")
                                    Text("Accessories")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        //3 button
                        Button(action: {
                            textTag = "Sports"
                        }, label: {
                            
                            if(textTag != "Sports"){
                                HStack{
                                    Image(systemName: "Sports")
                                    Text("Sports")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Sports")
                                    Text("Sports")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        
                        
                        
                        //4 button
                        Button(action: {
                            textTag = "Finance"
                        }, label: {
                            
                            if(textTag != "Finance"){
                                HStack{
                                    Image(systemName: "Finance")
                                    Text("Finance")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Finance")
                                    Text("Finance")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        Button(action: {
                            textTag = "Utilies"
                        }, label: {
                            
                            if(textTag != "Utilies"){
                                HStack{
                                    Image(systemName: "Utilies")
                                    Text("Utilies")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Utilies")
                                    Text("Utilies")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                    }
                    
                    
                }.padding()
                
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        Button(action: {
                            textTag = "Take Away"
                        }, label: {
                            
                            if(textTag != "Take Away"){
                                HStack{
                                    Image(systemName: "Take Away")
                                    Text("Take Away")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Take Away")
                                    Text("Take Away")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        Button(action: {
                            textTag = "Restaurants"
                        }, label: {
                            
                            if(textTag != "Restaurants"){
                                HStack{
                                    Image(systemName: "Restaurants")
                                    Text("Restaurants")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Restaurants")
                                    Text("Restaurants")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        Button(action: {
                            textTag = "Groceries"
                        }, label: {
                            
                            if(textTag != "Groceries"){
                                HStack{
                                    Image(systemName: "Groceries")
                                    Text("Groceries")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Groceries")
                                    Text("Groceries")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        Button(action: {
                            textTag = "Travels"
                        }, label: {
                            
                            if(textTag != "Travels"){
                                HStack{
                                    Image(systemName: "Travels")
                                    Text("Travels")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Travels")
                                    Text("Travels")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        Button(action: {
                            textTag = "Vehicles"
                        }, label: {
                            
                            if(textTag != "Vehicles"){
                                HStack{
                                    Image(systemName: "Vehicles")
                                    Text("Vehicles")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Vehicles")
                                    Text("Vehicles")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        
                        Button(action: {
                            textTag = "Books"
                        }, label: {
                            
                            if(textTag != "Books"){
                                HStack{
                                    Image(systemName: "Books")
                                    Text("Books")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Books")
                                    Text("Books")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                    }
                    
                    
                }.padding()
                
                
                
                ScrollView(.horizontal,showsIndicators: false){
                    
                    HStack{
                        Button(action: {
                            textTag = "Shopping"
                        }, label: {
                            
                            if(textTag != "Shopping"){
                                HStack{
                                    Image(systemName: "Shopping")
                                    Text("Shopping")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Shopping")
                                    Text("Shopping")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        Button(action: {
                            textTag = "Beauty"
                        }, label: {
                            
                            if(textTag != "Beauty"){
                                HStack{
                                    Image(systemName: "Beauty")
                                    Text("Beauty")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Beauty")
                                    Text("Beauty")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        Button(action: {
                            textTag = "Clothes"
                        }, label: {
                            
                            if(textTag != "Clothes"){
                                HStack{
                                    Image(systemName: "Clothes")
                                    Text("Clothes")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Clothes")
                                    Text("Clothes")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        Button(action: {
                            textTag = "House"
                        }, label: {
                            
                            if(textTag != "House"){
                                HStack{
                                    Image(systemName: "House")
                                    Text("House")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "House")
                                    Text("House")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        Button(action: {
                            textTag = "Electronics"
                        }, label: {
                            
                            if(textTag != "Electronics"){
                                HStack{
                                    Image(systemName: "Electronics")
                                    Text("Electronics")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Electronics")
                                    Text("Electronics")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                        Button(action: {
                            textTag = "Legal Services"
                        }, label: {
                            
                            if(textTag != "Legal Services"){
                                HStack{
                                    Image(systemName: "Legal Services")
                                    Text("Legal Services")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor.opacity(0.20))
                                    .foregroundColor(settings.getColorUsed().secondaryColor)
                                    .clipShape(Capsule())
                            }
                            
                            else{
                                HStack{
                                    Image(systemName: "Legal Services")
                                    Text("Legal Services")
                                    
                                }.padding()
                                    .background(settings.getColorUsed().secondaryColor)
                                    .foregroundColor(settings.getColorUsed().primaryColor)
                                    .clipShape(Capsule())
                            }
                            
                        })
                    }
                    
                }.padding()
                
                
                
                            
                
                
                
                // END TAG -------------------------------------------------------
                
                
                
                
                
                HStack{
                    Button(action: {
                        var flag = false
                        if(!checkFormatString(str: textTitle)){
                            flag = true
                            print("error1")
                        }
                        
                        if(textDescription.count > 100){
                            print("error2")
                            flag = true
                        }
                        
                        if(!checkFormatAmount(amount: textAmount)){
                            print("error3")
                            flag = true
                            
                        }
                        
                        
                        if(flag == false){
                            let amount = fixTarget(target: textAmount)
                            let description: String?
                            let tag : String
                            if(textDescription == ""){
                                description = nil
                            }
                            
                            else{
                                description = textDescription
                            }
                            
                            if(textTag == ""){
                                tag = "Other"
                            }
                            
                            else{
                                tag = textTag
                            }
                            managerPurchases.addPurchase(purchase: Purchase(title: textTitle, description: description, amount: amount, tag: tag))
                            presentationMode.wrappedValue.dismiss()
                            
                        }
                        
                        else{
                            error = true
                            textTitle = ""
                            textTag = ""
                            textAmount = ""
                            textDescription = ""
                            
                        }
                        
                    }, label: {
                        HStack{
                            
                            Image(systemName: "pencil")
                                .padding()
                            
                            Text("New Purchase")
                                .foregroundColor(settings.getColorUsed().secondaryColor)
                                .font(.title)
                                .bold()
                            
                            Spacer()
                        }
                    }).padding()
                    
                    
                }
                
               
                    .navigationBarHidden(true)
                        .ignoresSafeArea(.keyboard)
                        .interactiveDismissDisabled()
                        .onTapGesture(perform: {
                            self.hideKeyboard()
                        })
            }
            Spacer()
            
        }.background(settings.getColorUsed().primaryColor)
        
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
