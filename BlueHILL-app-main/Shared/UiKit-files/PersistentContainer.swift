//
//  PersistentContainer.swift
//  Place holder (iOS)
//
//  Created by Harvijs Tucs on 16/05/2022.
//

import Foundation
import CoreData

class PersistentContainer: NSPersistentContainer{
    
    static let shared = PersistentContainer()
    
    override func newBackgroundContext() -> NSManagedObjectContext {
        let backgroundContext = super.newBackgroundContext()
        backgroundContext.automaticallyMergesChangesFromParent = true
        backgroundContext.mergePolicy = NSMergePolicy(merge:NSMergePolicyType.mergeByPropertyStoreTrumpMergePolicyType)
        return backgroundContext
    }
}
