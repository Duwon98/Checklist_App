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
        // Making a CheckList model
        let checklist = CheckList(title: "Duwon")
        XCTAssertEqual(checklist.title, "Duwon")
    }
    
    func testAddFunc() throws {
        // adding element to the list
        let checklist = CheckList(title: "Duwon")
        checklist.addList(name: "Game")
        XCTAssertEqual(checklist.lists[0], "Game")
    }
    
    func testDeleteFunc() throws {
        // deleting the element from the list (it get the position of the element)
        let checklist = CheckList(title: "Duwon")
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        checklist.deleteList(position: 1) // should delete 'Video' element
        XCTAssertEqual(checklist.lists[1], "Netflix") // so the index 1 should be Nexflix
    }
    
    func testTickFunc() throws{
        // when you are adding the element to the list, it will automatically generate put false element to the tickList
        let checklist = CheckList(title: "Duwon")
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        checklist.tick(position: 0)
        // if you press the element in the CheckListDetailView, it will change false to true.
        XCTAssertEqual(checklist.tickList[0],true)
    }
    
    func testReturnTickList() throws {
        //This function is basically return the TickList
        let checklist = CheckList(title: "Duwon")
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        checklist.tick(position: 0)
        checklist.tick(position: 2)
        // returnTickList function will return the current TickList (it will be used for Undo function)
        let returnedTickList = checklist.returnTickList()
        XCTAssertEqual(returnedTickList, checklist.tickList)
    }
    
    func testRemoveTitckList() throws {
        // This Function will reset the TickList (unticked)
        let checklist = CheckList(title: "Duwon")
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        // TickList[0] and [2] will turned into true which is ticked
        checklist.tick(position: 0)
        checklist.tick(position: 2)
        // then all the tickList element should be now turned to false (unticked)
        //Also it will store the cunnrent TickList to previousTIcklist for Undo Function
        checklist.previousTickList = checklist.returnTickList()
        checklist.removeTickList()
        XCTAssertEqual(checklist.tickList[0], false)
    }
    
    func testUndoTickList () throws{
        let checklist = CheckList(title: "Duwon")
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        // TickList[0] and [2] will turned into true which is ticked
        checklist.tick(position: 0)
        checklist.tick(position: 2)
        XCTAssertEqual(checklist.tickList[0], true)
        // then all the tickList element should be now turned to false (unticked)
        //Also it will store the cunnrent TickList to previousTIcklist for Undo Function
        checklist.previousTickList = checklist.returnTickList()
        checklist.removeTickList()
        XCTAssertEqual(checklist.tickList[0], false)
        // it get the previousOne(Previous tickedList) so it will basically undo
        checklist.updateUndo(previousOne: checklist.previousTickList)
        XCTAssertEqual(checklist.tickList[0], true)
    }
    
    
    
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
