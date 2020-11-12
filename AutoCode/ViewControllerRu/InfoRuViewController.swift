//
//  InfoRuViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 09.11.2020.
//

import UIKit

class InfoRuViewController: UIViewController {
    
    var infoTextRegionRu: String = ""
    var infoTextCodeRu: String = ""
    
    @IBOutlet weak var labelRegionRuOutlet: UILabel!
    
    @IBOutlet weak var labelCodeRuOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelRegionRuOutlet.text = infoTextRegionRu
        self.labelCodeRuOutlet.text = infoTextCodeRu
    }

}
