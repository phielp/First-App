//  ViewController.swift
//
//  Name: Philip Bouman
//  Email: phielp@gmail.com
//  Studentnr: 10668667
//  
//  Copied part of the function setupAudioPlayerWithFile from:
//      http://www.raywenderlich.com/114298/learn-to-code-ios-apps-with-swift-tutorial-5-making-it-beautiful
//  Sounds from http://www.kenney.nl , http://www.freesfx.co.uk
//  Images from Google search
//
//  Week 1: Assignment First App
//  Roll the dice info: README.md


import UIKit
import AVFoundation
import SpriteKit

var dice1: UInt32 = 1
var dice2: UInt32 = 1
var dice3: UInt32 = 1
var dice4: UInt32 = 1
var dice5: UInt32 = 1

var allThrows: [UInt32] = []

var nThrows = 3

var totalScore = 0

var score = 0

var diceSound : AVAudioPlayer?
var lockSound : AVAudioPlayer?
var unlockSound : AVAudioPlayer?

class ViewController: UIViewController {
    
    // LABELS
    @IBOutlet weak var OutputDice1: UILabel!
    @IBOutlet weak var OutputDice2: UILabel!
    @IBOutlet weak var OutputDice3: UILabel!
    @IBOutlet weak var OutputDice4: UILabel!
    @IBOutlet weak var OutputDice5: UILabel!
    
    @IBOutlet weak var ones: UILabel!
    @IBOutlet weak var twos: UILabel!
    @IBOutlet weak var threes: UILabel!
    @IBOutlet weak var fours: UILabel!
    @IBOutlet weak var fives: UILabel!
    @IBOutlet weak var sixes: UILabel!
    
    @IBOutlet weak var numberOfThrows: UILabel!
    
    @IBOutlet weak var total: UILabel!

    // SWITCHES
    @IBOutlet weak var lock1: UISwitch!
    @IBOutlet weak var lock2: UISwitch!
    @IBOutlet weak var lock3: UISwitch!
    @IBOutlet weak var lock4: UISwitch!
    @IBOutlet weak var lock5: UISwitch!
    
    //BUTTONS
    @IBOutlet weak var onesButton: UIButton!
    @IBOutlet weak var twosButton: UIButton!
    @IBOutlet weak var threesButton: UIButton!
    @IBOutlet weak var foursButton: UIButton!
    @IBOutlet weak var fivesButton: UIButton!
    @IBOutlet weak var sixesButton: UIButton!
   
    // SWITCH ACTIONS
    @IBAction func lock1Clicked(sender: AnyObject) {
        if lock1.on {
            unlockSound?.play()
        } else {
            lockSound?.play()
        }
    }
    
    @IBAction func lock2Clicked(sender: AnyObject) {
        if lock2.on {
            unlockSound?.play()
        } else {
            lockSound?.play()
        }
    }
    
    @IBAction func lock3Clicked(sender: AnyObject) {
        if lock3.on {
            unlockSound?.play()
        } else {
            lockSound?.play()
        }
    }
    
    @IBAction func lock4Clicked(sender: AnyObject) {
        if lock4.on {
            unlockSound?.play()
        } else {
            lockSound?.play()
        }
    }
    
    @IBAction func lock5Clicked(sender: AnyObject) {
        if lock5.on {
            unlockSound?.play()
        } else {
            lockSound?.play()
        }
    }
    
    // BUTTON ACTIONS
    @IBAction func RollDice(sender: AnyObject) {
        if nThrows > 0 {
            diceRoll()
        }
    }
    
    @IBAction func newGameButton(sender: AnyObject) {
        initGame()
    }
    
    @IBAction func ones(sender: AnyObject) {
        onesButton.enabled = false
        for n in allThrows {
            if n == 1 {
                score = score + 1
            }
        }
        ones.text = "\(score)"
        nextTurn()
    }
    
    @IBAction func twos(sender: AnyObject) {
        twosButton.enabled = false
        for n in allThrows {
            if n == 2 {
                score = score + 2
            }
        }
        twos.text = "\(score)"
        nextTurn()
    }
    @IBAction func threes(sender: AnyObject) {
        threesButton.enabled = false
        for n in allThrows {
            if n == 3 {
                score = score + 3
            }
        }
        threes.text = "\(score)"
        nextTurn()
    }
    @IBAction func fours(sender: AnyObject) {
        foursButton.enabled = false
        for n in allThrows {
            if n == 4 {
                score = score + 4
            }
        }
        fours.text = "\(score)"
        nextTurn()
    }
    @IBAction func fives(sender: AnyObject) {
        fivesButton.enabled = false
        for n in allThrows {
            if n == 5 {
                score = score + 5
            }
        }
        fives.text = "\(score)"
        nextTurn()
    }
    @IBAction func sixes(sender: AnyObject) {
        sixesButton.enabled = false
        for n in allThrows {
            if n == 6 {
                score = score + 6
            }
        }
        sixes.text = "\(score)"
        nextTurn()
    }
    
    // FUNCTIONS
    
    // Initializes the game
    func initGame() {
        totalScore = 0
        resetTurn()
        ones.text = "0"
        twos.text = "0"
        threes.text = "0"
        fours.text = "0"
        fives.text = "0"
        sixes.text = "0"
        onesButton.enabled = true
        twosButton.enabled = true
        threesButton.enabled = true
        foursButton.enabled = true
        fivesButton.enabled = true
        sixesButton.enabled = true
    }
    
    // Resets number of throws, labels and switches
    func resetTurn() {
        score = 0
        nThrows = 3
        numberOfThrows.text = "Throws Left: \(nThrows)"
        OutputDice1.text = "Dice1"
        OutputDice2.text = "Dice2"
        OutputDice3.text = "Dice3"
        OutputDice4.text = "Dice4"
        OutputDice5.text = "Dice5"
        lock1.setOn(true, animated: true)
        lock2.setOn(true, animated: true)
        lock3.setOn(true, animated: true)
        lock4.setOn(true, animated: true)
        lock5.setOn(true, animated: true)
        total.text = "\(totalScore)"
        unlockSound?.play()
    }
    
    // Initialize next turn and updates total score
    func nextTurn() {
        totalScore = totalScore + score
        resetTurn()
    }
    
    // Roll dice. If switch set to unlock; generate random number 1-6 for all dice
    func diceRoll() {
        diceSound?.play()
        if nThrows > 0 {
            if lock1.on {
                dice1 = arc4random_uniform(6) + 1
            }
            if lock2.on {
                dice2 = arc4random_uniform(6) + 1
            }
            if lock3.on {
                dice3 = arc4random_uniform(6) + 1
            }
            if lock4.on {
                dice4 = arc4random_uniform(6) + 1
            }
            if lock5.on {
                dice5 = arc4random_uniform(6) + 1
            }
            
            OutputDice1.text = "\(dice1)"
            OutputDice2.text = "\(dice2)"
            OutputDice3.text = "\(dice3)"
            OutputDice4.text = "\(dice4)"
            OutputDice5.text = "\(dice5)"
            
            allThrows = [dice1,dice2,dice3,dice4,dice5]
        }
        nThrows = nThrows - 1
        numberOfThrows.text = "Throws Left: \(nThrows)"
    }
    
    // Setup audioplayer and load files
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        // setup path
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        var audioPlayer:AVAudioPlayer?
        
        // setup player
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        audioPlayer?.prepareToPlay()
        return audioPlayer
    }
    
    override func viewDidLoad() {
        diceSound = setupAudioPlayerWithFile("dice", type:"wav")
        lockSound = setupAudioPlayerWithFile("lock", type:"wav")
        unlockSound = setupAudioPlayerWithFile("unlock", type:"wav")
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

