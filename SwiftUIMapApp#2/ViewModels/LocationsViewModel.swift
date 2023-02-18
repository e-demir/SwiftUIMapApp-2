//
//  LocationsViewModel.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import SwiftUI
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
    
    // Is list of places shown
    @Published var listIsShown : Bool = false
        
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
    
    func toggleListShow(){
        withAnimation(SwiftUI.Animation.easeIn) {
            listIsShown.toggle()
        }
    }
    
}
