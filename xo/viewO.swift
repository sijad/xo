//
//  viewO.swift
//  xo
//
//  Created by Sajjad Hashemian on 9/13/15.
//  Copyright (c) 2015 Sajjad Hashemian. All rights reserved.
//

import Cocoa

class viewO: NSView {
	override func drawRect(dirtyRect: NSRect) {
		let rect = NSMakeRect(25/2, 25/2, self.frame.width - 25, self.frame.height - 25)
		let path = NSBezierPath(roundedRect: rect, xRadius: 99, yRadius: 99);
		NSColor.grayColor().set()
		path.stroke()
	}
}