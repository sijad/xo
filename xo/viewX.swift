//
//  viewX.swift
//  xo
//
//  Created by Sajjad Hashemian on 9/13/15.
//  Copyright (c) 2015 Sajjad Hashemian. All rights reserved.
//

import Cocoa

class viewX: NSView {
	override func drawRect(dirtyRect: NSRect) {
		let path = NSBezierPath();
		let start = NSPoint(x:25, y:25)
		let end = NSPoint(x: self.frame.width - 25,y: self.frame.height - 25)
		path.moveToPoint(start)
		path.lineToPoint(end)
		NSColor.grayColor().set()
		path.stroke()
		
		
		let path2 = NSBezierPath();
		let start2 = NSPoint(x:self.frame.width - 25, y: 25)
		let end2 = NSPoint(x:25,y: self.frame.height - 25)
		path2.moveToPoint(start2)
		path2.lineToPoint(end2)
		NSColor.grayColor().set()
		path2.stroke()
	}
}