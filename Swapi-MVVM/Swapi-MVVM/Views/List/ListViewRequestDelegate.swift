//
//  ListViewRequestDelegate.swift
//  Swapi-MVVM
//
//  Created by Joshua Varghese on 10.01.23.
//

import Foundation

protocol ListViewRequestDelegate: AnyObject {

    func didUpdate(with state: ListViewState)

}
