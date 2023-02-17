//
//  ListView.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        List{
            ForEach(vm.locations) {
                Text($0.name)
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(LocationsViewModel())
    }
}
