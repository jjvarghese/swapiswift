//
//  ListViewController.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 22.12.22.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!

    var people: [Person] = []

    // MARK: - UIViewController -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
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
            self?.activityIndicator.stopAnimating()
        }
    }

    // MARK: - Configuration -

    private func configureNavigation() {
        title = "Swapi - Classic MVC"

        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }

    private func configureSubviews() {
        configureTableViews()
    }

    private func configureTableViews() {
        tableView.register(UINib.init(nibName: "SwapiTableViewCell", bundle: nil), forCellReuseIdentifier: SwapiTableViewCell.IDENTIFIER)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
    }

}
