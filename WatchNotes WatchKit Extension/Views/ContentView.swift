//
//  ContentView.swift
//  WatchNotes WatchKit Extension
//
//  Created by Josh Courtney on 7/9/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount = 1
    
    @State private var notes = [Note]()
    @State private var text = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add a new note", text: $text)
                
                Button(action: { addNote() }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
            } // hstack
            
            Spacer()
            
            if notes.count > 0 {
                List {
                    ForEach(0..<notes.count, id: \.self) { index in
                        NavigationLink(destination: DetailView(note: notes[index], count: notes.count, index: index)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                
                                Text(notes[index].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            } // hstack
                        } // navlink
                    } // loop
                    .onDelete(perform: delete)
                } // list
            } else {
                Spacer()
                
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                
                Spacer()
            } // ifelse
        } // vstack
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
    }
    
    // MARK: - METHODS
    func addNote() {
        guard !text.isEmpty else { return }
        
        let note = Note(id: UUID(), text: text)
        notes.append(note)
        save()
        
        text = ""
    }
    
    func getDocumentDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            try data.write(to: url)
        } catch {
            print("Cannot save note")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("No notes found")
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
