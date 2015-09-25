//
//  viewSlash.swift
//  xo
//
//  Created by Sajjad Hashemian on 9/25/15.
//  Copyright © 2015 Sajjad Hashemian. All rights reserved.
//

import Cocoa

class viewSlash: NSView {
	override func drawRect(dirtyRect: NSRect) {
		let path = NSBezierPath();
		let start = NSPoint(x: 0, y: 0)
		let end = NSPoint(x:self.frame.width,y: self.frame.height)
		path.moveToPoint(start)
		path.lineToPoint(end)
		NSColor.blackColor().set()
		path.stroke()
	}
}