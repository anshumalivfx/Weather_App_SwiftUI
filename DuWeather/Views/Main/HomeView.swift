//
//  HomeView.swift
//  DuWeather
//
//  Created by Anshumali Karna on 25/01/23.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable {
    case top = 0.83
    case middle = 0.385
}

struct HomeView: View {
    @State var bottomSheetPosition: BottomSheetPosition = .middle
    @State var bottomSheetTranslation: CGFloat = BottomSheetPosition.middle.rawValue
    @State var hasDragged: Bool = false
    var bottomSheetTranslationProrated: CGFloat {
        (bottomSheetTranslation - BottomSheetPosition.middle.rawValue) / (BottomSheetPosition.top.rawValue - BottomSheetPosition.middle.rawValue)
    }
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                let screenHeight = geometry.size.height + geometry.safeAreaInsets.top + geometry.safeAreaInsets.bottom
                
                let imageOffset = screenHeight + 36
                
                ZStack {
        //             MARK: Background Color
                    Color.background.ignoresSafeArea()
                    
                    
        //            MARK: BACKGROUND IMAGE
                    Image("Background")
                        .resizable()
                        .ignoresSafeArea()
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
        //            MARK: Image
                    Image("House")
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 257)
                        .offset(y: -bottomSheetTranslationProrated * imageOffset)
                    
                    VStack(spacing: -10) {
                        Text("Montreal")
                            .font(.largeTitle)
                        VStack {
        //                    Text("19°" + "\n" + "Mostly Clear")
        //                    Text("19°")
        //                        .font(.system(size: 96, weight: .thin))
        //                        .foregroundColor(.primary)
        //                    +
        //                    Text("\n")
        //                    +
        //                    Text("Mostly Clear")
        //                        .font(.title3.weight(.semibold))
        //                        .foregroundColor(.secondary)
                            Text(attributedString)
                            Text("H:24°     L:16°").font(.title3.weight(.semibold))
                                .opacity(1 - bottomSheetTranslationProrated)
                        }
                        Spacer()
                    }
                    .padding(.top, 51)
                    .offset(y: -bottomSheetTranslationProrated * 46)
                    
    //                MARK: Bottom Sheet
                    BottomSheetView(position: $bottomSheetPosition) {
    //                    Text(bottomSheetPosition.rawValue.formatted())
                    } content: {
                        ForcastView(bottomSheetTranslationProtated: bottomSheetTranslationProrated)
                    }
                    .onBottomSheetDrag { translation in
                        bottomSheetTranslation = translation / screenHeight
                        
                        
                        withAnimation(.easeInOut) {
                            if bottomSheetPosition == BottomSheetPosition.top {
                                hasDragged = true
                            }
                            else {
                                hasDragged = false
                            }
                        }
                        
                        
                    }
                    // MARK: TAB
                    TabBar {
                        bottomSheetPosition = .top
                        
                    }
                    .offset(y: bottomSheetTranslationProrated * 115)
                    
                }
            }
            .toolbar(.hidden)
        }
    }
    
    
    private var attributedString: AttributedString {
        var string = AttributedString("19°" + (hasDragged ? " | " : "\n") + "Mostly Clear")
        
        if let temp = string.range(of: "19°") {
            string[temp].font = .system(size: (96 - (bottomSheetTranslationProrated * (96-20))), weight: hasDragged ? .semibold : .thin)
            string[temp].foregroundColor = hasDragged ? .secondary : .primary
        }
        
        if let pip = string.range(of: " | ") {
            string[pip].font = .title3.weight(.semibold)
            string[pip].foregroundColor = .secondary.opacity(bottomSheetTranslationProrated)
        }
        
        if let weather = string.range(of: "Mostly Clear"){
            string[weather].font = .title3.weight(.semibold)
            string[weather].foregroundColor = .secondary
        }
        return string
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
