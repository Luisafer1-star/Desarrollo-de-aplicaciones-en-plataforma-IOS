//
//  HabilidadesViewController.swift
//  CV_2
//
//  Created by Luisa Fernanda Hernández Reyes on 15/03/26.
//

import UIKit

class HabilidadesViewController:
    UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Aparecera la vista (viewWillAppear)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("La vista desaparece (viewDidAppear)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("La vista desaparecera (viewWillDisappear)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("La vista desapareció (viewDidDisappear)")
        
    }
}
