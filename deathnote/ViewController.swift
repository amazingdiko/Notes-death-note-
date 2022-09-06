//
//  ViewController.swift
//  deathnote
//
//  Created by Vitaliy Plaschenkov on 12.08.2022.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func update(note: Note)
}

struct Note {
    var namePerson: String
    var deathReason: String
    var timeDate: Date
    
    init(namePerson: String, deathReason: String, timeDate: Date)
    {
        self.namePerson = namePerson
        self.deathReason = deathReason
        self.timeDate = timeDate
    }
}

class ViewController: UIViewController, UITableViewDataSource,ViewControllerDelegate {
    
    func update(note: Note) {
        allPersons.append(note)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ViewControllerAddPerson else {return}
        destination.deligate = self
    }
    
    var allPersons = [Note(namePerson: "Ivan", deathReason: "Suicide", timeDate: Date()),
                      Note(namePerson: "Matey", deathReason: "No music = no life", timeDate: Date()),
                      Note(namePerson: "Solja Boy", deathReason: "God", timeDate: Date())]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPersons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellCorrect") as! TableViewCellCorrect
        cell.namePerson.text = allPersons[indexPath.row].namePerson
        cell.timeDeath.text = allPersons[indexPath.row].timeDate.formatted(date: .numeric, time: .shortened)
        cell.reasonDeath.text = allPersons[indexPath.row].deathReason
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TableViewCellCorrect", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCellCorrect")
        tableView.dataSource = self
    }
    
}

