//
//  Note.swift
//  Notes
//
//  Created by Heli Bavishi on 11/6/20.
//

import Foundation

class Note: Codable {
    
    //declaring properties
    var noteText: String
    
    //declaring initiazier
    init(noteText: String) {
        self.noteText = noteText
    }
}

//adding Equatable protocol to compare index of noteText while deletion
extension Note: Equatable{
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.noteText == rhs.noteText
    }
}
