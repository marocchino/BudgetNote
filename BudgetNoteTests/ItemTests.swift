//
//  ItemTests.swift
//  BudgetNote
//
//  Created by Shim Won on 6/13/15.
//  Copyright © 2015 Shim. All rights reserved.
//

import XCTest
import CoreData
@testable import BudgetNote

class ItemTests: XCTestCase {
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectModel = NSManagedObjectModel.mergedModelFromBundles([NSBundle.mainBundle()])!
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSInMemoryStoreType, configuration: nil, URL: nil, options: nil)
        } catch {
        }
        
        let managedObjectContext = NSManagedObjectContext()
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        return managedObjectContext
    }
    
    func testItemExist() {
        let managedObjectContext = setUpInMemoryManagedObjectContext()
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedObjectContext)
        let item = Item(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        XCTAssertNotNil(item)
    }
    
    func testItemAttributes() {
        let managedObjectContext = setUpInMemoryManagedObjectContext()
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: managedObjectContext)
        let item = Item(entity: entity!, insertIntoManagedObjectContext: managedObjectContext)
        let date = NSDate()
        item.setValuesForKeysWithDictionary(["name": "BEER", "location": "Drug Store", "income": 0, "outgo": 1501, "timeStamp": date])
        XCTAssertEqual(item.valueForKey("name") as! String, "BEER")
        XCTAssertEqual(item.valueForKey("location") as! String, "Drug Store")
        XCTAssertEqual(item.valueForKey("income") as! Int, 0)
        XCTAssertEqual(item.valueForKey("outgo") as! Int, 1501)
        XCTAssertEqual(item.valueForKey("timeStamp") as! NSDate, date)
    }
    
}
