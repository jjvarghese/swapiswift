//
//  Person.swift
//  Swapi-MVC
//
//  Created by Joshua Varghese on 22.12.22.
//

import Foundation

struct Person: Decodable, Equatable {
    let url: String
    let name: String
    let height: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let gender: String

    enum CodingKeys: String, CodingKey {
        case url
        case name
        case height
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case gender
    }

    init(url: String,
         name: String,
         height: String,
         hairColor: String,
         skinColor: String,
         eyeColor: String,
         gender: String) {
        self.url = url
        self.name = name
        self.height = height
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.gender = gender
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.url = try container.decode(String.self, forKey: .url)
        self.name = try container.decode(String.self, forKey: .name)
        self.height = try container.decode(String.self, forKey: .height)
        self.hairColor = try container.decode(String.self, forKey: .hairColor)
        self.skinColor = try container.decode(String.self, forKey: .skinColor)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.gender = try container.decode(String.self, forKey: .gender)
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return
            lhs.url == rhs.url &&
            lhs.name == rhs.name &&
            lhs.name == rhs.name &&
            lhs.height == rhs.height &&
            lhs.hairColor == rhs.hairColor &&
            lhs.skinColor == rhs.skinColor &&
            lhs.eyeColor == rhs.eyeColor &&
            lhs.gender == rhs.gender
    }

}
