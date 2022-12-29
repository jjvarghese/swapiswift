//
//  DetailView.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 29.12.22.
//

import Foundation
import UIKit

final class DetailView: UIView, DetailViewProtocol {

    @IBOutlet private weak var detailView: UIView!
    @IBOutlet private weak var detailLabelOne: UILabel!
    @IBOutlet private weak var detailLabelTwo: UILabel!
    @IBOutlet private weak var detailLabelThree: UILabel!
    @IBOutlet private weak var detailLabelFour: UILabel!

    private var detailOne: String?
    private var detailTwo: String?
    private var detailThree: String?
    private var detailFour: String?

    var controller: DetailViewController?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        Bundle.main.loadNibNamed("DetailView", owner: self, options: nil)

        addSubview(detailView)
    }

    func setController(controller: DetailViewController) {
        self.controller = controller
    }

    func configureDetails(detailOne: String?,
                          detailTwo: String?,
                          detailThree: String?,
                          detailFour: String?) {
        self.detailOne = detailOne
        self.detailTwo = detailTwo
        self.detailThree = detailThree
        self.detailFour = detailFour

        configureLabels()
    }

    // MARK: - Private -

    private func configure(detailLabel: UILabel, withText text: String?) {
        if let text = text {
            detailLabel.text = text
        } else {
            detailLabel.isHidden = true
        }

        detailLabel.textColor = UIColor.white
    }

    private func configureLabels() {
        configure(detailLabel: detailLabelOne, withText: detailOne)
        configure(detailLabel: detailLabelTwo, withText: detailTwo)
        configure(detailLabel: detailLabelThree, withText: detailThree)
        configure(detailLabel: detailLabelFour, withText: detailFour)
    }
}
