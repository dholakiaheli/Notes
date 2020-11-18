//
//  NoteTableViewController.swift
//  Notes
//
//  Created by Heli Bavishi on 11/6/20.
//

import UIKit

class NoteTableViewController: UITableViewController {

    //Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        NoteController.sharedInstance.loadFileFromPersistance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return NoteController.sharedInstance.notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)

        let note = NoteController.sharedInstance.notes[indexPath.row]
        cell.textLabel?.text = note.noteText

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let note = NoteController.sharedInstance.notes[indexPath.row]
            NoteController.sharedInstance.deleteNote(note: note)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        //Identifier
        if segue.identifier == "toDetailVC"{
            // Index
            guard let indexPathOfNote = tableView.indexPathForSelectedRow else { return }
            //Destination
            guard let destinationVC = segue.destination as? NoteDetailViewController else { return }
            //Object to send
            let noteToSend = NoteController.sharedInstance.notes[indexPathOfNote.row]
            //Object to receive
            destinationVC.note = noteToSend
        }
    }
} //END of class
