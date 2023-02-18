//
//  LocationsListView.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                listRowView(location: location)
                    .padding(.vertical,4)
            }
        }
        .listStyle(.plain)
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationsViewModel())
            .listRowBackground(Color.clear)
    }
}

extension LocationsListView {
    
    private func listRowView(location: Location)  -> some View{
        HStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
