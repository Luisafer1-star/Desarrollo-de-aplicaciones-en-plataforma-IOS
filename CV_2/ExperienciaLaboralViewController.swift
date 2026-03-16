//
//  ExperienciaLaboralViewController.swift
//  CV_2
//
//  Created by Luisa Fernanda Hernández Reyes on 15/03/26.
//

import UIKit

class ExperienciaLaboralViewController:
    UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view
    }
    
    @IBOutlet weak var buttonClickMe: UIButton!
    
    var contador = 0
    
    @IBAction func increment(_ sender: UIButton) {
        contador += 1
        print("Contador: \(contador)")
        
        buttonClickMe.setTitle("Contador \(contador)", for: .normal)
    }
}
