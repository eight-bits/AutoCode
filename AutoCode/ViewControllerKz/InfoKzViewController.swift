//
//  InfoKzViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 11.11.2020.
//

import UIKit

class InfoKzViewController: UIViewController {
    
    var infoTextRegionKZ: String = ""
    var infoTextCodeKZ: String = ""
    
    @IBOutlet weak var labelRegionKzOutlet: UILabel!
    
    @IBOutlet weak var labelCodeKzOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelRegionKzOutlet.text = infoTextRegionKZ
        self.labelCodeKzOutlet.text = infoTextCodeKZ
    }

}
