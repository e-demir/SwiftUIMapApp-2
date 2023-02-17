//
//  Location.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import Foundation
import MapKit

struct Location : Identifiable {
    let name :String
    let cityName :String
    let coordinates :CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link :String
    var id : String {
        name + cityName
    }
}
