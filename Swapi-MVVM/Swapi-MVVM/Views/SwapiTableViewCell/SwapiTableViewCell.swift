//
//  SwapiTableViewCell.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 23.12.22.
//

import UIKit

class SwapiTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    static let IDENTIFIER = "SwapiTableViewCellIdentifier"

    private let SUBTITLE_FONT_SIZE = 13.0

    // MARK: - UIView -

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = UIColor.clear
        selectionStyle = .none

        configureSubviews()
    }

    // MARK: - Update -

    func update(withTitle title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }

    // MARK: - Configuration -

    private func configureSubviews() {
        titleLabel.backgroundColor = UIColor.clear
        subtitleLabel.backgroundColor = UIColor.clear

        titleLabel.textColor = UIColor.white
        subtitleLabel.textColor = UIColor.lightText

        subtitleLabel.font = UIFont(name: titleLabel.font.familyName, size: SUBTITLE_FONT_SIZE)
    }

}
