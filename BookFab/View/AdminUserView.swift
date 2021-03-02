//
//  AdminUserView.swift
//  BookFab
//
//  Created by Nicole Lopez feliz on 2021-03-01.
//

import Foundation
import SwiftUI
import MapKit

struct AdminUserView: View {
    
    let tabBarImageNames = ["map", "magnifyingglass", "bookmark", "person", "gear"]
    
    @State var mapView: MapNav
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                switch selectedIndex {
                case 0:
                    NavigationView {
                        mapView
                    }
                case 1:
                    NavigationView {
                        SearchView()
                        //Text("Page is under cunstruction")
                    }
                case 2:
                    NavigationView {
                        Text("Page is under cunstruction")
                    }
                case 3:
                    NavigationView {
                        ProfileViewSheet()
                            .navigationTitle("Din profil")
                        //DisplayBusinessSheet(location: pressedLocation!, user: pressedUser!)
                    }
                    
                case 4:
                    NavigationView {
                        SettingsView()
                    }
                default:
                    NavigationView {
                        Text("Page is under cunstruction")
                    }
                    
                }
                
            }
            Divider()
                .padding(.bottom, 16)
            
            HStack {
                ForEach(0..<5) {num in
                    Button(action: {
                        /*if num == 2 {
                         MapView()
                         print("mapView")
                         }*/
                        
                        selectedIndex = num
                    }, label: {
                        Spacer()
                        Image(systemName: tabBarImageNames[num])
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(selectedIndex == num ? ColorManager.darkPink : .init(white: 0.8))
                            .padding(.bottom, 24)
                        Spacer()
                    })
                }
                
            }
        }
        
    }
}

struct AdminUserView_Previews: PreviewProvider {
    static var previews: some View {
        var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 59.4285,
                                           longitude: 17.9512),
            span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        var listOfLocations = [User]()
        
        AdminUserView(mapView: MapNav.init(region: region, listOfLocations: listOfLocations))
    }
}