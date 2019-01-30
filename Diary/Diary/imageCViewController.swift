//
//  imageCViewController.swift
//  Diary
//
//  Created by pantea naderian on 1/30/19.
//  Copyright © 2019 pantea naderian. All rights reserved.
//

import UIKit

var myindex2 = 0

class imageCViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
   
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    let reuseIdentifier = "cell2"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let itemSize = UIScreen.main.bounds.width/3 - 3
       let layout = UICollectionViewFlowLayout()
       layout.sectionInset = UIEdgeInsetsMake(20, 0, 10, 0)
       layout.itemSize = CGSize(width: itemSize, height: itemSize)
       layout.minimumLineSpacing = 3
       layout.minimumInteritemSpacing = 3
       myCollectionView.collectionViewLayout = layout
    }
    
    
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return number_image.count
    }
    
    
   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath ) as! CollectionViewCell
        
        cell.imageCell2.image=number_image[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        myindex2 = indexPath.row
        performSegue(withIdentifier: "segue2", sender: self)
    }
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
