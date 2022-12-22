//
//  DataProvider.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 22.12.22.
//

import Foundation

private let BASE_URL = "https://swapi.dev/api/"

struct DataProvider {

    // MARK: - Private -

    private static func getData(url: URL, completion: @escaping (Array<Any>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, _: URLResponse?, _: Error?) -> Void in
            guard let data = data else {
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    guard let results = json["results"] as? [Any] else {
                        completion([])

                        return
                    }

                    completion(results)
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }

    // MARK: - Public API Calls -

    static func getPeople(completion: @escaping (Array<Any>) -> Void) {
        let url = URL(string: BASE_URL + "people")!

        getData(url: url, completion: completion)

    }

}
