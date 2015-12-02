//
//  Database.swift
//  People
//
//  Created by Andrew Madsen on 12/1/15.
//  Copyright © 2015 Open Reel Software. All rights reserved.
//

import Foundation

let DatabaseWasUpdatedNotificationName = "DatabaseWasUpdatedNotificationName"

class Database {
	static let sharedDatabase = Database()
	var people = [Person]()
	
	func addPerson(person: Person) {
		people.append(person)
		NSNotificationCenter.defaultCenter().postNotificationName(DatabaseWasUpdatedNotificationName, object: self)
	}
	
	func removePerson(person: Person) {
		if let index = people.indexOf(person) {
			people.removeAtIndex(index)
			NSNotificationCenter.defaultCenter().postNotificationName(DatabaseWasUpdatedNotificationName, object: self)
		}
	}
}