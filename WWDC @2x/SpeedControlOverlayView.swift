//
//  SpeedControlOverlayView.swift
//  WWDC @2x
//
//  Created by Cédric Luthi on 28.12.14.
//  Copyright (c) 2014 truman. All rights reserved.
//

import UIKit

class SpeedControlOverlayView : UIView {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var playbackSpeedLabel: UILabel!
    @IBOutlet weak var speedSlider: UISlider!
    
    override func awakeFromNib() {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            backgroundView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.75)
            speedSlider.alpha = 1.0
        }
    }
    @IBAction func speedChanged(sender: UISlider) {
        playbackSpeedLabel.text = NSString(format: "%.01fx", sender.value)
    }
}
