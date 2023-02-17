//
//  SwiftUIMapApp_2App.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import SwiftUI

@main
struct SwiftUIMapApp_2App: App {
    
    @StateObject var vm = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(vm)
        }
    }
}
