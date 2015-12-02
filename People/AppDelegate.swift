//
//  AppDelegate.swift
//  People
//
//  Created by Andrew Madsen on 12/1/15.
//  Copyright © 2015 Open Reel Software. All rights reserved.
//

import UIKit

enum URLAction: String {
	case CreatePerson
}

func dictionaryFromURLQueryString(string: String) -> [String : String] {
	var dict = [String : String]()
	let pairs = string.componentsSeparatedByString("&")
	for pair in pairs {
		let keyValue = pair.componentsSeparatedByString("=")
		if keyValue.count != 2 { continue }
		if let key = keyValue.first, value = keyValue.last {
			dict[key] = value
		}
	}
	return dict
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
		guard let actionRawValue = url.host,
		action = URLAction(rawValue: actionRawValue),
		parameters = url.query else {
			return false
		}
	
		let paramDict = dictionaryFromURLQueryString(parameters)
		
		switch action {
		case .CreatePerson:
			if let name = paramDict["name"], phoneNumber = paramDict["phoneNumber"] {
				Database.sharedDatabase.addPerson(Person(name: name, phoneNumber: phoneNumber))
			}
		}
		
		return true
	}

}

