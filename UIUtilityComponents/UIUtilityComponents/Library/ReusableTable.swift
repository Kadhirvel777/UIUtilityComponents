//
//  ReuseTblView.swift
//  ReusableTableview
//
//  Created by Nagmani Singh on 17/08/22.
//

import UIKit

public class GenericDataSource: NSObject {

     var identifier = ""
     var arraycount = 0
     var delegate: GenericDataSourceDelegate?

func registerCells(forTableView tableView: UITableView) {
    tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
  }
}

// UITableViewDataSource
extension GenericDataSource: UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraycount
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.delegate?.loadCell(indexpath: indexPath, tableview: tableView){
            return cell
        }
        else{
            return UITableViewCell()
        }
    }

}
// UITableViewDelegate
extension GenericDataSource: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)      {

        }
}
public protocol GenericDataSourceDelegate: class {
            // Delegate callbacks methods
    func loadCell(indexpath: IndexPath, tableview: UITableView) -> UITableViewCell
}
