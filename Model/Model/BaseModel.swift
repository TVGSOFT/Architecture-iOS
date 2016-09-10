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
    
    internal let realm: Realm
    
    public var tableName: String {
        return "Unknown"
    }
    
    public var lastSyncedAt: NSDate {
        get {
            let result = realm.objects(SyncHistory.self)
                              .filter("tableName = '\(tableName)'")
                              .first
            if let syncedAt = result?.lastSyncedAt {
                return syncedAt
            }
            
            return NSDate()
        }
        set {
            try? realm.write {
                let syncHistory = realm.create(SyncHistory.self)
                syncHistory.lastSyncedAt = newValue
                syncHistory.tableName = tableName
            }
        }
    }
    
    // MARK: Constructor
    
    public init(realm: Realm) {
        self.realm = realm
    }
    
    // MARK: Public method
    
    public func add<T: Entity>(entity: T, update: Bool = false) {
        try? realm.write {
            realm.add(entity, update: update)
        }
    }
    
    public func add<T: Entity>(entities: [T], update: Bool = false) {
        if entities.count <= 0 {
            return
        }
        
        realm.beginWrite()
        
        realm.add(entities, update: update)
        
        try? realm.commitWrite()
    }
    
    public func delete<T: Entity>(entity: T) {
        try? realm.write {
            realm.delete(entity)
        }
    }
    
    public func delete<T: Entity>(entities: [T]) {
        if entities.count <= 0 {
            return
        }
        
        realm.beginWrite()
        
        realm.delete(entities)
        
        try? realm.commitWrite()
    }
    
}
