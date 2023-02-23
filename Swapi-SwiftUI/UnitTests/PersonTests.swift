//
//  PersonTests.swift
//  Swapi-MVC-Modern
//
//  Created by Joshua Varghese on 03.01.23.
//

import XCTest

final class PersonTests: XCTestCase {

    let urlValue = "urlValue"
    let nameValue = "nameValue"
    let heightValue = "heightValue"
    let hairColorValue = "hairColorValue"
    let skinColorValue = "skinColorValue"
    let eyeColorValue = "eyeColorValue"
    let genderValue = "genderValue"

    func testDecodedProperly() throws {
        let expectedPerson = Person(url: urlValue,
                                    name: nameValue,
                                    height: heightValue,
                                    hairColor: hairColorValue,
                                    skinColor: skinColorValue,
                                    eyeColor: eyeColorValue,
                                    gender: genderValue)
        let dictionary = ["url": urlValue,
                          "name": nameValue,
                          "height": heightValue,
                          "hair_color": hairColorValue,
                          "skin_color": skinColorValue,
                          "eye_color": eyeColorValue,
                          "gender": genderValue]
        do {
            let serializedObject = try JSONSerialization.data(withJSONObject: dictionary)
            let decoder = JSONDecoder()
            let person = try decoder.decode(Person.self, from: serializedObject)

            XCTAssertEqual(person, expectedPerson)
        } catch {
            XCTFail("could not serialize and/or decode object!")
        }

    }
}
