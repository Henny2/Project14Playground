//
//  MapKitView.swift
//  Project14Playground
//
//  Created by Henrieke Baunack on 1/2/24.
//

import SwiftUI
import MapKit

struct MapKitView: View {
    let initialPosition = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.9635, longitude: -121.97), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    var body: some View {
        Map(initialPosition: initialPosition)
    }
}


struct MapKitViewLoggedPosition: View {
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.9635, longitude: -121.97), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    var body: some View {
        Map(position: $position)
            .onMapCameraChange { context in
                print(context.region)
            }
    }
}

struct Location: Identifiable {
    var id = UUID()
    var name: String
    var coordinates: CLLocationCoordinate2D
}

struct MapKitViewMarker: View {
    let locations = [
        Location(name: "Pleasure Point", coordinates: CLLocationCoordinate2D(latitude: 36.9635, longitude: -121.97)),
        Location(name: "Cowells", coordinates: CLLocationCoordinate2D(latitude: 36.9625, longitude: -122.0226))
    ]
    var body: some View {
        Map {
            ForEach(locations) { location in
                Marker(location.name, coordinate: location.coordinates)
            }
        }
    }
}

#Preview {
//    MapKitView()
//    MapKitViewLoggedPosition()
    MapKitViewMarker()
}
