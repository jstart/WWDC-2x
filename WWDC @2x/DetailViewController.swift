//
//  DetailViewController.swift
//  WWDC @2x
//
//  Created by Christopher Truman on 11/30/14.
//  Copyright (c) 2014 truman. All rights reserved.
//

import UIKit
import MediaPlayer

class DetailViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!

    var detailItem: NSDictionary?
    var playbackSpeedLabel: UILabel = {
        var label = UILabel(frame: CGRectMake(0, 0, 50, 45))
        label.textAlignment = .Center
        label.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.29)
        label.text = "1.0x"
        return label
    }()
    
    var moviePlayerVC: MPMoviePlayerViewController?
    
    let speedSlider : UISlider = {
        var slider = UISlider(frame: CGRectMake(50, 0, 280, 45))
        slider.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.29)
        slider.tintColor = UIColor.blackColor()
        slider.value = 1.0
        slider.maximumValue = 2.0
        slider.minimumValue = 0.1
        return slider
    }()

    func configureView() {
        if let detail = self.detailItem {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    override func viewDidAppear(animated: Bool) {
        speedSlider.frame.size.width = self.view.frame.width - 50
        speedSlider.frame.origin.y = self.view.frame.size.height - speedSlider.frame.height - 130
        playbackSpeedLabel.frame.origin.y = self.view.frame.size.height - playbackSpeedLabel.frame.height - 130
        speedSlider.addTarget(self, action: Selector("speedChanged:"), forControlEvents: .ValueChanged)

        var contentString = self.detailItem!.objectForKey("hd_link")! as NSString
        contentString = contentString.stringByReplacingOccurrencesOfString("?dl=1", withString: "")
        var contentURL = NSURL(string: contentString)
        moviePlayerVC = MPMoviePlayerViewController(contentURL: contentURL)
        var view = UIView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        view.addSubview(speedSlider)
        
        view.addSubview(playbackSpeedLabel)

        moviePlayerVC!.moviePlayer.overlayView_xcd = view
        self.splitViewController!.presentMoviePlayerViewControllerAnimated(moviePlayerVC)
        moviePlayerVC!.moviePlayer.play()
    }
    
    func speedChanged(sender: UISlider){
        moviePlayerVC!.moviePlayer.currentPlaybackRate = sender.value
        var formattedString : NSString = NSString(format: "%.01fx", sender.value)

        playbackSpeedLabel.text = formattedString
    }

}

