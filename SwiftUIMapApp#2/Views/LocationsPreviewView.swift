//
//  LocationsPreviewView.swift
//  SwiftUIMapApp#2
//
//  Created by Emrullah Demir on 18.02.2023.
//

import SwiftUI

struct LocationsPreviewView: View {
    
    let location : Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0){
                image
                cityName
                placeName
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 8.0){
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y:80)
        )
        .cornerRadius(10)

    }
}

struct LocationsPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
}

extension LocationsPreviewView {
    
    private var image : some View {
        Image(location.imageNames.first!)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .cornerRadius(15)
            .padding(5)
            .background(Color.white)
    }
    
    private var cityName : some View {
        Text(location.cityName)
            .font(.subheadline)
    }
    private var placeName : some View {
        Text(location.name)
            .font(.title2)
            .fontWeight(.black)
    }
    private var learnMoreButton : some View {
        Button {
            
        } label: {
            Text("Learn more")
                .frame(height: 35)
                .frame(maxWidth: 100)
                
        }
        .buttonStyle(.borderedProminent)
    }
    private var nextButton : some View {
        Button {
            
        } label: {
            Text("Next")
                .frame(height: 35)
                .frame(maxWidth: 100)
                
        }
        .buttonStyle(.bordered)
    }
}
