//
//  EventBus.swift
//  Model
//
//  Created by Giáp Trần on 9/16/16.
//  Copyright © 2016 TVG Soft, Inc. All rights reserved.
//

public class EventBus {
    
    // MARK: Property
    
    private static var instance: EventBus?
    private static var token: dispatch_once_t = 0
    
    public static var sharedManager: EventBus {
        dispatch_once(&token) {
            instance = EventBus()
        }
        
        return instance!
    }
    
    private var subscribers = [String: EventPost]()
    
    private var stickyTimer: NSTimer?
    
    // MARK: Constructor
    
    private init() {
        
    }
    
    // MARK: Public method
    
    public func post(name: String, object: AnyObject) {
        NSNotificationCenter.defaultCenter()
                            .postNotificationName(name, object: object)
    }
    
    public func postSticky(name: String, object: AnyObject) {
        if let eventPost = subscribers[name] {
            eventPost.object = object
            eventPost.isActive = true
        } else {
            let eventPost = EventPost()
            eventPost.object = object
            eventPost.isActive = true
            
            subscribers[name] = eventPost
        }
        
        startSchedulePost()
    }
    
    public func register(name: String, handler: (AnyObject?) -> Void) {
        var eventPost = subscribers[name]
        if eventPost == nil {
            eventPost = EventPost()
            
            subscribers[name] = eventPost
        }
        
        eventPost!.handler = handler
        
        if let _ = eventPost?.observer {
            return
        }
        
        let observer = NSNotificationCenter.defaultCenter()
                                           .addObserverForName(
                                                name,
                                                object: nil,
                                                queue: NSOperationQueue.mainQueue()) { [unowned self] notification in
                    
                                                    self.stopSchedulePost()
                                                    
                                                    let name = notification.name
                                                    if let eventPost = self.subscribers[name] {
                                                        eventPost.send()
                        
                                                        eventPost.object = nil
                                                        eventPost.isActive = false
                                                    }
                                                    
                                            }
        eventPost!.observer = observer
    }
    
    public func unregister(name: String) {
        if let eventPost = subscribers[name] {
            NSNotificationCenter.defaultCenter()
                                .removeObserver(eventPost.observer!, name: name, object: nil)
            
            
            subscribers[name] = nil
        }
    }
    
    // MARK: Private method
    
    private func startSchedulePost() {
        stickyTimer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(stickyRunning), userInfo: nil, repeats: true)
    }
    
    private func stopSchedulePost() {
        stickyTimer?.invalidate()
        stickyTimer = nil
    }
    
    @objc private func stickyRunning() {
        if !subscribers.isEmpty {
            let postSubribers = subscribers.filter({ (name, eventPost) -> Bool in
                return eventPost.isActive
            })
            
            for (name, eventPost) in postSubribers {
                post(name, object: eventPost.object!)
            }
            
            return
        }
        
        stopSchedulePost()
    }
    
}