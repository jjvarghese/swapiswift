//
//  PeopleService.swift
//  Swapi-MVVM
//
//  Created by Joshua Varghese on 09.01.23.
//

import Foundation

struct SwapiService: SwapiServiceProtocol {

    private static let BASE_URL = "https://swapi.dev/api/"

    let session: URLSessionProtocol

    init(withSession session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    private func getData(url: URL, completion: @escaping (Data?, String?) -> Void) {
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data: Data?, _: URLResponse?, _: Error?) -> Void in
            guard let data = data else {
                completion(nil, request.url?.absoluteString)

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

    mutating func getPeople(from page: String? = nil, completion: @escaping (Array<Person>, String?) -> Void) {
        if let page = page {
            _url = URL(string: page)!
        }

        getData(url: url) { data, next in
            guard let data = data else {
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
