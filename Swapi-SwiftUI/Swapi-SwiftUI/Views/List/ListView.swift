//
//  ListView.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 28.12.22.
//

import Foundation
import UIKit

class ListView: UIView, ListViewProtocol {

    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!

    var controller: ListViewController?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        Bundle.main.loadNibNamed("ListView", owner: self, options: nil)

        addSubview(listView)
    }

    func setController(controller: ListViewController) {
        self.controller = controller

        configureTableView()
    }

    func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.activityIndicator.stopAnimating()
        }
    }

    private func configureTableView() {
        tableView.register(UINib.init(nibName: "SwapiTableViewCell", bundle: nil), forCellReuseIdentifier: SwapiTableViewCell.IDENTIFIER)
        tableView.register(UINib.init(nibName: "LoadingTableViewCell", bundle: nil), forCellReuseIdentifier: LoadingTableViewCell.IDENTIFIER)
        tableView.dataSource = controller
        tableView.delegate = controller
        tableView.separatorStyle = .none
    }

}
