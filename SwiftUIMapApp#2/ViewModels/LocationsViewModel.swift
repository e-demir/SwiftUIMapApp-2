//
//  LocationsViewModel.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import Foundation
import MapKit

class LocationsViewModel : ObservableObject {
    
    // All locations
    @Published var locations : [Location]
    
    // Current map location
    @Published var mapLocation : Location {
        didSet{
            setMapCoordination(location: mapLocation)
        }
    }
    
    // Empty coordinate region
    @Published var mapCoordinateRegion : MKCoordinateRegion = MKCoordinateRegion()
        
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.setMapCoordination(location: self.mapLocation)
    }
    
    private func setMapCoordination(location :Location){
        mapCoordinateRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
    }
    
}
