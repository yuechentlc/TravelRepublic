//
//  TravelRepublicAppTests.swift
//  TravelRepublicAppTests
//
//  Created by Yue Chen on 16/11/10.
//  Copyright © 2016年 Yue Chen. All rights reserved.
//

import XCTest
@testable import TravelRepublicApp

class TravelRepublicAppTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here.
        super.tearDown()
    }
    
    func testDataParser () {
        let filePath = Bundle.main.path(forResource: "testData", ofType: "json")
        if let data = NSData(contentsOfFile: filePath!) {
            let holidayDeals = DataParser.parseHolidayDealsWithJsonData(data: data as Data)
            XCTAssert(holidayDeals.count == 9)
            XCTAssert(holidayDeals[0].position == 0)
            XCTAssert(holidayDeals[0].title == "Canary Islands")
            XCTAssert(holidayDeals[0].minPrice == 329.96)
            
            XCTAssert(holidayDeals[1].position == 1)
            XCTAssert(holidayDeals[1].title == "Majorca, Ibiza & Menorca")
            XCTAssert(holidayDeals[1].minPrice == 285.6316)
            
            XCTAssert(holidayDeals[2].position == 2)
            XCTAssert(holidayDeals[2].title == "Mainland Spain")
            
            XCTAssert(holidayDeals[3].position == 3)
            XCTAssert(holidayDeals[3].title == "Portugal & Algarve")
            XCTAssert(holidayDeals[3].count == 5)
            
            XCTAssert(holidayDeals[4].position == 8)
            XCTAssert(holidayDeals[4].title == "Malta")
            
            XCTAssert(holidayDeals[5].position == 12)
            XCTAssert(holidayDeals[5].title == "Morocco")
            
            XCTAssert(holidayDeals[6].position == 16)
            XCTAssert(holidayDeals[6].title == "Caribbean")
            
            XCTAssert(holidayDeals[7].position == 17)
            XCTAssert(holidayDeals[7].title == "Mexico")
        
            XCTAssert(holidayDeals[8].position == 18)
            XCTAssert(holidayDeals[8].title == "Cape Verde Islands")
            XCTAssert(holidayDeals[8].type == "4")
            XCTAssert(holidayDeals[8].id == "5763")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
