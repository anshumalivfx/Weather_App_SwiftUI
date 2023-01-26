//
//  SegmentedControlView.swift
//  DuWeather
//
//  Created by Anshumali Karna on 26/01/23.
//

import SwiftUI

struct SegmentedControlView: View {
    @Binding var selection: Int
    var body: some View {
        VStack(spacing: 5) {
            HStack {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 0
                    }
                    
                } label: {
                    Text("Hourly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        selection = 1
                    }
                    
                } label: {
                    Text("Weekly Forecast")
                }
                .frame(minWidth: 0, maxWidth: .infinity)

            }
            .font(.subheadline.weight(.semibold))
            .foregroundColor(.secondary)
            
            Divider()
                .background(.white.opacity(0.5))
                .blendMode(.overlay)
                .shadow(color: .black.opacity(0.2), radius: 0, x:0, y:1)
                .blendMode(.overlay)
                .overlay {
                    HStack {
                        Divider()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .background(Color.underline )
                        .blendMode(.overlay)
                    }
                    .frame(maxWidth: .infinity, alignment: selection == 0 ? .leading : .trailing)
                    .offset(y: -1)
                }
                
        }
        .padding(.top, 25)
    }
}

struct SegmentedControlView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().preferredColorScheme(.dark)
    }
}
