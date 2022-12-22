//
//  ListViewController.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 22.12.22.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DataProvider.getPeople { people in
            print(people)
        }
    }

}
