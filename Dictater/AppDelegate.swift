//
//  AppDelegate.swift
//  Dictate Assist
//
//  Created by Kyle Carson on 9/1/15.
//  Copyright © 2015 Kyle Carson. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	func applicationDidFinishLaunching(aNotification: NSNotification)
	{
		NSApp.servicesProvider = DictaterService()
		
		if !Dictater.hasBeenUsed
		{
			self.openHowToUseWindow()
		}
	}
	
	func applicationWillTerminate(aNotification: NSNotification) {
		// Insert code here to tear down your application
	}
	
	var howToUseController : NSWindowController?
	
	func openHowToUseWindow()
	{
		if let sb = NSApplication.sharedApplication().windows.first?.windowController?.storyboard,
		let controller = sb.instantiateControllerWithIdentifier("howToUse") as? NSWindowController
		{
			controller.showWindow(self)
			self.howToUseController = controller
		}
	}
}

