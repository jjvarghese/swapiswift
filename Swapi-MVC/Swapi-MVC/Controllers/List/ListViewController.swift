//
//  ListViewController.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 22.12.22.
//

import UIKit

class ListViewController: UIViewController {

    var listModel: ListModelProtocol?
    var listView: ListViewProtocol?

    func setListModel(_ model: ListModelProtocol) {
        listModel = model

        listModel?.loadData(completion: { [weak self] in
            self?.listView?.updateUI()
        })
    }

    func setListView(_ view: ListViewProtocol) {
        listView = view
        listView?.setController(controller: self)
    }

    // MARK: - UIViewController -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureModel()
        configureNavigation()
    }

    // MARK: - Configuration -

    fileprivate func configureView() {
        if let mainView = view as? ListViewProtocol {
            if listView == nil {
                setListView(mainView)
            }
        }
    }

    fileprivate func configureModel() {
        if listModel == nil {
            setListModel(ListModel())
        }
    }

    fileprivate func configureNavigation() {
        title = "Swapi - Classic MVC"

        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
    }

}
