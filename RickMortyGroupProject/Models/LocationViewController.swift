//
//  LocationViewController.swift
//  RickMortyGroupProject
//
//  Created by dan on 09.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
//    var locations: [ResultsL] = []
    private var locationViewModel = LocationViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    private func loadAllLocations(){
        locationViewModel.getAllLocations {
            [weak self] in
            self?.collectionView.dataSource = self
            self?.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllLocations()
        
        
        
//        let url = URL(string: "https://rickandmortyapi.com/api/location")
//        URLSession.shared.dataTask(with: url!) {(data, response, error) in
//            if error == nil {
//                do{
//                    self.locations = try JSONDecoder().decode(Locations.self, from: data!).results
//
//                }catch{
//                    print("Parse Error")
//                    print(error)
//                }
//                DispatchQueue.main.async{
//
//                    self.collectionView.reloadData()
//
//                }
//            }
//        }.resume()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return locationViewModel.rowNumbers(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "locationCell", for: indexPath) as!
        LocationCollectionViewCell
        
        let index = locationViewModel.cellForRowAt(indexPath: indexPath)
        
        cell.nameLbl.text = index.name.capitalized
        cell.typeLbl.text = index.type.capitalized
        cell.dimensionLbl.text = index.dimension.capitalized
        return cell
        
    }
    
   
}
