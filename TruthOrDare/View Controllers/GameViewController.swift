//
//  GameViewController.swift
//  TruthOrDare
//
//  Created by Anthony on 10/05/19.
//  Copyright © 2019 Anthony. All rights reserved.
//

import UIKit
import GoogleMobileAds

class GameViewController: UIViewController {
    
    // using two lists so questions and dares aren't repeated
    var truthQuestions = Data.sharedInstance.truths
    var dareActions = Data.sharedInstance.dares
    
    var truthQuestionsTwo = [String]()
    var dareActionsTwo = [String]()

    var numberOfPlayers: Int = 0
    var playerOneName: String = ""
    var playerTwoName: String = ""
    var playerThreeName: String = ""
    var playerFourName: String = ""
    var playerFiveName: String = ""
    var playerSixName: String = ""
    
    var actionSelected: Bool = false
    var usingSecondTruthList: Bool = false
    var usingSecondDareList: Bool = false


    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var currentPlayerNameLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var truthButton: UIButton!
    @IBOutlet weak var dareButton: UIButton!
    @IBOutlet weak var drinkButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBanner()
        setupButtons()
        clearQuestionText()
        setPlayerOneName()
        hideContinueButton()
    }
    
    func hideContinueButton(){
        continueButton.isHidden = true
    }
    
    func setupBanner(){
        bannerView.adUnitID = Constants.bannerID
        bannerView.rootViewController = self
        bannerView.adSize = kGADAdSizeBanner
        bannerView.load(GADRequest())
    }
    
    func setupButtons(){
        truthButton.layer.cornerRadius = 15
        dareButton.layer.cornerRadius = 15
        drinkButton.layer.cornerRadius = 15
    }
    
    func clearQuestionText(){
        questionLabel.text = ""
    }
    
    func setPlayerOneName(){
        currentPlayerNameLabel.text = playerOneName
    }
    @IBAction func homeButtonClicked(_ sender: Any) {
        navigationController?.popToRootViewController(animated: false)
    }
    
    @IBAction func Truth(_ sender: Any) {
        if truthQuestions.isEmpty {
            usingSecondTruthList = true
        } else if truthQuestionsTwo.isEmpty {
            usingSecondTruthList = false
        }
        
        if !actionSelected {
            if usingSecondTruthList {
                let ranNum = Int.random(in: 0 ..< truthQuestionsTwo.count)
                questionLabel.text = "\(truthQuestionsTwo[ranNum])?"
                truthQuestions.append(truthQuestionsTwo[ranNum])
                truthQuestionsTwo.remove(at: ranNum)
                print("using truth list two")

            } else {
                let ranNum = Int.random(in: 0 ..< truthQuestions.count)
                questionLabel.text = "\(truthQuestions[ranNum])?"
                truthQuestionsTwo.append(truthQuestions[ranNum])
                truthQuestions.remove(at: ranNum)
                print("using truth list one")

            }
            toggleButtons()
            actionSelected = true
        }
    }
    
    @IBAction func Dare(_ sender: Any) {
        if dareActions.isEmpty {
            usingSecondDareList = true
        } else if dareActionsTwo.isEmpty {
            usingSecondDareList = false
        }
        if !actionSelected {
            if usingSecondDareList {
                let ranNum = Int.random(in: 0 ..< dareActionsTwo.count)
                questionLabel.text = (dareActionsTwo[ranNum])
                dareActions.append(dareActionsTwo[ranNum])
                dareActionsTwo.remove(at: ranNum)
                print("using dare list two")
            } else {
                let ranNum = Int.random(in: 0 ..< dareActions.count)
                questionLabel.text = dareActions[ranNum]
                dareActionsTwo.append(dareActions[ranNum])
                dareActions.remove(at: ranNum)
                print("using dare list one")

            }
        
        actionSelected = true
        toggleButtons()
        }
    }
    
    @IBAction func Drink(_ sender: Any) {
        if !actionSelected {
        let ranNum = Int.random(in: 1 ... 5)
        questionLabel.text = "Drink \(ranNum)"
        actionSelected = true
        toggleButtons()
        }
    }
    
    
    
    @IBAction func Continue(_ sender: Any) {
        
        if actionSelected {
            questionLabel.text = ""
            actionSelected = false
            toggleButtons()
            if currentPlayerNameLabel.text == playerOneName && numberOfPlayers > 1{
                currentPlayerNameLabel.text = playerTwoName
            }
            else if currentPlayerNameLabel.text == playerTwoName && numberOfPlayers > 2{
                currentPlayerNameLabel.text = playerThreeName
            }
            else if currentPlayerNameLabel.text == playerThreeName && numberOfPlayers > 3{
                currentPlayerNameLabel.text = playerFourName
            }
            else if currentPlayerNameLabel.text == playerFourName && numberOfPlayers > 4{
                currentPlayerNameLabel.text = playerFiveName
            }
            else if currentPlayerNameLabel.text == playerFiveName && numberOfPlayers > 5{
                currentPlayerNameLabel.text = playerSixName
            }
            else {
                currentPlayerNameLabel.text = playerOneName
            }
        }
      
    }
    
    
    
    func toggleButtons(){
        if continueButton.isHidden { continueButton.isHidden = false }
        else {continueButton.isHidden = true}
        
        if truthButton.isHidden { truthButton.isHidden = false }
        else {truthButton.isHidden = true}
        
        if dareButton.isHidden { dareButton.isHidden = false }
        else {dareButton.isHidden = true}
        
        if drinkButton.isHidden { drinkButton.isHidden = false }
        else {drinkButton.isHidden = true}
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
