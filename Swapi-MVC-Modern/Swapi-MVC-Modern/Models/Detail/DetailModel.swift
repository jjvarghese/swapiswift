//
//  DetailModel.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 29.12.22.
//

import Foundation

class DetailModel: DetailModelProtocol {

    var title: String
    var detailOne: String?
    var detailTwo: String?
    var detailThree: String?
    var detailFour: String?

    required init(withTitle title: String,
                  detailOne: String?,
                  detailTwo: String?,
                  detailThree: String?,
                  detailFour: String?) {
        self.title = title
        self.detailOne = detailOne
        self.detailTwo = detailTwo
        self.detailThree = detailThree
        self.detailFour = detailFour
    }

}
