//
//  RadioButtonController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 16.11.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class RadioButtonController: NSObject {
    var buttonsArray: [UIButton]! {
        didSet {
            for b in buttonsArray {
                b.setBackgroundImage(UIImage(named: "radio-off"), for: .normal)
                b.setBackgroundImage(UIImage(named: "radio-on"), for: .selected)
            }
        }
    }
    var selectedButton: UIButton?
    var defaultButton: UIButton = UIButton() {
        didSet {
            buttonArrayUpdated(buttonSelected: self.defaultButton)
        }
    }
    
    func buttonArrayUpdated(buttonSelected: UIButton) {
        for b in buttonsArray {
            if b == buttonSelected {
                selectedButton = b
                b.isSelected = true
            } else {
                b.isSelected = false
            }
        }
    }
    
    func buttonArrayDelete(buttonSelected: UIButton) {
        for b in buttonsArray {
            b.isSelected = false
        }
    }
    
//    func filterButton() -> [Results]{
//        var criterionsS = [String]()
//        var criterionsG = [String]()
//        let dictStatus: Dictionary<String,String> = ["btnAlive":"Alive", "btnDead":"Dead", "btnUnknownS":"Unknown"]
//        let dictGender: Dictionary<String, String> = ["btnMale":"Male", "btnFemale":"Female", "btnUnknownG":"Unknown", "btnGenderless":"Genderless"]
//        var key: String
//        for button in buttonsArray{
//            if button.isSelected{
//                key = button.restorationIdentifier!
//                if dictStatus.contains(where: {$0.key == key}){
//                    criterionsS.append(dictStatus[key]!)
//                }
//                else if dictGender.contains(where: {$0.key == key}){
//                    criterionsG.append(dictGender[key]!)
//                }
//            }
//        }
//        let charcterList = CharacterViewModel().charactersList()
//        var filterCharacters = [Results]()
//        for chr in charcterList{
//            if criterionsS.contains(chr.status){
//                filterCharacters.append(chr)
//            }
//            else if criterionsG.contains(chr.gender){
//                filterCharacters.append(chr)
//            }
//        }
//        retur filterCharacters
    
}
