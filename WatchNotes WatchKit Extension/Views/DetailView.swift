//
//  DetailView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Josh Courtney on 7/9/21.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    @State private var isSettingsPresented = false
    @State private var isCreditsPresented = false
    
    let note: Note
    let count: Int
    let index: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // HEADING
            HeaderView()
            
            // CONTENT
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            } // scroll
            
            Spacer()
            
            // FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) { SettingsView() }
                
                Spacer()
                
                Text("\(index + 1) / \(count)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) { CreditsView() }
            } // hstack
            .foregroundColor(.secondary)
        } // vstack
        .padding(3)
    }
}

// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var note = Note(id: UUID(), text: "Hello world!")
    
    static var previews: some View {
        DetailView(note: note, count: 5, index: 1)
    }
}
