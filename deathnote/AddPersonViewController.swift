//
//  AddPersonViewController.swift
//  deathnote
//
//  Created by Vitaliy Plaschenkov on 13.08.2022.
//

import UIKit

class ViewControllerAddPerson: UIViewController {
    
    weak var deligate: ViewControllerDelegate?
    var addName: String!
    var addDescript: String!
    var addTimeToDeath = Date()
    

    @IBAction func addPerson(_ sender: UIBarButtonItem) {
        let addNote: Note
        if addPerson.text == nil || addPerson.text?.isEmpty == true {
            navigationController?.popToRootViewController(animated: true)
            return
                }
        addNote = Note(namePerson: addPerson.text!, deathReason: addDescription.text ?? "", timeDate: addTimeToDeath)
        print (addNote)
        deligate?.update(note: addNote)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBOutlet weak var addPerson: UITextField!
    
    @IBOutlet weak var addDescription: UITextView!

    @IBOutlet weak var correctTime: UIDatePicker!
    @IBAction func addTime(_ sender: UIDatePicker) {
        sender.tintColor = .tintColor
        addTimeToDeath = sender.date
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        correctTime.minimumDate = .now

    }
}
