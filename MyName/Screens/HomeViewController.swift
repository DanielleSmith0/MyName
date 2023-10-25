//
//  HomeViewController.swift
//  MyName
//
//  Created by Danielle Smith on 10/13/23.
//

import Foundation

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var nameInputView: UIView!
    
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var middleNameText: UITextField!
    @IBOutlet weak var middleName2Text: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    
    @IBOutlet weak var submitNamesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameInputView.layer.cornerRadius = 5

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearText()
    }
    
    private func clearText() {
            firstNameText.text = ""
            middleNameText.text = ""
            middleName2Text.text = ""
            lastNameText.text = ""
    }
    
    @IBAction func submitNames(_ sender: Any) {
        
        guard let meaningVC = storyboard?.instantiateViewController(withIdentifier: "MeaningViewController") as? MeaningViewController else {
            fatalError("Failed to load MeaningViewController from storyboard.")
        }
                
        if let firstName = firstNameText.text {
            if firstName != "" {
                meaningVC.fullName.append(firstName)
            }
        }
        if let middleName = middleNameText.text {
            if middleName != "" {
                meaningVC.fullName.append(middleName)
            }
        }
        if let middleName2 = middleName2Text.text {
            if middleName2 != "" {
                meaningVC.fullName.append(middleName2)
            }
        }
        if let lastName = lastNameText.text {
            if lastName != "" {
                meaningVC.fullName.append(lastName)
            }
        }

        navigationController?.pushViewController(meaningVC, animated: true)
    }
}
