//
//  ViewController.swift
//  RPSGame
//
//  Created by Conor Keohane
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var computorLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetBoard()
    }
    
    func resetBoard() { // is a func as will be run many times
        computorLabel.text = "🤖"
        statusLabel.text = "Rock, Paper Scissors?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false 
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isEnabled = true
    }
    
    func play(_ playerTurn: Sign) {
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        let opponent = randomSign()
        computorLabel.text = opponent.emoji
        
        let gameResult = playerTurn.takeTurn(opponent)
        
        switch gameResult {
        case.draw:
            statusLabel.text = "It's a draw"
            view.backgroundColor = .yellow
        case.lose:
            statusLabel.text = "Maybe Next Time"
            view.backgroundColor = .red
        case.win:
            statusLabel.text = "You win"
            view.backgroundColor = .green
            
        case.start:
            statusLabel.text = "Rock, Paper, Scissors"
        }
        
        switch playerTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case.paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            
        
        }
        
        playAgainButton.isHidden = false
    }
    

    @IBAction func playAginSelected(_ sender: Any) {
        resetBoard()
    }
    
    @IBAction func rockSelected(_ sender: Any) {
        play(Sign.rock)
    }
    
    @IBAction func paperSelected(_ sender: Any) {
        play(Sign.paper)
    }
    
    @IBAction func scissorsSelected(_ sender: Any) {
        play(Sign.scissors)
    }
    @IBAction func playAgainSelected(_ sender: Any) {
    }
}


