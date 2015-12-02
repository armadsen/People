//
//  PersonDetailViewController.swift
//  People
//
//  Created by Andrew Madsen on 12/1/15.
//  Copyright © 2015 Open Reel Software. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateForNewPerson()
	}

	var person: Person? = nil {
		didSet {
			updateForNewPerson()
		}
	}
	
	func updateForNewPerson() {
		guard let person = self.person else {
			nameLabel?.text = "None"
			phoneNumberLabel?.text = "None"
			return
		}
		
		nameLabel?.text = person.name
		phoneNumberLabel?.text = person.phoneNumber
	}
	
	// Outlets
	@IBOutlet weak var nameLabel: UILabel?
	@IBOutlet weak var phoneNumberLabel: UILabel?
}
