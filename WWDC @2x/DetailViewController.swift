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
    
    var moviePlayerVC: MPMoviePlayerViewController?
    var speedControlOverlayView: SpeedControlOverlayView?
    
    func configureView() {
        if let detail = self.detailItem {
            var contentString = self.detailItem!.objectForKey("hd_link")! as NSString
            contentString = contentString.stringByReplacingOccurrencesOfString("?dl=1", withString: "")
            var contentURL = NSURL(string: contentString)
            moviePlayerVC = MPMoviePlayerViewController(contentURL: contentURL)
            moviePlayerVC!.moviePlayer.overlayView_xcd = speedControlOverlayView
            
            self.splitViewController!.presentMoviePlayerViewControllerAnimated(moviePlayerVC)
            moviePlayerVC!.moviePlayer.play()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        speedControlOverlayView = UINib(nibName: "SpeedControlOverlayView", bundle: nil).instantiateWithOwner(nil, options: nil).first as SpeedControlOverlayView?
        speedControlOverlayView!.speedSlider.addTarget(self, action: Selector("speedChanged:"), forControlEvents: .ValueChanged)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.configureView()
    }
    
    func speedChanged(sender: UISlider){
        moviePlayerVC!.moviePlayer.currentPlaybackRate = sender.value
    }

}

