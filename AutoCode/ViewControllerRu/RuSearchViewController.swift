//
//  RuSearchViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 09.11.2020.
//

import UIKit

class RuSearchViewController: UIViewController, UITextFieldDelegate {
    
    var modRu = ModelRuItems()
    
    @IBOutlet weak var labelRegionRuOutlet: UILabel!
    
    @IBOutlet weak var labelCodeRuOutlet: UILabel!
    
    @IBOutlet weak var editRuOutlet: UITextField!
    
    @IBAction func buttonSearchRuAction(_ sender: UIButton) {
        
        let textSearch = editRuOutlet.text
        var flagSearch = false
        
        for i in 0..<modRu.itemRu.count {
            let item = modRu.itemRu[i]
            if (item.codeRegion.hasPrefix(textSearch!)) || (item.codeRegion.hasSuffix(textSearch!)) || (item.nameRegion.lowercased().contains(textSearch!)) {
                labelRegionRuOutlet.text = item.nameRegion
                labelCodeRuOutlet.text = item.codeRegion
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
        self.editRuOutlet.delegate = self
    }
}
