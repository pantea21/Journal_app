//
//  ScrollFirstViewController.swift
//  Diary
//
//  Created by pantea naderian on 1/29/19.
//  Copyright © 2019 pantea naderian. All rights reserved.
//

import UIKit

class ScrollFirstViewController: UIViewController {

    @IBOutlet weak var imagefirst: UIImageView!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        titlelabel.text = subjects[myIndex]
        imagefirst.image = number_image[myIndex]
       
        

    }
    
        @IBAction func changeFavorite(_ sender: UIButton) {
        
    }
    
}
