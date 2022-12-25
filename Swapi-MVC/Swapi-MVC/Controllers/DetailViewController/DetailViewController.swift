//
//  DetailViewController.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 23.12.22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailLabelOne: UILabel!

    @IBOutlet weak var detailLabelTwo: UILabel!

    @IBOutlet weak var detailLabelThree: UILabel!

    @IBOutlet weak var detailLabelFour: UILabel!

    var detailOne: String?
    var detailTwo: String?
    var detailThree: String?
    var detailFour: String?

    // MARK: - Init -

    init(withTitle title: String,
         detailOne: String?,
         detailTwo: String?,
         detailThree: String?,
         detailFour: String?) {
        super.init(nibName: String(describing: DetailViewController.self), bundle: nil)

        self.title = title

        navigationController?.navigationBar.tintColor = .white

        self.detailOne = detailOne
        self.detailTwo = detailTwo
        self.detailThree = detailThree
        self.detailFour = detailFour
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - UIViewController -

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSubviews()
    }

    // MARK: - Configuration -

    private func configureSubviews() {
        configureLabels()
    }

    private func configureLabels() {
        configure(detailLabel: detailLabelOne, withText: detailOne)
        configure(detailLabel: detailLabelTwo, withText: detailTwo)
        configure(detailLabel: detailLabelThree, withText: detailThree)
        configure(detailLabel: detailLabelFour, withText: detailFour)
    }

    private func configure(detailLabel: UILabel, withText text: String?) {
        if let text = text {
            detailLabel.text = text
        } else {
            detailLabel.isHidden = true
        }

        detailLabel.textColor = UIColor.white
    }

}
