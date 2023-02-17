//
//  ListView.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
                
    var body: some View {
        ZStack{
            Map(coordinateRegion: $vm.mapCoordinateRegion)
                .ignoresSafeArea()
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
