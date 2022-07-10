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
    /// <#description#>
    /// Making a CheckList model
    func testCheckList() throws {
        let checklist = CheckList(title: "Duwon")
        XCTAssertEqual(checklist.title, "Duwon")
    }
    
    /// <#description#>
    /// Making a CheckList viewModel
    func testCheckListViewModel() throws {
        let checklist = CheckListViewModel(checklist: CheckList(title: "Duwon"))
        XCTAssertEqual(checklist.checklist.title, "Duwon")
    }
    
    /// <#description#>
    /// adding checklist to the CheckListViewModel
    func testAddingCheckList() throws {
        var checklist = [CheckListViewModel]()
        checklist.append(CheckListViewModel(checklist: CheckList(title: "Checklist 1")))
        XCTAssertEqual(checklist[0].checklist.title, "Checklist 1")
       
    }

    /// <#description#>
    /// adding subList to the Checklist
    func testAddFunc() throws {
        let checklist = CheckListViewModel(checklist: CheckList(title: "Duwon"))
        checklist.addList(name: "Game")
        XCTAssertEqual(checklist.checklist.subList[0], "Game")
    }
    
    /// <#description#>
    /// deleting the subList from the Checklist (it get the position of the element)
    func testDeleteFunc() throws {
        let checklist = CheckListViewModel(checklist: CheckList(title: "Duwon"))
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        /// should delete 'Video'
        checklist.deleteList(position: 1)
        /// so the index 1 should be Nexflix
        XCTAssertEqual(checklist.checklist.subList[1], "Netflix")
    }
    
    /// <#description#>
    /// when you are adding the subList to the Checklist, it will automatically generate put false element to the tickList
    /// if you press the element in the CheckListDetailView, it will change false to true.
    func testTickFunc() throws{
        let checklist = CheckListViewModel(checklist: CheckList(title: "Duwon"))
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        checklist.tick(position: 0)
        XCTAssertEqual(checklist.tickList[0],true)
    }
    
    /// <#description#>
    ///This function is basically return the TickList
    func testReturnTickListFunc() throws {
        let checklist = CheckListViewModel(checklist: CheckList(title: "Duwon"))
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        /// TickList[0] and [2] will turned into true which is ticked
        checklist.tick(position: 0)
        checklist.tick(position: 2)
        /// returnTickList function will return the current TickList (it will be used for Undo function)
        let returnedTickList = checklist.returnTickList()
        XCTAssertEqual(returnedTickList, checklist.tickList)
    }
    
    /// <#description#>
    /// This Function will reset the TickList (unticked)
    func testRemoveTitckListFunc() throws {
        let checklist = CheckListViewModel(checklist: CheckList(title: "Duwon"))
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        /// TickList[0] and [2] will turned into true which is ticked
        checklist.tick(position: 0)
        checklist.tick(position: 2)
        /// then all the tickList element should be now turned to false (unticked)
        ///Also it will store the cunnrent TickList to previousTIcklist for Undo Function
        checklist.previousTickList = checklist.returnTickList()
        checklist.removeTickList()
        XCTAssertEqual(checklist.tickList[0], false)
    }
    
    /// <#description#>
    /// Undo function
    func testUndoTickListFunc () throws{
        let checklist = CheckListViewModel(checklist: CheckList(title: "Duwon"))
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        /// TickList[0] and [2] will turned into true which is ticked
        checklist.tick(position: 0)
        checklist.tick(position: 2)
        /// then all the tickList element should be now turned to false (unticked)
        /// Also it will store the cunnrent TickList to previousTIcklist for Undo Function
        checklist.previousTickList = checklist.returnTickList()
        checklist.removeTickList()
        /// it get the previousOne(Previous tickedList) so it will basically undo
        checklist.updateUndo(previousOne: checklist.previousTickList)
        XCTAssertEqual(checklist.tickList[0], true)
    }
    
    func testMovesubListFunc () throws{
        let checklist = CheckListViewModel(checklist: CheckList(title: "Duwon"))
        checklist.addList(name: "Game")
        checklist.addList(name: "Video")
        checklist.addList(name: "Netflix")
        /// Game(index 0) will be moved to index 2
        /// so Video, Netflix then Game
        checklist.moveIndex(from: 0, to: 2)
        /// so the checklist[0] should be Video now
        XCTAssertEqual(checklist.checklist.subList[0], "Video")
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
