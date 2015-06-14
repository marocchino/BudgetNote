//
//  Item.swift
//  BudgetNote
//
//  Created by Shim Won on 6/13/15.
//  Copyright © 2015 Shim. All rights reserved.
//

import UIKit
import CoreData

class Item: NSManagedObject {
    class func all(managedObjectContext : NSManagedObjectContext) -> [AnyObject] {
        let request : NSFetchRequest = NSFetchRequest(entityName: "Item")
        let result : [AnyObject]
        do {
            try result = managedObjectContext.executeFetchRequest(request)
        } catch {
            result = []
        }
        return result
    }
    func setAttributes(dic: [String : AnyObject]) {
        self.setValuesForKeysWithDictionary(dic)
        self.setValue(NSDate(), forKey: "timeStamp")
    }
}
