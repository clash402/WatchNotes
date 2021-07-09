//
//  HeaderView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Josh Courtney on 7/9/21.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    var title = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // TITLE
            if !title.isEmpty {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // RULE
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } // hstack
            .foregroundColor(.accentColor)
        } // vstack
    }
}

// MARK: - PREVIEW
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Credits")
        HeaderView()
    }
}
