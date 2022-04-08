//
//  Milestone_1Tests.swift
//  Milestone 1Tests
//
//  Created by Duwon Ha on 18/3/2022.
//

import XCTest
@testable import Milestone_1

class Milestone_1Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCheckList() throws {
        let checklist = CheckList(title: "Duwon")
        XCTAssertEqual(checklist.title, "Duwon")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
