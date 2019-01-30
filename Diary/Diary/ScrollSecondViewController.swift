//
//  ScrollSecondViewController.swift
//  Diary
//
//  Created by pantea naderian on 1/29/19.
//  Copyright © 2019 pantea naderian. All rights reserved.
//

import UIKit

class ScrollSecondViewController: UIViewController {

    
    @IBOutlet weak var labelScript: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
  
        
        labelScript.text = number_text[myIndex]
    }


}
