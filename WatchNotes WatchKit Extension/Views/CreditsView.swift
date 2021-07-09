//
//  CreditsView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Josh Courtney on 7/9/21.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // PROFILE IMAGE
            Image("developer-no1")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // HEADER
            HeaderView(title: "Credits")
            
            // CONTENT
            Text("Josh Courtney")
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Developer")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.secondary)
        } // vstack
    }
}

// MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
