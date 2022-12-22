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

    private static func getData(url: URL, completion: @escaping (Data?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, _: URLResponse?, _: Error?) -> Void in
            guard let data = data else {
                completion(nil)

                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    guard let results = json["results"] as? [[String: Any]] else {
                        completion(nil)

                        return
                    }

                    do {
                        let serialisedResults = try JSONSerialization.data(withJSONObject: results)

                        completion(serialisedResults)
                    } catch {
                        completion(nil)

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

    static func getPeople(completion: @escaping (Array<Person>) -> Void) {
        let url = URL(string: BASE_URL + "people")!

        getData(url: url) { data in
            guard let data = data else {
                completion([])

                return
            }

            do {
                let decoder = JSONDecoder()

                let people = try decoder.decode([Person].self, from: data)

                completion(people)
            } catch {
                print(error)
            }
        }
    }

}
