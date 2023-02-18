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
            
            VStack(spacing: 0){
               header
                .padding()
                
                Spacer()
                
                ZStack{
                    ForEach(vm.locations) { location in
                        LocationsPreviewView(location: location)
                            .padding()
                            .shadow(radius: 20)
                    }
                }
            }
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

// VIEWS EXTENSION
extension LocationsView{
    private var header : some View{
        VStack {
            Button {
                vm.toggleListShow()
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.listIsShown ? 180 : 0))
                    }
            }

            if vm.listIsShown{
                LocationsListView()
            }
            
        }
    
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black, radius: 20, x: 0, y: 15)
    }
}
