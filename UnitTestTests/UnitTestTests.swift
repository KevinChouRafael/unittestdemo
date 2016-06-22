//
//  UnitTestTests.swift
//  UnitTestTests
//
//  Created by rafael on 6/14/16.
//  Copyright © 2016 kevin. All rights reserved.
//

import XCTest
@testable import UnitTest

class UnitTestTests: XCTestCase {
    
    var firstVC:FirstViewController!
    var times:Int = 0
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        firstVC = storyboard.instantiateViewControllerWithIdentifier("FirstViewControllerIdentifier") as! FirstViewController
        times = times + 1
        
        XCTAssert(times == 1)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let sum = firstVC.sumFunction(1, b: 2)
        XCTAssert(sum == 3)
    
    }
    
    func testMultily2(){
        let sum = firstVC.multiplyBy(2)
        XCTAssertEqual(sum, 0)
    }
    func testMultily10(){
        let sum = firstVC.multiplyBy(10)
        XCTAssertEqual(sum, 0)
    }
    
    func testPerformanceExample() {
        

//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { 
            // This is an example of a performance test case.
            self.measureBlock {
                // Put the code you want to measure the time of here.
                var sum:Double = 0
                for i in 1 ... 1000000 {
                    sum += Double(i)
                }
            }
            
//            dispatch_sync(dispatch_get_main_queue(), { 
//                
//            })
//        }

    }
        
    func testAsy(){
        let url = "www.baidu.com"
        let expectation = expectationWithDescription("访问百度成功")
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(NSURL(string: url)!) { (data, response, error) in
            
            expectation.fulfill()
            
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            
            if let httpResponse = response as! NSHTTPURLResponse! {
                XCTAssertEqual(httpResponse.URL!.absoluteString , url )
                XCTAssertEqual(httpResponse.statusCode, 200)
            }else{
                XCTFail("失败")
            }
            
        }
        
        task.resume()
        
        waitForExpectationsWithTimeout(0.01) { (error) in
            task.cancel()
        }
    }
    
}
