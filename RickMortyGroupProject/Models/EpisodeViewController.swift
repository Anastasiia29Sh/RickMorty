//
//  EpisodeViewController.swift
//  RickMortyGroupProject
//
//  Created by dan on 09.12.2022.
//  Copyright © 2022 MacStud. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
//    var episodes: [ResultsE] = []
    private var episodeViewModel = EpisodeViewModel()

    @IBOutlet weak var collectionView: UICollectionView!
    
    private func loadAllEpisodes(){
        episodeViewModel.getAllEpisodes {
            [weak self] in
            self?.collectionView.dataSource = self
            self?.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAllEpisodes()
        
        
//        let url = URL(string: "https://rickandmortyapi.com/api/episode")
//        URLSession.shared.dataTask(with: url!) {(data, response, error) in
//            if error == nil {
//                do{
//                    self.episodes = try JSONDecoder().decode(Episodes.self, from: data!).results
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
        return episodeViewModel.rowNumbers(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCell", for: indexPath) as!
        EpisodeCollectionViewCell
        
        let index = episodeViewModel.cellForRowAt(indexPath: indexPath)
        
        cell.nameLbl.text = index.name.capitalized
        cell.episodeNumber.text = index.episode.uppercased()
        cell.dateLbl.text = index.air_date.capitalized
        return cell
        
    }
    
   
}

