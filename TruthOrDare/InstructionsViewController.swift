//
//  InstructionsViewController.swift
//  TruthOrDare
//
//  Created by Anthony on 20/05/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    var numberOfPlayers: Int = 0
    var playerOneName: String = ""
    var playerTwoName: String = ""
    var playerThreeName: String = ""
    var playerFourName: String = ""
    var playerFiveName: String = ""
    var playerSixName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backToGame(_ sender: Any) {
        performSegue(withIdentifier: "backToGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as!  GameViewController
        vc.playerOneName = playerOneName
        vc.playerTwoName = playerTwoName
        vc.playerThreeName = playerThreeName
        vc.playerFourName = playerFourName
        vc.playerFiveName = playerFiveName
        vc.playerSixName = playerSixName
        vc.numberOfPlayers = numberOfPlayers
    }
    
}
