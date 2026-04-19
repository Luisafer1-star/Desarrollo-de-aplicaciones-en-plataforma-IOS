//
//  AthleteDetailViewController.swift
//  FavoriteAthletes
//
//  Created by Luisa Fernanda Hernández Reyes on 15/04/26.
//

import UIKit

protocol AthleteDetailViewControllerDelegate: AnyObject {
    func athleteDetailViewController(_ controller: AthleteDetailViewController, didSave athlete: Athlete, at index: Int?)
}

class AthleteDetailViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sportTextField: UITextField!
    
    
    weak var delegate: AthleteDetailViewControllerDelegate?
    
    var athlete: Athlete?
    var athleteIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = athlete == nil ? "Ingresar atleta" : "Editar atleta"
        
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = "\(athlete.age)"
            sportTextField.text = athlete.sport
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self,
            action: #selector(saveAthlete)
        )
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func saveAthlete() {
        
        guard let name = nameTextField.text, !name.isEmpty,
              let ageText = ageTextField.text, let age = Int(ageText),
              let sport = sportTextField.text, !sport.isEmpty else {
            
            
            print("Datos inválidos")
            return
        }
        
        let newAthlete = Athlete(name: name, age: age, sport: sport)
        
        delegate?.athleteDetailViewController(self, didSave: newAthlete, at: athleteIndex)
        
        print("Guardando atleta...")
        
        navigationController?.popViewController(animated: true)
    }
}
