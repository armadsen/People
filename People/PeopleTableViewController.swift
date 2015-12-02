//
//  PeopleTableViewController.swift
//  People
//
//  Created by Andrew Madsen on 12/1/15.
//  Copyright © 2015 Open Reel Software. All rights reserved.
//

import UIKit

class PeopleTableViewController: UITableViewController {
	
	override func viewDidLoad() {
		let nc = NSNotificationCenter.defaultCenter()
		nc.addObserver(self, selector: "databaseWasUpdated:", name: DatabaseWasUpdatedNotificationName, object: nil)
	}
	
	func databaseWasUpdated(notification: NSNotification) {
		self.tableView.reloadData()
	}
	
	// MARK: - Table view data source
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return Database.sharedDatabase.people.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath)
		
		let person = Database.sharedDatabase.people[indexPath.row]
		cell.textLabel?.text = person.name
		cell.detailTextLabel?.text = person.phoneNumber
		
		return cell
	}
	
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "ShowPersonDetailSegue" {
			guard let detailVC = segue.destinationViewController as? PersonDetailViewController else { return }
			if let indexPath = self.tableView.indexPathForSelectedRow {
				detailVC.person = Database.sharedDatabase.people[indexPath.row]
			}
		}
	}
}
