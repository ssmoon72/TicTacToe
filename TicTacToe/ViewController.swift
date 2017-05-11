//
//  ViewController.swift
//  TicTacToe
//
//  Created by Samuel Moon on 5/11/17.
//  Copyright © 2017 Samuel Moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    var turn = 1
    var grid = [0,0,0,
                0,0,0,
                0,0,0]
    
    func checkGameForWin(grid: [Int]) -> Int? {
        let winCondition = [[0,1,2],
                            [3,4,5],
                            [6,7,8],
                            [0,3,6],
                            [1,4,7],
                            [2,5,8],
                            [0,4,8],
                            [2,4,6]]
        for line in winCondition {
            if grid[line[0]] != 0 && grid[line[0]] == grid[line[1]] && grid[line[1]] == grid[line[2]] {
                return grid[line[0]]
            }
        }
        return nil
    }
    
    @IBAction func squareButtonPressed(_ sender: UIButton) {
        if turn == 1 && grid[sender.tag-1] == 0 {
            sender.backgroundColor = UIColor.blue
            grid[sender.tag-1] = turn
            print(grid)
            turn = 2
        }
        else if turn == 2 && grid[sender.tag-1] == 0{
            sender.backgroundColor = UIColor.red
            grid[sender.tag-1] = turn
            print(grid)
            turn = 1
        }
        if let gameWinner = checkGameForWin(grid: grid){
            if gameWinner == 1 {
                winnerLabel.isHidden = false
                winnerLabel.text = "Blue Wins!"
                grid = [1,1,1,
                        1,1,1,
                        1,1,1]
            }
            else {
                winnerLabel.isHidden = false
                winnerLabel.text = "Red Wins!"
                grid = [1,1,1,
                        1,1,1,
                        1,1,1]
            }
        }


    }

    @IBAction func resetButtonPressed(_ sender: Any) {
        print("reset pressed")
        buttonOne.backgroundColor = UIColor.lightGray
        buttonTwo.backgroundColor = UIColor.lightGray
        buttonThree.backgroundColor = UIColor.lightGray
        buttonFour.backgroundColor = UIColor.lightGray
        buttonFive.backgroundColor = UIColor.lightGray
        buttonSix.backgroundColor = UIColor.lightGray
        buttonSeven.backgroundColor = UIColor.lightGray
        buttonEight.backgroundColor = UIColor.lightGray
        buttonNine.backgroundColor = UIColor.lightGray
        turn = 1
        grid = [0,0,0,
                0,0,0,
                0,0,0]
        winnerLabel.isHidden = true
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

