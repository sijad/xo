//
//  viewBackSlash.swift
//  xo
//
//  Created by Sajjad Hashemian on 9/25/15.
//  Copyright © 2015 Sajjad Hashemian. All rights reserved.
//

import Cocoa

class viewBackSlash: NSView {
	override func drawRect(dirtyRect: NSRect) {
		let path = NSBezierPath()
		let start = NSPoint(x: self.frame.width, y: 0)
		let end = NSPoint(x: 0, y: self.frame.height)
		path.moveToPoint(start)
		path.lineToPoint(end)
		NSColor.blackColor().set()
		path.stroke()
		
	}
}
