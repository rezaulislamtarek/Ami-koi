//
//  MapSelectionView.swift
//  Ami koi
//
//  Created by Rezaul Islam on 21/1/25.
//
import SwiftUI
import MapKit

struct MapSelectionView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var locationManager = LocationManager()
    @State private var selectedLocation: IdentifiableLocation? // নতুন টাইপ ব্যবহার
    @State private var address : String = ""
    private let cornerRadious : CGFloat = 16
    
    var location : (CLLocation) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            GradientText(text:"Move the map to pick a location")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top)
            Map(
                coordinateRegion: $locationManager.region,
                interactionModes: [.all],
                annotationItems: selectedLocation == nil ? [] : [selectedLocation!]
            ) { location in
                MapPin(coordinate: location.coordinate, tint: .clear)
                
            }
            .frame(height: 400)
            .cornerRadius(cornerRadious)
            .padding()
            .onChange(of: locationManager.region.center.latitude) { newValue in
                selectedLocation = IdentifiableLocation(coordinate: locationManager.region.center)
            }
            .overlay(alignment: .center) {
                Image(systemName: "mappin")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 13)
                    .foregroundColor(.red)
                    .offset(y: -15)
            }
            
            
            if let _ = selectedLocation {
                Button {
                    let cclocation = CLLocation(
                        latitude: selectedLocation!.coordinate.latitude,
                        longitude: selectedLocation!.coordinate.longitude                    )
                    location(cclocation)
                    dismiss()
                    
                } label: {
                    Text("Done")
                        .padding()
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .gradientBackground()
                        .cornerRadius(cornerRadious)
                        .padding()
                }

                 
            } else {
                Text("Move the map to pick a location")
                    .padding()
            }
        }
        .onAppear {
            locationManager.region = locationManager.region 
        }
        .fontDesign(.serif)
        
    }
}

#Preview {
    MapSelectionView( ){ _ in
        
    }
}
