//
//  Person.swift
//  People
//
//  Created by Andrew Madsen on 12/1/15.
//  Copyright © 2015 Open Reel Software. All rights reserved.
//

import Foundation

struct Person: Hashable {
	let name: String
	let phoneNumber: String
	
	var hashValue: Int { return name.hashValue + phoneNumber.hashValue }
}

func ==(lhs: Person, rhs: Person) -> Bool {
	return lhs.name == rhs.name && lhs.phoneNumber == rhs.phoneNumber
}