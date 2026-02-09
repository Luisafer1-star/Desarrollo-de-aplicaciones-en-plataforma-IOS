//
//  ViewController.swift
//  ResumeUIKit
//
//  Created by Luisa Fernanda Hernández Reyes on 07/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var coursesLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("View controller code")
        
        name.text = "Luisa Fernanda Hernández Reyes"
        coursesLabel.text = ""
    }

    @IBAction func modifyMessageButton(_ sender: UIButton) {
        
        coursesLabel.text = """
        Figma Certificate
        AWS Amazon Data Engineering Certificate
        Mobile Apps Certificate

"""
        
    }
    
}

