//
//  WeatherView.swift
//  DuWeather
//
//  Created by Anshumali Karna on 26/01/23.
//

import SwiftUI

struct WeatherView: View {
    @State private var searchText = ""
    
    var searchResults: [Forecast] {
        if searchText.isEmpty {
            return Forecast.cities
        }
        else {
            return Forecast.cities.filter{ $0.location.contains(searchText)
                
            }
        }
    }
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            ScrollView(showsIndicators: false, content: {
                VStack(spacing: 20) {
                    ForEach(searchResults) { forecast in
                        withAnimation {
                            WeatherWidget(forcast: forecast)
                        }
                        
                           
                    }
                    
                }
            })
            .safeAreaInset(edge: .top) {
                EmptyView()
                    .frame(height: 110)
            }
        }
        .overlay{
            NavigationBar(searchText: $searchText)
        }
        .toolbar(.hidden)
//        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search for a city")
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WeatherView()
                .preferredColorScheme(.dark)
        }
    }
}
