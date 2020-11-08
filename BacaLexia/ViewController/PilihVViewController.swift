//
//  PilihVViewController.swift
//  BacaLexia
//
//  Created by Adri Nofrianto on 05/11/20.
//

import UIKit
import AVFoundation

class PilihVViewController: UIViewController {
    
    var bunyiPopUp: AVAudioPlayer!
    var bunyiOne: AVAudioPlayer!
    

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
    
    func animationfromRight(){
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
        
   /* func playSound(saundName:String) {
        let url = Bundle.main.url(forResource: saundName ,withExtension: "wav")
        bunyiPopUp = try! AVAudioPlayer(contentsOf: url!)
        bunyiPopUp.play()  */
        
    func playSoundFalse() {
            guard let url = Bundle.main.url(forResource: "A", withExtension: "wav") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                bunyiPopUp = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                guard let player = bunyiPopUp else { return }

                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
        
        func playSoundTrue() {
            guard let url = Bundle.main.url(forResource: "mendengarkan", withExtension: "wav") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                bunyiOne = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                guard let player = bunyiOne else { return }

                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
        
    
    @objc func imageaTapped(){
        
        
        playSoundFalse()
        
        animationfromRight()
        
        playSoundTrue()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "A"
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)
        
    }
    @objc func imageoTapped(){
        playSoundFalse()
        
        animationfromRight()
        
        playSoundTrue()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "O"
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)
    }
    @objc func imageuTapped(){
        playSoundFalse()
        
        animationfromRight()
        
        playSoundTrue()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "U"
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)

    }
    @objc func imageiTapped(){
        playSoundFalse()
        
        animationfromRight()
        
        playSoundTrue()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "I"
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)

    }
    @objc func imageeTapped(){
        playSoundFalse()
        
        animationfromRight()
        
        playSoundTrue()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
        newViewController.huruf = "E"
        newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: false, completion: nil)

    }
}
