//
//  KzSearchViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 10.11.2020.
//

import UIKit

class KzSearchViewController: UIViewController, UISearchTextFieldDelegate {
    
    var modKz = ModelKzItems()

    @IBOutlet weak var editSearchKzOutlet: UITextField!
    
    @IBOutlet weak var labelRegionKzOutlet: UILabel!
    
    @IBOutlet weak var labelCodeKzOutlet: UILabel!
    
    @IBAction func buttonSearchKzAction(_ sender: UIButton) {
        
        let textSearch = editSearchKzOutlet.text
        var flagSearch = false
        
        for i in 0..<modKz.itemKz.count {
            let item = modKz.itemKz[i]
            if (item.codeRegion.hasPrefix(textSearch!)) || (item.codeRegion.hasSuffix(textSearch!)) || (item.nameRegion.lowercased().contains(textSearch!)) {
                labelRegionKzOutlet.text = item.nameRegion
                labelCodeKzOutlet.text = item.codeRegion
                if !flagSearch {
                    flagSearch = true
                }
            }
        }
        
        
        if !flagSearch {
            let message = "No item"
            let alert = UIAlertController(title: "AutoCode", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    //  Прячем клавиатуру с экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editSearchKzOutlet.delegate = self

    }

}
