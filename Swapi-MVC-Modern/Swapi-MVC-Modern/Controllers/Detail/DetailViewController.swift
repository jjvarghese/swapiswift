//
//  DetailViewController.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 23.12.22.
//

import UIKit

class DetailViewController: UIViewController {

    var detailModel: DetailModelProtocol?
    var detailView: DetailViewProtocol?

    func setDetailModel(_ model: DetailModelProtocol) {
        detailModel = model
    }

    private func setDetailView(_ view: DetailViewProtocol) {
        detailView = view
        detailView?.setController(controller: self)
    }

    // MARK: - UIViewController -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureNavigation()
    }

    // MARK: - Configuration -

    private func configureView() {
        if let mainView = view as? DetailViewProtocol {
            if detailView == nil {
                setDetailView(mainView)
            }
        }

        detailView?.configureDetails(detailOne: detailModel?.detailOne,
                                     detailTwo: detailModel?.detailTwo,
                                     detailThree: detailModel?.detailThree,
                                     detailFour: detailModel?.detailFour)
    }

    private func configureNavigation() {
        title = detailModel?.title

        navigationController?.navigationBar.tintColor = .white
    }

}
