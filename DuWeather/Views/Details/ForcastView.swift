//
//  ForcastView.swift
//  DuWeather
//
//  Created by Anshumali Karna on 25/01/23.
//

import SwiftUI

struct ForcastView: View {
    var bottomSheetTranslationProtated: CGFloat = 1
    @State private var selection = 0
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                SegmentedControlView(selection: $selection)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12) {
                        if selection == 0 {
                            ForEach(Forecast.hourly){forecast in
                                ForcastCard(forecast: forecast, forecastPeriod: .hourly)
                            }
                            .transition(.offset(x: -430))
                        } else {
                            ForEach(Forecast.weekly){forecast in
                                ForcastCard(forecast: forecast, forecastPeriod: .weekly)
                            }
                            .transition(.offset(x: 430))
                        }
                    }
                    .padding(.vertical, 20)
                    
                }
                .padding(.horizontal, 20)
                
                Image("Forecast Widgets")
            }
        }
        .backgroundBlur(radius: 25, opaque: true)
        .background(Color.bottomSheetBackground)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .innerShadow(shape: RoundedRectangle(cornerRadius: 44), color: Color.bottomSheetBorderMiddle, line: 1, offsetX: 0, offsetY: 1, blur: 0, blendMode: .overlay, opacity: 1 - bottomSheetTranslationProtated)
        .overlay {
            Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            RoundedRectangle (cornerRadius: 10)
            .fill(.black.opacity (0.3))
            .frame (width: 48, height: 5) .frame (height: 20)
            .frame (maxHeight: .infinity, alignment: .top)
        }
    }
}

struct ForcastView_Previews: PreviewProvider {
    static var previews: some View {
        ForcastView()
            .background(Color.background)
            .preferredColorScheme(.dark)
    }
}
