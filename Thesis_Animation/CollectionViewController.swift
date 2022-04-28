//
//  CollectionViewController.swift
//  Thesis_Animation
//
//  Created by Emre Dogan on 28/04/2022.
//

import UIKit

class CollectionViewController: UIViewController {
    
    let labelArray = [UILabel]()
    
    @IBOutlet weak var titleLabelView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setBackgroundColor()

       
    }
    
    func setBackgroundColor() {
        collectionView.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        titleLabelView.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
        mainView.backgroundColor = UIColor(red: 145/255, green: 203/255, blue: 250/255, alpha: 1.0)
    }
      
    


}

  

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movie_cell", for: indexPath) as! CollectionViewCell
        cell.cellLabel.text = "EMRE"
        cell.cellLabel.backgroundColor = UIColor.blue
            
        return cell
    }
    
    
}
