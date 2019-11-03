//
//  MenuViewController.swift
//  TruthOrDare
//
//  Created by Anthony on 10/05/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MenuViewController: UIViewController {


    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.layer.cornerRadius = playButton.bounds.width * 0.2

        // Do any additional setup after loading the view.
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.adSize = kGADAdSizeBanner
        bannerView.load(GADRequest())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
