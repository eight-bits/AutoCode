//
//  BYListViewController.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 10.11.2020.
//

import UIKit

class BYListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var selectName: String = ""
    var selectRegion: String = ""
    
    var modBy = ModelByItems()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modBy.itemBY.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableViewBY.dequeueReusableCell(withIdentifier: "idCellBY")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "idCellBY")
        }
        let item = modBy.itemBY[indexPath.row]
        cell?.textLabel?.text = item.nameRegion
        cell?.detailTextLabel?.text = item.codeRegion
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectItem = modBy.itemBY[indexPath.row]
        selectName = selectItem.nameRegion
        selectRegion = selectItem.codeRegion
        performSegue(withIdentifier: "segueByInfo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "segueByInfo" else { return }
        guard let vc = segue.destination as? InfoByViewController else { return }
        vc.infoTextRegionBy = selectName
        vc.infoTextCodeBy = selectRegion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewBY.dataSource = self
        self.tableViewBY.delegate = self

    }

    @IBOutlet weak var tableViewBY: UITableView!
}
