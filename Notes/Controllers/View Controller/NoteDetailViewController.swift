//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Heli Bavishi on 11/6/20.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    //MARK:- Properties
    var note: Note?
    
    //MARK:- IBOutlets
    @IBOutlet weak var noteTextView: UITextView!
    
    //LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK:- IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let noteText = noteTextView.text, !noteText.isEmpty else { return }
        
        if let note = note {
            NoteController.sharedInstance.updateNote(note: note, noteText: noteText)
        }else {
            NoteController.sharedInstance.addNote(noteText: noteText)
        }
        self.navigationController?.popViewController(animated: true)
    }

    func updateViews() {
        guard let noteExists = note else { return }
        noteTextView.text = noteExists.noteText
    }
}
