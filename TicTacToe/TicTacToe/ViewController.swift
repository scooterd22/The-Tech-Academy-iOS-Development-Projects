//
//  ViewController.swift
//  TicTacToe
//
//  Created by Scott DiBenedetto on 5/3/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var turn = 0
    var xPlacements = [Int]()
    var oPlacements = [Int]()
    var liveGame = true
    var player: AVAudioPlayer!
    var backgroundPlayer: AVAudioPlayer!
    

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var playAgainLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playAgainLabel.setTitle("Start", for: .normal)
        playAgainLabel.isHidden = false
        disableBoard()
        playBackgroundSound(soundName: "backgroundSong")
    }

    @IBAction func choicePressed(_ sender: UIButton) {
        
        print(sender.tag)
        playSound(soundName: "pop_sound")
        
        if turn % 2 == 0 {
            sender.setTitle("X", for: .normal)
            xPlacements.append(sender.tag)
            sender.isEnabled = false
            checkWinner(placements: xPlacements, player: "X")
            turn += 1
        } else {
            sender.setTitle("O", for: .normal)
            oPlacements.append(sender.tag)
            sender.isEnabled = false
            checkWinner(placements: oPlacements, player: "O")
            turn += 1
        }
        
        print("X: \(xPlacements)")
        print("O: \(oPlacements)")
        
    
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        xPlacements.removeAll()
        oPlacements.removeAll()
        var theBoard = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton]
        for x in theBoard {
            x?.setTitle("", for: .normal)
            x?.isEnabled = true
        }
        scoreLabel.text = ""
        playAgainLabel.isHidden = true
        turn = 0
        liveGame = true
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    func playBackgroundSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        backgroundPlayer = try! AVAudioPlayer(contentsOf: url!)
        backgroundPlayer.play()
                
    }
    
    
    func checkWinner(placements: Array<Int>, player: String) {
        
        if placements.contains(0) &&  placements.contains(1) && placements.contains(2) {
            scoreLabel.text = ("\(player) is the winner!!!!!")
            liveGame = false
        }
        if placements.contains(3) &&  placements.contains(4) && placements.contains(5) {
            scoreLabel.text = ("\(player) is the winner!!!!!")
            liveGame = false
        }
        if placements.contains(6) &&  placements.contains(7) && placements.contains(8) {
            scoreLabel.text = ("\(player) is the winner!!!!!")
            liveGame = false
        }
        if placements.contains(0) &&  placements.contains(3) && placements.contains(6) {
            scoreLabel.text = ("\(player) is the winner!!!!!")
            liveGame = false
        }
        if placements.contains(1) &&  placements.contains(4) && placements.contains(7) {
            scoreLabel.text = ("\(player) is the winner!!!!!")
            liveGame = false
        }
        if placements.contains(2) &&  placements.contains(5) && placements.contains(8) {
            scoreLabel.text = ("\(player) is the winner!!!!!")
            liveGame = false
        }
        if placements.contains(0) &&  placements.contains(4) && placements.contains(8) {
            scoreLabel.text = ("\(player) is the winner!!!!!")
            liveGame = false
        }
        if placements.contains(2) &&  placements.contains(4) && placements.contains(6) {
            scoreLabel.text = ("\(player) is the winner!!!!!")
            liveGame = false
        }
        
        
        if liveGame == true && xPlacements.count >= 5 && oPlacements.count >= 4 {
            scoreLabel.text = ("Cat's Game")
            playAgainLabel.setTitle("Play Again", for: .normal)
            playAgainLabel.isHidden = false
        }
        
        if liveGame == false {
            playAgainLabel.setTitle("Play Again", for: .normal)
            playAgainLabel.isHidden = false
            disableBoard()
        }
        
    }
    
    func disableBoard() {
        var theBoard = [zeroButton, oneButton, twoButton, threeButton, fourButton, fiveButton, sixButton, sevenButton, eightButton]
        for x in theBoard {
            //x?.setTitle("", for: .normal)
            x?.isEnabled = false
        }
        
    }
    
}

