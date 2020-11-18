//
//  NoteController.swift
//  Notes
//
//  Created by Heli Bavishi on 11/6/20.
//

import Foundation

class NoteController {
    
    //Shared Instance
    static let sharedInstance = NoteController()
    
    //Source of Truth
    var notes: [Note] = []
    
    //To create note
    func addNote(noteText: String) {
        let note = Note(noteText: noteText)
        notes.append(note)
        saveFileForPersistance()
    }
    
    //To update note
    func updateNote(note: Note, noteText: String) {
        note.noteText = noteText
        saveFileForPersistance()
    }
    
    //To delete note
    func deleteNote(note: Note) {
        guard let index = notes.firstIndex(of: note) else { return }
        notes.remove(at: index)
        saveFileForPersistance()
    }

    //MARK:- Persistence
    
    // returns a URL path where our information will be stored
    func createFileForPersistance() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = urls[0].appendingPathComponent("Notes.json")
        return fileURL
    }
    
    //encoding notes array and writing that information to "Notes.json"
    func saveFileForPersistance() {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonNotes = try jsonEncoder.encode(notes)
            try jsonNotes.write(to: createFileForPersistance())
        } catch let encodingError {
            print(encodingError.localizedDescription)
        }
    }
    
    //decoded data passed and store in our SOT
    func loadFileFromPersistance() {
        let jsonDecoder = JSONDecoder()
        do {
            let jsonData = try Data(contentsOf: createFileForPersistance())
            let decodedNotes = try jsonDecoder.decode([Note].self, from: jsonData)
            notes = decodedNotes
        } catch let decodingError {
            print(decodingError.localizedDescription)
        }
    }
} // END of class
