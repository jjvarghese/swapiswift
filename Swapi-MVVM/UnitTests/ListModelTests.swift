//
//  ListModelTests.swift
//  UnitTests
//
//  Created by Joshua Varghese on 03.01.23.
//

import XCTest

final class ListModelTests: XCTestCase {

    let mockedPeople = [Person(url: "testUrl",
                               name: "testName",
                               height: "testHeight",
                               hairColor: "testHairColor",
                               skinColor: "testSkinColor",
                               eyeColor: "testEyeColor",
                               gender: "testGender"),
                        Person(url: "testUrl2",
                               name: "testName2",
                               height: "testHeight2",
                               hairColor: "testHairColor2",
                               skinColor: "testSkinColor2",
                               eyeColor: "testEyeColor2",
                               gender: "testGender2"),
                        Person(url: "testUrl3",
                               name: "testName3",
                               height: "testHeight3",
                               hairColor: "testHairColor3",
                               skinColor: "testSkinColor3",
                               eyeColor: "testEyeColor3",
                               gender: "testGender3")]

    func testPeopleArePopulatedCorrectly() throws {
        let mockedDataProvider = MockedSwapiService(withMockedPeople: mockedPeople)
        let listModel = ListModel(withDataProvider: mockedDataProvider)

        listModel.loadData { [weak self] in
            XCTAssertEqual(listModel.people, self?.mockedPeople)
        }
    }

    func testNextPageIsSetCorrectly() throws {
        let mockedNextPageUrl = "https://mocked.next.page.url"
        let mockedDataProvider = MockedSwapiService(withMockedPeople: mockedPeople,
                                                    mockedNextPageUrl: mockedNextPageUrl)
        let listModel = ListModel(withDataProvider: mockedDataProvider)

        listModel.loadData {
            XCTAssertEqual(listModel.nextPage, mockedNextPageUrl)
        }
    }

}
