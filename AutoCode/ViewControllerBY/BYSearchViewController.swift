//
//  BYSearchViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 10.11.2020.
//

import UIKit

class BYSearchViewController: UIViewController, UITextFieldDelegate {

    var modBy = ModelByItems()
    
    @IBOutlet weak var editSearchByOutlet: UITextField!
    
    @IBAction func buttonSearchAction(_ sender: UIButton) {
        
        let textSearch = editSearchByOutlet.text
        var flagSearch = false
        
        for i in 0..<modBy.itemBY.count {
            let item = modBy.itemBY[i]
            if (item.codeRegion.hasPrefix(textSearch!)) || (item.codeRegion.hasSuffix(textSearch!)) || (item.nameRegion.lowercased().contains(textSearch!)) {
                labelRegionByOutlet.text = item.nameRegion
                labelCodeByOutlet.text = item.codeRegion
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
    
    @IBOutlet weak var labelRegionByOutlet: UILabel!
    
    @IBOutlet weak var labelCodeByOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.editSearchByOutlet.delegate = self

    }

}
