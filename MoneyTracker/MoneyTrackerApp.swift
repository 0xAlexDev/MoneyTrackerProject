//
//  MoneyTrackerApp.swift
//  MoneyTracker
//
//  Created by Alessio Dinatale on 13/01/22.
//

import SwiftUI

@main
struct MoneyTrackerApp: App {
    @StateObject var user : ControllerUser = ControllerUser()
    @StateObject var settings : ControllerSettings = ControllerSettings()
    @StateObject var managerPurchases : ControllerManagerPurchases = ControllerManagerPurchases()
    var body: some Scene {
        WindowGroup {
            RootView(user: _user, settings: _settings, managerPurchase: _managerPurchases)
        }
    }
}
