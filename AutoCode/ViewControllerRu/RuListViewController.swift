//
//  RuListViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 09.11.2020.
//

import UIKit

class RuListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectName: String = ""
    var selectCode: String = ""
    
    var modRu = ModelRuItems()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        modRu.itemRu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableViewRu.dequeueReusableCell(withIdentifier: "idCell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "idCell")
        }
        let item = modRu.itemRu[indexPath.row]
        cell?.textLabel?.text = item.nameRegion
        cell?.detailTextLabel?.text = item.codeRegion
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectItem = modRu.itemRu[indexPath.row]
        selectName = selectItem.nameRegion
        selectCode = selectItem.codeRegion
        performSegue(withIdentifier: "segueRuInfo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueRuInfo" else { return }
        guard let vc = segue.destination as? InfoRuViewController else { return }
        vc.infoTextRegionRu = selectName
        vc.infoTextCodeRu = selectCode
    }
    
    @IBOutlet weak var tableViewRu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewRu.dataSource = self
        self.tableViewRu.delegate = self
    }
}
