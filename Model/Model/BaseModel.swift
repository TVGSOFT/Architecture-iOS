//
//  BaseModel.swift
//  Model
//
//  Created by Giáp Trần on 9/8/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

import RealmSwift

public class BaseModel {

    // MARK: Property
    
    public var tableName: String {
        return "Unknown"
    }
    
    public var lastSyncedAt: NSDate? {
        get {
            let realm = try! Realm()
            
            let result = realm.objects(SyncHistory.self)
                              .filter("tableName = '\(tableName)'")
                              .first
            if let syncedAt = result?.lastSyncedAt {
                return syncedAt
            }
            
            return nil
        }
        set {
            autoreleasepool {
                let realm = try! Realm()
                
                try! realm.write {
                    var syncHistory = realm.objects(SyncHistory.self)
                                           .filter("tableName = '\(tableName)'")
                                           .first
                    
                    if let hasSyncHistory = syncHistory {
                        hasSyncHistory.lastSyncedAt = newValue
                    } else {
                        syncHistory = realm.create(SyncHistory.self)
                        syncHistory!.lastSyncedAt = newValue
                        syncHistory!.tableName = tableName
                    }
                }
            }
        }
    }
    
    // MARK: Constructor
    
    public init() {
        
    }
    
    // MARK: Public method
    
    public func add<T: Entity>(entity: T, update: Bool = false) {
        autoreleasepool {
            let realm = try! Realm()
            try! realm.write {
                realm.add(entity, update: update)
            }
        }
    }
    
    public func add<T: Entity>(entities: [T], update: Bool = false) {
        if entities.count <= 0 {
            return
        }
        
        autoreleasepool {
            let realm = try! Realm()
            realm.beginWrite()
            
            realm.add(entities, update: update)
            
            try! realm.commitWrite()
        }
    }
    
    public func delete<T: Entity>(entity: T) {
        autoreleasepool {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(entity)
            }
        }
    }
    
    public func delete<T: Entity>(entities: [T]) {
        if entities.count <= 0 {
            return
        }
        
        autoreleasepool {
            let realm = try! Realm()
            realm.beginWrite()
            
            realm.delete(entities)
            
            try! realm.commitWrite()

        }
    }
    
    // MARK: Internal method
    
    internal func post(name: String, object: AnyObject?) {
        EventBus.sharedManager
                .post(name, object: object)
    }
    
}
