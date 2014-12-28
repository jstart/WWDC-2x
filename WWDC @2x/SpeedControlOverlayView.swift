//
//  SpeedControlOverlayView.swift
//  WWDC @2x
//
//  Created by Cédric Luthi on 28.12.14.
//  Copyright (c) 2014 truman. All rights reserved.
//

import UIKit

class SpeedControlOverlayView : UIView {
    
    @IBOutlet weak var playbackSpeedLabel: UILabel!
    @IBOutlet weak var speedSlider: UISlider!
    
    @IBAction func speedChanged(sender: UISlider) {
        playbackSpeedLabel.text = NSString(format: "%.01fx", sender.value)
    }
}
