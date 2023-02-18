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
    
    func changeLocation(location : Location){
        withAnimation(.easeIn) {
            self.mapLocation = location
            self.listIsShown = false
        }
    
    }
    
    func nextButtonPressed(){
        
        // find current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            print("Index was not found")
            return
        }
        
        // check if next index inside the array
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            //next id is not valid
            //restart from 0
            guard let firstLocation = locations.first else {return}
            changeLocation(location: firstLocation)
            return
        }
        
        // next index is valid
        let nextLocation = locations[nextIndex]
        changeLocation(location: nextLocation)
    }
    
}
