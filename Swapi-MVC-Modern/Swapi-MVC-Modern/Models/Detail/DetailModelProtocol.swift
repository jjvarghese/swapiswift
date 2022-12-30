//
//  DetailModelProtocol.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 29.12.22.
//

import Foundation

protocol DetailModelProtocol {

    var title: String { get }
    var detailOne: String? { get }
    var detailTwo: String? { get }
    var detailThree: String? { get }
    var detailFour: String? { get }

    init(withTitle title: String,
         detailOne: String?,
         detailTwo: String?,
         detailThree: String?,
         detailFour: String?)

}
