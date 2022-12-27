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

    private static func getData(url: URL, completion: @escaping (Data?, String?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, _: URLResponse?, _: Error?) -> Void in
            guard let data = data else {
                completion(nil, nil)

                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    guard let results = json["results"] as? [[String: Any]], let next = json["next"] as? String else {
                        completion(nil, nil)

                        return
                    }

                    do {
                        let serialisedResults = try JSONSerialization.data(withJSONObject: results)

                        completion(serialisedResults, next)
                    } catch {
                        completion(nil, nil)

                        print(error)
                    }
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }

    // MARK: - Public API Calls -

    static func getPeople(from page: String? = nil, completion: @escaping (Array<Person>, String?) -> Void) {
        let url: URL

        if let page = page {
            url = URL(string: page)!
        } else {
            url = URL(string: BASE_URL + "people")!
        }

        getData(url: url) { data, next in
            guard let data = data else {
                completion([], nil)

                return
            }

            do {
                let decoder = JSONDecoder()

                let people = try decoder.decode([Person].self, from: data)

                completion(people, next)
            } catch {
                print(error)
            }
        }
    }

}
