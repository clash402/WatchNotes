//
//  SettingsView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Josh Courtney on 7/9/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount = 1
    @State private var value: Float = 1
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 8) {
            // HEADER
            HeaderView(title: "Settings")
            
            // LINE COUNT
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            // SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: { (newValue) in
                self.value = newValue
                self.updateLineCount()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
            
        } // vstack
    }
    
    // MARK: - METHODS
    func updateLineCount() {
        lineCount = Int(value)
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
