//
//  ViewController.swift
//  DevDestiny
//
//  Created by Евгений Фомин on 24.06.2024.
//

import UIKit
import Shuffle


class ViewController: UIViewController, SwipeCardStackDelegate, SwipeCardStackDataSource {
  
    @IBOutlet weak var doMagicButton: UIButton!
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBOutlet weak var doSomeMagicAgainButton: UIButton!
    
    @IBOutlet weak var effects: UIVisualEffectView!
    
    
    private let cardStack = SwipeCardStack()
    private var cardModels: [UIImage] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextField.isHidden = true
        loadCardModels()
        cardStack.delegate = self
        cardStack.dataSource = self
        doSomeMagicAgainButton.isHidden = true
    }
    

    @IBAction func doSomeMagicAgainButtonTapped(_ sender: Any) {
        cardStack.reloadData()
        print("meow")
        doMagicButton.isHidden = false
        descriptionTextField.isHidden = true
        doSomeMagicAgainButton.isHidden = true
        
    }
    
    @IBAction func doMagicTapped(_ sender: Any) {
        doMagicButton.isHidden = true
        view.addSubview(cardStack)
        cardStack.frame = view.safeAreaLayoutGuide.layoutFrame
    }
    
    
    private func loadCardModels() {
          if let image1 = UIImage(named: "card.png"),
             let image2 = UIImage(named: "card.png"),
             let image3 = UIImage(named: "card.png") {
              cardModels = [image1, image2, image3]
          }
      }
    
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let image = cardModels[index % cardModels.count]
        let card = CustomCard(image: image)
        return card

    }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return cardModels.count 
    }
    
    func getPrediction(){
        descriptionTextField.text = """
        Шут (The Fool):
        Новый этап, неожиданные изменения. 
        Будьте открыты для возможностей и рисков.

        Маг (The Magician):
        Все необходимые навыки и ресурсы у вас есть. 
        Используйте их творчески и уверенно.

        Верховная жрица (The High Priestess):
        Прислушивайтесь к интуиции, 
        анализируйте скрытые проблемы,
        не торопитесь.

        Итог:
        Открытость к новому, уверенность в своих силах и интуитивное понимание помогут успешно провести релиз. Будьте готовы к неожиданностям и используйте свои ресурсы на полную мощность.
"""
    }
    
    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
            
            getPrediction()
            descriptionTextField.isHidden = false
            doSomeMagicAgainButton.isHidden = false
            cardStack.removeFromSuperview()
        }


}

