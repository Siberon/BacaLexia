//
//  AhurufViewController.swift
//  BacaLexia
//
//  Created by Adri Nofrianto on 05/11/20.
//

import UIKit
import AVFoundation



class AhurufViewController: UIViewController {
    
    var bunyiHuruf : AVAudioPlayer!

    @IBOutlet weak var arrowButton: UIImageView!
    var huruf : String = ""
    @IBOutlet weak var hurufImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        back()
        pilihPic()
        mendengar()
       
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        bunyiHuruf = try! AVAudioPlayer(contentsOf: url!)
        bunyiHuruf.play()
    }
    
    func back(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backimageTapped))
        arrowButton.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        arrowButton.addGestureRecognizer(gesture)
    }
    func mendengar(){
        let gestureDengar =  UITapGestureRecognizer(target: self, action: #selector(hurufImageTapped))
        hurufImage.isUserInteractionEnabled = true
        gestureDengar.numberOfTapsRequired = 1
        hurufImage.addGestureRecognizer(gestureDengar)
        
    }
    
    
    func pilihPic(){
        if huruf == "A"{
            hurufImage.image = #imageLiteral(resourceName: "a1")
        }else if huruf == "I"{
            hurufImage.image = #imageLiteral(resourceName: "i1")
        }else if huruf == "O" {
            hurufImage.image = #imageLiteral(resourceName: "o1")
        }else if huruf == "U"{
            hurufImage.image = #imageLiteral(resourceName: "u")
        }else if huruf == "E"{
            hurufImage.image = #imageLiteral(resourceName: "e")
        }
    }

    @objc func backimageTapped(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "PilihV", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PilihVViewController") as! PilihVViewController
        newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: false, completion: nil)
        
    }
    
    @objc func hurufImageTapped(){
        if huruf == "A"{
            playSound(soundName: "A")
        } else if huruf == "O"{
            playSound(soundName: "O")
        } else if huruf == "I"{
            playSound(soundName: "I")
        } else if huruf == "E"{
            playSound(soundName: "E")
        } else if huruf == "U"{
            playSound(soundName: "U")
        }
            
    }
}
