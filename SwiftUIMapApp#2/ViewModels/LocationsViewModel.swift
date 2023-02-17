//
//  LocationsViewModel.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import Foundation

class LocationsViewModel : ObservableObject {
    
    @Published var locations : [Location]
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
}
