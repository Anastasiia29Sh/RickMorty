//
//  CharacterViewController.swift
//  RickMortyGroupProject
//
//  Created by MacStud on 07.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit){
        contentMode = mode
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else {return}
            DispatchQueue.main.async(){
                self.image = image
            }
            
        }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit){
        guard let url = URL(string: link) else {return}
        downloadedFrom(url: url, contentMode: mode)
    }
}

class CharacterViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate, UISearchBarDelegate{

    var characterViewModel = CharacterViewModel()
//    var filterButtonController: FilterButtonController!
   
    @IBOutlet weak var collectView: UICollectionView!
    
    private func loadAllCharacters(){
        characterViewModel.getAllCharacters { [weak self] in
            self?.collectView.dataSource = self
            self?.collectView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllCharacters()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.collectView.dataSource = characterViewModel.charactersList() as? any UICollectionViewDataSource
        self.collectView.reloadData()
//        characterViewModel.reloadCharacters(newCharacters: radioButtonController.filterButton())
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let filterView = segue.destination as? FilterViewController{
//            filterView.characterViewModel = characterViewModel
//        }
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterViewModel.rowNumbers(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as!
        CharacterCollectionViewCell
        
        let index = characterViewModel.cellForRowAt(indexPath: indexPath)
        cell.nameView.text = index.name.capitalized
        
        cell.imageView.contentMode = .scaleAspectFill
        cell.imageView.downloadedFrom(link: index.image)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let searchV: UICollectionReusableView = collectView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "searchBar", for: indexPath)
        return searchV
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let realData = characterViewModel.charactersList()
        characterViewModel.removeCharacters()
        
        for item in realData{
            if (item.name.lowercased().contains(searchBar.text!.lowercased())){
                characterViewModel.appendCharacter(newCharacter: item)
            }
        }
        
        if (searchBar.text!.isEmpty){
            characterViewModel.reloadCharacters(newCharacters: realData)
        }
        self.collectView.reloadData()
    }
   
}
