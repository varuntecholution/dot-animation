//
//  ViewController.swift
//  DottedAnimation
//
//  Created by Varun Sharma on 28/08/23.
//

import UIKit

class ViewController: UIViewController {

   // @IBOutlet weak var dotsStackView: UIStackView!
//    @IBOutlet weak var dotsStackView: UIStackView!
    
    let dotsStackView = UIStackView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
                dotsStackView.axis = .horizontal
                dotsStackView.distribution = .fillEqually
        view.addSubview(dotsStackView)
        dotsStackView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    dotsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    dotsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    dotsStackView.widthAnchor.constraint(equalTo: dotsStackView.heightAnchor, multiplier: 4, constant: 40), // Aspect ratio of 1:4
                    dotsStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1) // 10% of the view's height
                ])
        
        setupDots()
        startProgressAnimation()
        
        
    }

    
    func setupDots() {
            for _ in 0..<4 {
                let dotView = UIView()
                dotView.backgroundColor = .gray
                
                dotsStackView.addArrangedSubview(dotView)
                dotView.translatesAutoresizingMaskIntoConstraints = false
                dotView.widthAnchor.constraint(equalTo: dotsStackView.heightAnchor, multiplier: 1).isActive = true
                dotView.heightAnchor.constraint(equalTo: dotsStackView.heightAnchor, multiplier: 1).isActive = true
                dotView.layer.cornerRadius = view.frame.height*0.1/2
            }
        
        dotsStackView.spacing = 10
        
        dotsStackView.distribution = .equalSpacing
        }

    func updateDotColors(at index: Int) {
            for i in 0..<dotsStackView.arrangedSubviews.count {
                let dotView = dotsStackView.arrangedSubviews[i]
                dotView.backgroundColor = i == index ? .cyan : .gray
            }
        }
    
    
    func startProgressAnimation() {
            var currentIndex = 0
            let animationDuration: TimeInterval = 0.5
            
            Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: true) { timer in
                self.updateDotColors(at: currentIndex)
                currentIndex = (currentIndex + 1) % self.dotsStackView.arrangedSubviews.count
            }
        }
    
   
        

}


