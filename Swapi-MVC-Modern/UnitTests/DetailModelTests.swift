//
//  DetailModelTests.swift
//  UnitTests
//
//  Created by Joshua Varghese on 03.01.23.
//

import XCTest

final class DetailModelTests: XCTestCase {

    func testConstructedCorrectly() throws {
        let testTitle = "testTitle"
        let testDetailOne = "testDetailOne"
        let testDetailTwo = "testDetailTwo"
        let testDetailThree = "testDetailThree"
        let testDetailFour = "testDetailFour"

        let detailModel = DetailModel(withTitle: testTitle,
                                      detailOne: testDetailOne,
                                      detailTwo: testDetailTwo,
                                      detailThree: testDetailThree,
                                      detailFour: testDetailFour)

        XCTAssertEqual(detailModel.title, testTitle)
        XCTAssertEqual(detailModel.detailOne, testDetailOne)
        XCTAssertEqual(detailModel.detailTwo, testDetailTwo)
        XCTAssertEqual(detailModel.detailThree, testDetailThree)
        XCTAssertEqual(detailModel.detailFour, testDetailFour)
    }

}
