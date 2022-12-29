//
//  DetailViewProtocol.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 29.12.22.
//

import Foundation
import UIKit

protocol DetailViewProtocol {

    var controller: DetailViewController? { get }

    func setController(controller: DetailViewController)

    func configureDetails(detailOne: String?,
                          detailTwo: String?,
                          detailThree: String?,
                          detailFour: String?)

}
