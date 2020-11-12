//
//  InfoByViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 10.11.2020.
//

import UIKit

class InfoByViewController: UIViewController {

    var infoTextRegionBy: String = ""
    var infoTextCodeBy: String = ""
    
    @IBOutlet weak var labelRegionByOutlet: UILabel!
    
    @IBOutlet weak var labelCodeByOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelRegionByOutlet.text = infoTextRegionBy
        self.labelCodeByOutlet.text = infoTextCodeBy
    }

}
