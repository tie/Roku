//
//  ManagedObjectContext.swift
//  Roku
//
//  Created by Ivan Trubach on 16.11.15.
//  Copyright © 2015 Ivan Trubach. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Swift
import CoreData

/// `NSManagedObjectContext` focused on store changes observing.
public class ManagedObjectContext: NSManagedObjectContext, ObservableContext {
    public var observer: ContextObserver?
    
    public override var persistentStoreCoordinator: NSPersistentStoreCoordinator? {
        didSet {
            self.observer = ContextObserver(managedObjectContext: self)
        }
    }
    
    public override var parentContext: NSManagedObjectContext? {
        didSet {
            self.observer = ContextObserver(managedObjectContext: self)
        }
    }
}