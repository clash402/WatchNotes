//
//  Note.swift
//  WatchNotes WatchKit Extension
//
//  Created by Josh Courtney on 7/9/21.
//

import Foundation

struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
