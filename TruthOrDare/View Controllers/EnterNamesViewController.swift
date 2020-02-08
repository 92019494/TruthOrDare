//
//  EnterNamesViewController.swift
//  TruthOrDare
//
//  Created by Anthony on 10/05/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit
import GoogleMobileAds

class EnterNamesViewController: UIViewController {
    
    var numberOfPlayers: Int = 0
    var playerNamesEntered: Int = 0

    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var playerTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    var playerOneName: String = ""
    var playerTwoName: String = ""
    var playerThreeName: String = ""
    var playerFourName: String = ""
    var playerFiveName: String = ""
    var playerSixName: String = ""


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextField()
        setupBanner()
        setupButton()
        setPlayerLabelText()
        addGestureRecognizer()
        
                
    }
    
    func setupTextField(){
        playerTextField.layer.borderColor = UIColor.systemPink.cgColor
        playerTextField.layer.borderWidth = 3
        playerTextField.layer.cornerRadius = 10
    }
    
    func setupButton(){
        continueButton.layer.cornerRadius = 15
    }
    
    func addGestureRecognizer(){
        let tapper = UITapGestureRecognizer(target: self, action:#selector(DismissKeyboard))
        tapper.cancelsTouchesInView = false
        view.addGestureRecognizer(tapper)
    }
    
    func setPlayerLabelText(){
        playerLabel.text = "Player 1"
    }
    
    func setupBanner(){
        // banner setup
        bannerView.adUnitID = Constants.bannerID
        bannerView.rootViewController = self
        bannerView.adSize = kGADAdSizeBanner
        bannerView.load(GADRequest())

    }
    
    func validateTextField() -> Bool {
        if playerTextField.text != "" {
            return true
        }
        return false
    }
    
    @IBAction func Continue(_ sender: Any) {
        
        if validateTextField() {
            switch playerLabel.text {
            case "Player 1":
                playerOneName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 2"
            case "Player 2":
                playerTwoName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 3"
            case "Player 3":
                playerThreeName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 4"
            case "Player 4":
                playerFourName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 5"
            case "Player 5":
                playerFiveName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 6"
            case "Player 6":
                playerSixName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
            default:
                break
            }
            playerTextField.text = ""
        } else {
            // present text field alert
        }
        
        if playerLabel.text == "Player 1" {
            if playerTextField.text != "" {
                playerOneName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 2"
                playerTextField.text = ""
            }
        }
        
        if playerLabel.text == "Player 2" {
            if playerTextField.text != "" {
                playerTwoName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 3"
                playerTextField.text = ""
            }
        }
        
        if playerLabel.text == "Player 3" {
            if playerTextField.text != "" {
                playerThreeName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 4"
                playerTextField.text = ""
            }
        }
        
        if playerLabel.text == "Player 4" {
            if playerTextField.text != "" {
                playerFourName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 5"
                playerTextField.text = ""
            }
        }
        
        if playerLabel.text == "Player 5" {
            if playerTextField.text != "" {
                playerFiveName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerLabel.text = "Player 6"
                playerTextField.text = ""
            }
        }
        
        if playerLabel.text == "Player 6" {
            if playerTextField.text != "" {
                playerSixName = playerTextField.text!
                playerNamesEntered += 1
                CheckIfNamesHaveBeenEntered()
                playerTextField.text = ""
            }
        }
    }
    
    func CheckIfNamesHaveBeenEntered(){
        if playerNamesEntered == numberOfPlayers{
            performSegue(withIdentifier: "toGame", sender: self)
            
        }
        
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
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
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
