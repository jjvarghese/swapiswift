//
//  ListViewController.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 22.12.22.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var people: [Person] = []

    // MARK: - UIViewController -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSubviews()

        loadData()
    }

    // MARK: - Data -

    private func loadData() {
        DataProvider.getPeople { [weak self] people in
            self?.people = people

            self?.updateUI()
        }
    }

    private func updateUI() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - Configuration -

    private func configureSubviews() {
        configureTableViews()
    }

    private func configureTableViews() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}
