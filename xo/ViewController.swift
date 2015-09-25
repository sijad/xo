//
//  ViewController.swift
//  xo
//
//  Created by Sajjad Hashemian on 9/1/15.
//  Copyright (c) 2015 Sajjad Hashemian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
	var imgs: [NSImageView]!
	
	@IBOutlet var img1: NSImageView!
	@IBOutlet var img2: NSImageView!
	@IBOutlet var img3: NSImageView!
	@IBOutlet var img4: NSImageView!
	@IBOutlet var img5: NSImageView!
	@IBOutlet var img6: NSImageView!
	@IBOutlet var img7: NSImageView!
	@IBOutlet var img8: NSImageView!
	@IBOutlet var img9: NSImageView!
	
	enum lineType: UInt {
		case none
		case Vertical
		case Horziontal
		case Slash
		case BackSlash
	}
	
	var canPlay:Bool = true
	
	var rows: [Int] =  [0,0,0,
						0,0,0,
						0,0,0,]	// zero mean empty
						// one mean X
						// two mean O
	var isX: Bool!
	
	override func viewDidLoad() {
		isX = true;
		
		imgs = [img1, img2, img3,
				img4, img5, img6,
				img7, img8, img9,]
		
		super.viewDidLoad()

		for img in imgs {
			let click = NSClickGestureRecognizer(target: self, action: Selector("onClick:"))
			img.addGestureRecognizer(click)
		}
	}
	
	func onClick(g: NSGestureRecognizer) {
		guard canPlay else {
			return
		}
		if let a = g.view as? NSImageView {
			var newview: NSView
			if isX! {
				newview = viewX(frame: NSMakeRect(0, 0, a.frame.width, a.frame.height))
			}else{
				newview = viewO(frame: NSMakeRect(0, 0, a.frame.width, a.frame.height))
			}
			
			if let n = imgs.indexOf(a) {
				if rows[n] == 0 {
					a.addSubview(newview)
					rows[n] = (isX! ? 1 : 2)
					isX = !isX
					let winner = ViewController.whoIsWinner(rows)
					if winner.0 != nil {
						canPlay = false
						for i in winner.winnerRows {
							switch(winner.linetype) {
							case .Horziontal:
								imgs[i].addSubview(viewHorizontal(frame: NSMakeRect(0, 0, a.frame.width, a.frame.height)))
							case .Vertical:
								imgs[i].addSubview(viewVertical(frame: NSMakeRect(0, 0, a.frame.width, a.frame.height)))
							case .BackSlash:
								imgs[i].addSubview(viewBackSlash(frame: NSMakeRect(0, 0, a.frame.width, a.frame.height)))
							default:
								imgs[i].addSubview(viewSlash(frame: NSMakeRect(0, 0, a.frame.width, a.frame.height)))
							}
						}
					}
					
				}
			}
		}
	}
	
	@IBAction func resetGame(sender: AnyObject) {
		canPlay = true
		rows = [0,0,0,
				0,0,0,
				0,0,0,]
		isX = true
		for img in imgs {
			for view in img.subviews {
				view.removeFromSuperview()
			}
		}
	}

	
	static func whoIsWinner(rows: [Int]) -> (winnerRows : [Int]!, linetype: lineType) {
		let alls = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
		for a in alls {
			if rows[a[0]] != 0 && rows[a[1]] != 0 && rows[a[2]] != 0 && rows[a[0]] == rows[a[1]] && rows[a[0]] == rows[a[2]] {
				var lt : lineType
				switch(alls.indexOf({$0 == a})) {
				case let x where x < 3:
					lt = .Horziontal
				case let x where x < 6:
					lt = .Vertical
				case let x where x == 6:
					lt = .BackSlash
				default:
					lt = .Slash
				}
				return (a, lt)
			}
		}
		return (nil, lineType.none)
	}

	
	override var representedObject: AnyObject? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

