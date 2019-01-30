//
//  showImageViewController.swift
//  Diary
//
//  Created by pantea naderian on 1/30/19.
//  Copyright © 2019 pantea naderian. All rights reserved.
//

import UIKit

class showImageViewController: UIViewController {

    @IBOutlet weak var showImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        showImage.image=number_image[myindex2]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
