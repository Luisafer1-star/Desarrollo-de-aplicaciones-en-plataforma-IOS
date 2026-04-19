//
//  AthleteTableViewController.swift
//  FavoriteAthletes
//
//  Created by Luisa Fernanda Hernández Reyes on 15/04/26.
//

import UIKit

class AthleteTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var athletes: [Athlete] = [
            Athlete(name: "Cristiano Ronaldo", age: 39, sport: "Futbol"),
            Athlete(name: "LeBron James", age: 39, sport: "Baloncesto"),
            Athlete(name: "Canelo Álvarez", age: 31, sport: "Boxeo")
        ]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            title = "Atletas"
            
            navigationItem.backButtonTitle = "Atrás"
            navigationItem.leftBarButtonItem = editButtonItem
            
            tableView.dataSource = self
            tableView.delegate = self
        }
    
    override func setEditing(_ editing: Bool, animated: Bool){
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: animated)
    }
        
        // PASAR DATOS AL DETAIL
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showDetail" {
                
                let destination = segue.destination as! AthleteDetailViewController
                destination.delegate = self
                
                if let indexPath = sender as? IndexPath {
                    destination.athlete = athletes[indexPath.row]
                    destination.athleteIndex = indexPath.row
                }
            }
        }
    }

    // MARK: - TABLE VIEW
extension AthleteTableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let athlete = athletes[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AthleteCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = athlete.name
        content.secondaryText = "\(athlete.sport) - \(athlete.age) años"
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    // Seleccionar para editar
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath)
    }
    
    // Habilitar edición
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Swipe para borrar
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            athletes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
    
    // MARK: - DELEGATE (GUARDAR / EDITAR)
    extension AthleteTableViewController: AthleteDetailViewControllerDelegate {
        
        func athleteDetailViewController(_ controller: AthleteDetailViewController, didSave athlete: Athlete, at index: Int?) {
            
            if let index = index {
                athletes[index] = athlete
            } else {
                athletes.append(athlete)
            }
            
            tableView.reloadData()
        }
    }
