//
//  WeatherWidget.swift
//  DuWeather
//
//  Created by Anshumali Karna on 26/01/23.
//

import SwiftUI

struct WeatherWidget: View {
    var forcast: Forecast
    
    var body: some View {
        ZStack{
            Trapezoid()
                .fill(Color.weatherWidgetBackground)
                .frame(width: 342, height: 174)
            
            HStack(alignment: .bottom) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(forcast.temperature)°")
                        .font(.system(size: 64))
                    VStack(alignment: .leading, spacing: 2 ) {
                        Text("H:\(forcast.high)°   L:\(forcast.low)°")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Text("\(forcast.location)")
                            .font(.body)
                            .lineLimit(1)
                    }
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 0) {
                    Image("\(forcast.icon) large")
                        .padding(.trailing, 4)
                    
                    Text(forcast.weather.rawValue)
                        .font(.footnote)
                        .padding(.trailing, 24)
                    
                }
            }
            .foregroundColor(.white)
            .padding(.bottom, 20)
            .padding(.leading, 20)
        }
        .frame(width: 342, height: 184, alignment: .bottom)
    }
}

struct WeatherWidget_Previews: PreviewProvider {
    static var previews: some View {
        WeatherWidget(forcast: Forecast.cities[0])
            .preferredColorScheme(.dark)
    }
}
