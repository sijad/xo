//
//  viewHorizontal.swift
//  xo
//
//  Created by Sajjad Hashemian on 9/25/15.
//  Copyright © 2015 Sajjad Hashemian. All rights reserved.
//

import Cocoa

class viewHorizontal: NSView {
	override func drawRect(dirtyRect: NSRect) {
		let path = NSBezierPath();
		let start = NSPoint(x: 0, y: self.frame.height / 2)
		let end = NSPoint(x:self.frame.width,y: self.frame.height / 2)
		path.moveToPoint(start)
		path.lineToPoint(end)
		NSColor.blackColor().set()
		path.stroke()
	}
}