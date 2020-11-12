//
//  KzListViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 10.11.2020.
//

import UIKit

var selectName: String  = ""
var selectCode: String  = ""

var modKz = ModelKzItems()

class KzListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modKz.itemKz.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "idCellKz")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "idCellKz")
        }
        let item = modKz.itemKz[indexPath.row]
        cell?.textLabel?.text = item.nameRegion
        cell?.detailTextLabel?.text = item.codeRegion
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectItem = modKz.itemKz[indexPath.row]
        selectName = selectItem.nameRegion
        selectCode = selectItem.codeRegion
        performSegue(withIdentifier: "segueKzInfo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueKzInfo" else { return }
        guard let vc = segue.destination as? InfoKzViewController else { return }
        vc.infoTextRegionKZ = selectName
        vc.infoTextCodeKZ = selectCode
    }
    
    @IBOutlet weak var tableViewKz: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewKz.dataSource = self
        self.tableViewKz.delegate = self
    }

}
