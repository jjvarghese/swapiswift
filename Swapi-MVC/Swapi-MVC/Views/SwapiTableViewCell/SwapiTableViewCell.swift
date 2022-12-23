//
//  SwapiTableViewCell.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 23.12.22.
//

import UIKit

class SwapiTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    static let IDENTIFIER = "SwapiTableViewCellIdentifier"

    // MARK: - UIView -

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor.clear

        configureSubviews()
    }

    // MARK: - Update -

    func update(withTitle title: String) {
        titleLabel.text = title
    }

    // MARK: - Configuration -

    private func configureSubviews() {
        titleLabel.textColor = UIColor.white
    }

}
