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

    private func getData(url: URL, session: URLSessionProtocol, completion: @escaping (Data?, String?) -> Void) {
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data: Data?, _: URLResponse?, _: Error?) -> Void in
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

    var url: URL {
        return _url
    }

    private var _url: URL = URL(string: BASE_URL + "people")!

    mutating func getPeople(from page: String? = nil, session: URLSessionProtocol = URLSession.shared, completion: @escaping (Array<Person>, String?) -> Void) {
        if let page = page {
            _url = URL(string: page)!
        }

        getData(url: url, session: session) { data, next in
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
