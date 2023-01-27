//
//  NavigationBar.swift
//  DuWeather
//
//  Created by Anshumali Karna on 26/01/23.
//

import SwiftUI

struct NavigationBar: View {
    @Environment(\.dismiss) var dismiss
    @Binding var searchText:String
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 23).weight(.medium))
                            .foregroundColor(.secondary)
                        
                        Text("Weather")
                            .font(.title)
                            .foregroundColor(.primary)
                    }
                    .frame(height: 44)
                    
                }
                
                Spacer()
                
                Image(systemName: "ellipsis.circle")                    .font(.system(size: 28))
                    .frame(width: 44, height: 44, alignment: .trailing)
                

            }
            .frame(height: 52)
            
            
            HStack(spacing: 2){
                Image(systemName:"magnifyingglass")
                
                TextField("Search for a city", text: $searchText)
            }
            .foregroundColor(.secondary)
            .padding(.horizontal, 6)
            .padding(.vertical, 7)
            .frame(height: 36, alignment: .leading)
            .background(Color.bottomSheetBackground, in:
                            RoundedRectangle(cornerRadius: 10)
                        
            )
            .innerShadow(shape: RoundedRectangle(cornerRadius: 10), color: .black.opacity(0.25), line: 2, offsetX: 0, offsetY: 2, blur: 2)
        }
        .frame(height: 106, alignment: .top)
        .padding(.horizontal, 16)
        .padding(.top, 42)
        .backgroundBlur(radius: 20, opaque: true)
        .background(Color.navBarBackground)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea()
        
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar (searchText: .constant(""))
    }
}
