//
//  PilihVViewController.swift
//  BacaLexia
//
//  Created by Adri Nofrianto on 05/11/20.
//

import UIKit
import AVFoundation

class PilihVViewController: UIViewController {

    @IBOutlet weak var aButton: UIImageView!
    
    @IBOutlet weak var iButton: UIImageView!
    
    @IBOutlet weak var eButton: UIImageView!
    
    @IBOutlet weak var oButton: UIImageView!
    
    @IBOutlet weak var uButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(imageaTapped))
        aButton.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        aButton.addGestureRecognizer(gesture)
        
        let gestureO =  UITapGestureRecognizer(target: self, action: #selector(imageoTapped))
        oButton.isUserInteractionEnabled = true
        gestureO.numberOfTapsRequired = 1
        oButton.addGestureRecognizer(gestureO)
        
        let gestureU =  UITapGestureRecognizer(target: self, action: #selector(imageuTapped))
        uButton.isUserInteractionEnabled = true
        gestureU.numberOfTapsRequired = 1
        uButton.addGestureRecognizer(gestureU)
        
        let gestureI =  UITapGestureRecognizer(target: self, action: #selector(imageiTapped))
        iButton.isUserInteractionEnabled = true
        gestureI.numberOfTapsRequired = 1
        iButton.addGestureRecognizer(gestureI)
        
        let gestureE =  UITapGestureRecognizer(target: self, action: #selector(imageeTapped))
        eButton.isUserInteractionEnabled = true
        gestureE.numberOfTapsRequired = 1
        eButton.addGestureRecognizer(gestureE)

    }

    @objc func imageaTapped(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "A"
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)
        
    }
    @objc func imageoTapped(){
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "O"
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)
    }
    @objc func imageuTapped(){
        
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "U"
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)

    }
    @objc func imageiTapped(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "I"
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)

    }
    @objc func imageeTapped(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "E"
        newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: false, completion: nil)

    }
}
