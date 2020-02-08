//
//  PlayerPickerViewController.swift
//  TruthOrDare
//
//  Created by Anthony on 10/05/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit
import GoogleMobileAds

class PlayerPickerViewController: UIViewController {

    var numberOfPlayers: Int = 0
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupButtons()
        setupBanner()
        
    }
    
    func setupButtons(){
        oneButton.layer.cornerRadius = 15
        twoButton.layer.cornerRadius = 15
        threeButton.layer.cornerRadius = 15
        fourButton.layer.cornerRadius = 15
        fiveButton.layer.cornerRadius = 15
        sixButton.layer.cornerRadius = 15
    }

    func setupBanner(){
        bannerView.adUnitID = Constants.bannerID
        bannerView.rootViewController = self
        bannerView.adSize = kGADAdSizeBanner
        bannerView.load(GADRequest())
    }
    
    @IBAction func OnePlayer(_ sender: Any) {
        numberOfPlayers = 1
        performSegue(withIdentifier: "toEnterNames", sender: self)
    }
    
    
    @IBAction func TwoPlayers(_ sender: Any) {
        numberOfPlayers = 2
        performSegue(withIdentifier: "toEnterNames", sender: self)
    }
    
    @IBAction func ThreePlayers(_ sender: Any) {
        numberOfPlayers = 3
        performSegue(withIdentifier: "toEnterNames", sender: self)
    }
    
    @IBAction func FourPlayers(_ sender: Any) {
        numberOfPlayers = 4
        performSegue(withIdentifier: "toEnterNames", sender: self)
    }
    
    @IBAction func FivePlayers(_ sender: Any) {
        numberOfPlayers = 5
        performSegue(withIdentifier: "toEnterNames", sender: self)
    }
    
    @IBAction func SixPlayers(_ sender: Any) {
        numberOfPlayers = 6
        performSegue(withIdentifier: "toEnterNames", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as!  EnterNamesViewController
        vc.numberOfPlayers = numberOfPlayers
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
