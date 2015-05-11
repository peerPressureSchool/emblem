//
//  CardsViewController.swift
//  Emelem
//
//  Created by Jared Mermey on 5/4/15.
//  Copyright (c) 2015 Jared Mermey. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, SwipeViewDelegate {

    struct Card {
        let cardView: CardView
        let swipeView: SwipeView
    }
    
    let frontCardTopMargin: CGFloat = 0
    let backCardTopMargin: CGFloat = 10
    
    @IBOutlet weak var cardStackView: UIView!
    
    var backCard: Card?
    var frontCard: Card?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardStackView.backgroundColor = UIColor.clearColor()
        
        //user createCardFrame function to make back and front cards as instances of Card struc
        backCard = createCard(backCardTopMargin)
        cardStackView.addSubview(backCard!.swipeView)
        frontCard = createCard(frontCardTopMargin)
        cardStackView.addSubview(frontCard!.swipeView)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //function to create card. The Y is the slight offset for the backCard
    private func createCardFrame(topMargin: CGFloat) -> CGRect{
        return CGRect(x: 0, y: topMargin, width: cardStackView.frame.width, height: cardStackView.frame.height)
    }
    
    //helper function create cards
    private func createCard(topMargin: CGFloat) -> Card{
        let cardView = CardView()
        let swipeView = SwipeView(frame: createCardFrame(topMargin))
        swipeView.delegate = self
        swipeView.innerView = cardView
        return Card(cardView: cardView, swipeView: swipeView)
    }
    
    
    //SwipeViewDelegate functions
    
    func swipedLeft() {
        println("left")
        if let frontCard = frontCard {
            frontCard.swipeView.removeFromSuperview()
        }
    }
    
    func swipedRight() {
        println("right")
        if let frontCard = frontCard {
            frontCard.swipeView.removeFromSuperview()
        }
    }
}
