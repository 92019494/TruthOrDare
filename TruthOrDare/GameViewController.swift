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
    
    var truthQuestions = [String]()
    var dareActions = [String]()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // banner setup
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.adSize = kGADAdSizeBanner
        bannerView.load(GADRequest())
        
        // Do any additional setup after loading the view.
        truthButton.layer.cornerRadius = truthButton.bounds.width * 0.2
        dareButton.layer.cornerRadius = dareButton.bounds.width * 0.2
        drinkButton.layer.cornerRadius = drinkButton.bounds.width * 0.2

        
        questionLabel.text = ""
        truthQuestions = ["What is your most embarrasing story", "Who do you have a crush on right now", "What is the biggest lie you've told your parents","How many selfies do you take a day","What was the last thing you searched for on your phone","Whats the longest you've gone without showering","Have you slept with more than one person in a night","Have you ever had a crush on your boyfriend/girlfriends friend","Have you ever stolen anything","Have you ever stolen anything from a family member","Have you ever been arrested","When was the last time you went number 2s","If you had to kill one of your friends, who would it be","Who is your best friend","What is the last illegal thing you have done","Have you ever had a crush on someone 20 years older than you","Are you racist","What do you rate your own looks out of 10","When did you have your first kiss","How many people have you slept with","Who out of your friends relationship do you think is not going to last","Have you ever asked anybody out","What is an embarrassing song you like","What is your worst habit", "Has anyone ever walked in on you when going #2 in the bathroom","Do you sing in the shower"," Have you ever peed yourself","Have you ever farted loudly in the classroom","Do you ever talk to yourself in the mirror","Do you ever talk to yourself","Who do you like the least in this room and why","Who is the sexiest person in this room","What color underwear are you wearing right now","What was the last text you sent","How often do you shower"," Have you ever farted and then blamed someone else","Have you ever tasted your sweat","If you could only hear one song for the rest of your life, what would it be","Who in this room would be the worst person to date? Why","If someone offered you $1 million dollars to break up with your girlfriend/boyfriend, would you do it","If you were reborn, what decade would you want to be born in","If you could go back in time in erase one thing you said or did, what would it be","Have you ever thought about cheating on your partner","If you became invisible, what is the first thing you’d do","Have you ever been caught checking someone out" ,"What is the most embarrassing reason you have cried for","Would you rather be caught picking your nose or picking a wedgie","What was your last dream about","Do you smell bad","When was the last time you wet the bed","What app on your phone do you use the most","What song, when it comes on do you have to sing","Are you scared of the dark","Are you scared of spiders","What is your worst fear","What is something you have done in an attempt to be cooler","Have you ever used self tanner","Do you like hanging out with family","Have you ever got caught doing something you shouldnt","Have you ever had lice","Have you ever pooped your pants","What is something no one else knows about you","Do you write in a diary","Who would you hate to see naked","Who would you love to see naked","How long have you gone without brushing your teeth","If you switched genders for the day, what would you do","What is the most useless piece of knowledge you know","What did you learn in school that you wish you could forget","If you could only use one swear word for the rest of your life, which one would you choose","Would you rather not shower for a month, or eat the same meal everyday for a month","What animal most closely resembles your eating style","If your crush told you they liked your best friend, what would you do","If you knew your friends partner was cheating on them, what would you do","Have you ever told a lie about your best friend to make yourself look better","Who is hotter? You or your best friend","Have you ever shared your friends secret with someone else","Rate everyone in the room from 1 to 10, with 10 being the hottest","Have you ever ignored a friends text. Why did you do it","If your friend asked you to lie for them and you knew you would get in trouble, would you do it","Would you ditch your friends if you could become the most popular person in the world","If you had to choose, who would you stop being friends with","Name one thing you would change about each person in this room","You win a trip and are allowed to bring two people. Who do you pick","If you could swap one physical feature with your best friend, what would that be","If your best friend had B.O., would you tell them","What is the most annoying thing about your best friend","Is there anything about your life you would change","Who do you hate and why","How many people have you kissed","What is your biggest turn-on","Would you rather be skinny and hairy or fat and smooth","Describe your perfect date","Would you ever date two people at once if you could get away with it","You have to delete every app on your except for five. Name the five you would keep" ,"Have you ever sent out a nude snapchat"," Have you ever received a nude selfie? Who was it from","Have you ever gotten mad at a friend for posting an unflattering picture of you","Have you ever had a crush on a teacher","Have you ever cursed at your parents? Why","What is the most attractive feature on a person","What the biggest deal breaker for you","How far would you go on a first date","Have you ever regretted something you did to get a crushes attention","Would you ever be mean to someone if it meant you could save your close friend from embarrassment" ,"Describe what makes someone husband or wife material","What is your worst habit","What is one thing you do that you do not want anyone to know about","Do you frequently stalk anyone on social media? Who","Have you ever lied about your age","Who do you want to make out with the most","If you had to flash just one person in this room, who would it be", "If you have not had your first kiss yet, who in this room do you want to have your first kiss with","Of the people in this room, who would you go out with","Describe the most attractive thing about each person in this room" ,"Who here do you think is the best flirt","Who has the best smile","Who has the cutest nose","Who has the prettiest eyes","Who is the funniest in this room","How often do you check yourself out in the mirror when you are on a date","Who here do you think would be the best kisser","Who has the best dance moves","If you could have one physical feature of someone in this room, what would that be"," What is your wildest fantasy" ,"How far would you go with someone you just met and will never see again","Would you choose a wild, hot relationship or a calm and stable one","What is your biggest turn-off","If you could go on a romantic date with anyone in this room, who would you pick","Have you ever smoked","Have you ever tried drugs","What's the craziest thing you have done while under the influence","If you were trapped for three days on an island, who are three people in this room you would bring with you and why","Would you go to a nude beach","Who is the most annoying person in this room","Are you still a virgin","Do you have hidden piercings or tattoos","How long was your longest relationship","If you could have one celebrity follow you on Instagram, who would that be","Do you want to have kids? How many","Would you ever get into a long distance relationship","Describe the person of your dreams","Basketball, baseball, or rugby","What was your first job", "How tall do you want to be","Who do you think is the hottest celebrity","What is a rumor that went around about you"," Have you ever cheated on a test","What is the most embarrassing thing you have ever done in front of a teacher","Have you ever stuck gum under a desk","Have you ever gotten into a fight","Who was the hottest teacher at your school","Have you ever sexted anyone","Would you ever consider posing for Playboy" ,"Have you ever seen a naughty magazine","Have you ever sent a nude selfie? Who did you send it to","Have you ever been attracted to the same sex","When and where was your first kiss? Who was it with","When did you lose your virginity and who did you lose it with","Would you go out with someone older than you? How much older","Do you sleep in the nude”,” Have you ever been in a friends with benefits situation","If you had to go skinny dipping with someone, who in this room would you choose"]  // 161
        
        
        dareActions = ["Slap the person to your left", "Eat an onion", "Eat a raw egg", "Do the worm", "Sing 4 lines from your favourite song","Kiss one of your friends on the lips","Bark like a dog as loud as you can for 10 seconds","Let another player write a post from your facebook account","Run a lap around the nearest house","Pinch the person to your right","Make eye contact with one player without stopping until it's your turn again","Pull a piece of your hair out","Finish your drink","Finish someone elses drink","Talk in a Jamaican accent until it's your turn again","Talk in a British accent until it's your turn again","Talk in a Irish accent until it's your turn again","Talk in an Australian accent until it's your turn again","Show everyone your favourite dance move","Say you're favourite pick up line","Tell someone you hate them","Take an embarrassing selfie and post it as your profile picture","Remove your socks with your teeth","Fill your mouth with water and each person in the group must tell a joke they know. If you spit out the water, you have to finish your drink","Open Facebook, go to the account of the first person you see, and like a post from a year ago","Eat a whole piece of paper","Open the front door and howl like a wolf for 30 seconds","Talk super loud, like nobody can hear you until its your turn again","Call your crush","Pretend you’re a bird and eat food off the floor using only your mouth","Colour your two front teeth black","Lick the bottom of your foot","Make repulsive sounds while drinking","Draw an 'L' on your face with permanent marker","Spin around 10 times and try to walk to and back from the front door","Stand up and do jumping jacks until your next turn","Rub your armpits and then smell your fingers","Sniff everyone’s feet and rank them in order of best to worst","Wear you underwear over your pants for the rest of the game","Send a Snapchat of you pretending to cry because you just found out you were adopted","Take a picture of a tampon and post it on Instagram","Text your crush and tell them you love them","Call a random number and ask them out on a date","Put ice down the back of your top and leave it there until its your turn again","Do 10 press ups","Let the group put make up on you","Lick a table","Let someone crack an egg on your head","Trade tops with the person to your right","Get up and shuffle","Use a permanent marker to draw a monobrow on yourself","Get everyone playing to flick your forehead","Attempt to breakdance","Have a full conversation with yourself","Do 20 sit ups","Eat a dry weetbix","Kiss the person to your left on the back of their neck","Knock on your neighbor's door and ask if they have a spare condom","Go stand in a corner until its your turn again","Put an embarrassing snapchat and post it on your story","Let the person opposite you tickle you","Do your best impression of someone in the room and keep going until someone correctly guesses who it is","Get blindfolded and let someone feed you something","Trade socks with another player","Hold hands with the person to your left until its your turn again","Take a selfie with the group and post it on facebook","Let another player give you a wedgie"]  // 66
        
        
        currentPlayerNameLabel.text = playerOneName
        actionSelected = false
        
        print("There are \(truthQuestions.count) truth questions.")
        print("There are \(dareActions.count) dares.")


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
        }
    }
    
    @IBAction func Drink(_ sender: Any) {
        if !actionSelected {
        let ranNum = Int.random(in: 1 ... 5)
        questionLabel.text = "Drink \(ranNum)"
        actionSelected = true
        }
    }
    
    
    @IBAction func Continue(_ sender: Any) {
        
        if actionSelected {
            questionLabel.text = ""
            actionSelected = false
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toInstructions" else {return}
        let vc = segue.destination as!  InstructionsViewController
        vc.playerOneName = playerOneName
        vc.playerTwoName = playerTwoName
        vc.playerThreeName = playerThreeName
        vc.playerFourName = playerFourName
        vc.playerFiveName = playerFiveName
        vc.playerSixName = playerSixName
        vc.numberOfPlayers = numberOfPlayers
    }

    
    @IBAction func InstructionsButton(_ sender: Any) {
        performSegue(withIdentifier: "toInstructions", sender: self)
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
