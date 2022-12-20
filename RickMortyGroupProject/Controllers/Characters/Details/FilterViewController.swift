//
//  FilterViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 16.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {  
    
    @IBOutlet weak var btnAlive: UIButton!
    @IBOutlet weak var btnDead: UIButton!
    @IBOutlet weak var btnStatusUnknown: UIButton!
    
    @IBOutlet weak var btnFemale: UIButton!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnGenderless: UIButton!
    @IBOutlet weak var btnGenderUnknown: UIButton!
    
    
    let radioController: RadioButtonController = RadioButtonController()
    let radioController2: RadioButtonController = RadioButtonController()
    var characterViewModel: CharacterViewModel!
    
    var resultFilterViewModel = ResultFilterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radioController.buttonsArray = [btnAlive,btnDead,btnStatusUnknown]
        radioController2.buttonsArray = [btnFemale,btnMale,btnGenderless,btnGenderUnknown]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if let resultView = segue.destination as? FilterResultController{
               resultView.resultFilterViewModel = resultFilterViewModel
           }
       }
    
    @IBAction func btnAliveAction(_ sender: UIButton) {
        radioController.buttonArrayUpdated(buttonSelected: sender)
    }    
    
    
    @IBAction func btnDeadAction(_ sender: UIButton) {
          radioController.buttonArrayUpdated(buttonSelected: sender)
    }
    
    @IBAction func btnStatusUnknownAction(_ sender: UIButton) {
         radioController.buttonArrayUpdated(buttonSelected: sender)
    }
    
    
    @IBAction func ResetBotton(_ sender: UIButton) {
        radioController.buttonArrayDelete(buttonSelected: sender)
    }
    
    @IBAction func Reset2Botton(_ sender: UIButton) {
        radioController2.buttonArrayDelete(buttonSelected: sender)
    }
    
    
    @IBAction func btnFemaleAction(_ sender: UIButton) {
        radioController2.buttonArrayUpdated(buttonSelected: sender)
    }
    @IBAction func btnMaleAction(_ sender: UIButton) {
        radioController2.buttonArrayUpdated(buttonSelected: sender)
    }
    @IBAction func btnGenderlessAction(_ sender: UIButton) {
        radioController2.buttonArrayUpdated(buttonSelected: sender)
    }
    @IBAction func btnGenderUnknownAction(_ sender: UIButton) {
        radioController2.buttonArrayUpdated(buttonSelected: sender)
    }
    
    func filterButton() -> [Results]{
        var criterionsS: String?
        var criterionsG: String?
        let dictStatus: Dictionary<String,String> = ["btnAlive":"Alive", "btnDead":"Dead", "btnUnknownS":"Unknown"]
        let dictGender: Dictionary<String, String> = ["btnMale":"Male", "btnFemale":"Female", "btnUnknownG":"Unknown", "btnGenderless":"Genderless"]
        for button in radioController.buttonsArray
        {
            if button.isSelected{
                criterionsS = dictStatus[button.restorationIdentifier!]
            }
        }
        for button in radioController2.buttonsArray{
            if button.isSelected{
                criterionsG = dictGender[button.restorationIdentifier!]
            }
        }
        let chrList = characterViewModel.charactersList()
        if criterionsS == nil && criterionsG == nil{
            return chrList
        }
        var filterCharacters = [Results]()
        for chr in chrList{
            
            if criterionsS == chr.status && criterionsG == nil{
                filterCharacters.append(chr)
            }
            else if criterionsG == chr.gender && criterionsS == nil{
                filterCharacters.append(chr)
            }
            else if criterionsG == chr.gender && criterionsS == chr.status{
                filterCharacters.append(chr)
            }
        }
        return filterCharacters
    }
   
        
    @IBAction func applyFilters(_ sender: Any){
        let characters = filterButton()
        resultFilterViewModel.reloadResultFilter(newResult: characters)
        dismiss(animated: true, completion: nil)        
    }
    
}
