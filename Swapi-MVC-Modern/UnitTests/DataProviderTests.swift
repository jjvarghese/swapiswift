//
//  DataProvider.swift
//  UnitTests
//
//  Created by Joshua Varghese on 03.01.23.
//

import XCTest

final class DataProviderTests: XCTestCase {

    let mockedSession = MockedURLSession()

    func testInitialUrl() {
        let mockedDataProvider = DataProvider(withSession: mockedSession)
        let expectedInitialUrl = "https://swapi.dev/api/people"

        XCTAssertEqual(mockedDataProvider.url.absoluteString, expectedInitialUrl)
    }

    func testMutatingUrl() {
        var mockedDataProvider = DataProvider(withSession: mockedSession)
        let expectedMutatedUrl = "https://test.page.2.url"

        mockedDataProvider.getPeople(from: expectedMutatedUrl) { _, newUrl in
            XCTAssertEqual(mockedDataProvider.url.absoluteString, newUrl)
        }
    }

}
