//
//  AhurufViewController.swift
//  BacaLexia
//
//  Created by Adri Nofrianto on 05/11/20.
//

import UIKit
import AVFoundation
import Speech

class AhurufViewController: UIViewController {
    
    var bunyiHuruf : AVAudioPlayer!
    var huruf : String = ""
    var stringListen : String = ""
    var isMascotShow: Bool = false
    
    
    var recognizer = SFSpeechRecognizer()
    var request = SFSpeechAudioBufferRecognitionRequest()
    let engine = AVAudioEngine()
    var selamat = UILabel()
    
    var state: Int = 0
    
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var arrowButton: UIImageView!
    @IBOutlet weak var hurufImage: UIImageView!
    @IBOutlet weak var bantuanBoard: UIImageView!
    @IBOutlet weak var nameBoard: UIImageView!
    @IBOutlet weak var nextActivity: UIImageView!
    @IBOutlet weak var prevActivity: UIImageView!
    @IBOutlet weak var maskot: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backToPilihHuruf()
        pilihPic()
        mendengar()
        goToNextActivity()
        bantuanDisplay()
        backgroundTap()
        //updateView()
        nameBoard.image = #imageLiteral(resourceName: "mendengarBoard")
    }
    
    func animationfromRight(){
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func animationfromLeft(){
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.linear)
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        bunyiHuruf = try! AVAudioPlayer(contentsOf: url!)
        bunyiHuruf.play()
    }
    
    func backToPilihHuruf(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backimageTapped))
        arrowButton.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        arrowButton.addGestureRecognizer(gesture)
    }
    
    func goToNextActivity(){
        goToPrevActivity()
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(nextActivityTapped))
        nextActivity.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        nextActivity.addGestureRecognizer(gesture)
    }
    func goToPrevActivity(){
        
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(prevActivityTapped))
        prevActivity.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        prevActivity.addGestureRecognizer(gesture)
    }
    func bantuanDisplay(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(maskotTapped))
        maskot.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        maskot.addGestureRecognizer(gesture)
    }
    func mendengar(){
        
        if state == 0{
            let gestureDengar =  UITapGestureRecognizer(target: self, action: #selector(hurufImageTapped))
            hurufImage.isUserInteractionEnabled = true
            gestureDengar.numberOfTapsRequired = 1
            hurufImage.addGestureRecognizer(gestureDengar)
        }else if state == 1{
            let gestureDengar =  UITapGestureRecognizer(target: self, action: #selector(hurufImageLongTapped))
            hurufImage.isUserInteractionEnabled = true
            gestureDengar.numberOfTapsRequired = 1
            hurufImage.addGestureRecognizer(gestureDengar)
        }
        
    }
    func backgroundTap(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backgroundImageTapped))
        background.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        background.addGestureRecognizer(gesture)
    }
    
    
    func pilihPic(){
        if huruf == "A"{
            hurufImage.image = #imageLiteral(resourceName: "a")
        }else if huruf == "I"{
            hurufImage.image = #imageLiteral(resourceName: "i")
        }else if huruf == "O" {
            hurufImage.image = #imageLiteral(resourceName: "o")
        }else if huruf == "U"{
            hurufImage.image = #imageLiteral(resourceName: "u")
        }else if huruf == "E"{
            hurufImage.image = #imageLiteral(resourceName: "e")
        }else if huruf == "O"{
            hurufImage.image = #imageLiteral(resourceName: "o")
        }else if huruf == "B"{
            hurufImage.image = #imageLiteral(resourceName: "b")
        }else if huruf == "C"{
            hurufImage.image = #imageLiteral(resourceName: "c")
        }else if huruf == "D"{
            hurufImage.image = #imageLiteral(resourceName: "d")
        }else if huruf == "F"{
            hurufImage.image = #imageLiteral(resourceName: "f")
        }else if huruf == "G"{
            hurufImage.image = #imageLiteral(resourceName: "g")
        }else if huruf == "H"{
            hurufImage.image = #imageLiteral(resourceName: "h")
        }else if huruf == "J"{
            hurufImage.image = #imageLiteral(resourceName: "j")
        }else if huruf == "K"{
            hurufImage.image = #imageLiteral(resourceName: "k")
        }else if huruf == "L"{
            hurufImage.image = #imageLiteral(resourceName: "l")
        }else if huruf == "M"{
            hurufImage.image = #imageLiteral(resourceName: "m")
        }else if huruf == "N"{
            hurufImage.image = #imageLiteral(resourceName: "n")
        }else if huruf == "P"{
            hurufImage.image = #imageLiteral(resourceName: "p")
        }else if huruf == "Q"{
            hurufImage.image = #imageLiteral(resourceName: "q")
        }else if huruf == "R"{
            hurufImage.image = #imageLiteral(resourceName: "r")
        }else if huruf == "S"{
            hurufImage.image = #imageLiteral(resourceName: "s")
        }else if huruf == "T"{
            hurufImage.image = #imageLiteral(resourceName: "t")
        }
        else if huruf == "V"{
            hurufImage.image = #imageLiteral(resourceName: "v")
        }else if huruf == "W"{
            hurufImage.image = #imageLiteral(resourceName: "w")
        }else if huruf == "X"{
            hurufImage.image = #imageLiteral(resourceName: "x")
        }else if huruf == "Y"{
            hurufImage.image = #imageLiteral(resourceName: "y")
        }else if huruf == "Z"{
            hurufImage.image = #imageLiteral(resourceName: "z")
        }else if huruf == ""{
            hurufImage.image = nil
        }
        
    }
    
    @objc func backimageTapped(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "PilihV", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PilihVViewController") as! PilihVViewController
        animationfromLeft()
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
        }else if huruf == "B"{
            playSound(soundName: "O")
        } else if huruf == "C"{
            playSound(soundName: "I")
        } else if huruf == "D"{
            playSound(soundName: "E")
        } else if huruf == "F"{
            playSound(soundName: "U")
        }else if huruf == "G"{
            playSound(soundName: "O")
        } else if huruf == "H"{
            playSound(soundName: "I")
        } else if huruf == "J"{
            playSound(soundName: "E")
        } else if huruf == "K"{
            playSound(soundName: "U")
        }else if huruf == "L"{
            playSound(soundName: "O")
        } else if huruf == "M"{
            playSound(soundName: "I")
        } else if huruf == "N"{
            playSound(soundName: "E")
        }else if huruf == "P"{
            playSound(soundName: "A")
        } else if huruf == "Q"{
            playSound(soundName: "O")
        } else if huruf == "R"{
            playSound(soundName: "I")
        } else if huruf == "S"{
            playSound(soundName: "E")
        } else if huruf == "T"{
            playSound(soundName: "U")
        }else if huruf == "V"{
            playSound(soundName: "O")
        } else if huruf == "W"{
            playSound(soundName: "I")
        } else if huruf == "X"{
            playSound(soundName: "E")
        } else if huruf == "Y"{
            playSound(soundName: "U")
        }else if huruf == "Z"{
            playSound(soundName: "O")
        }
        //   bantuanBoard.image = nil
    }
    
    @objc func prevActivityTapped(){
        state = 0
        nameBoard.image = #imageLiteral(resourceName: "mendengarBoard")
        playSound(soundName: "mendengarkan")
        bantuanBoard.image = nil
        prevActivity.isHidden = true
        self.hurufImage.alpha = 1
        selamat.isHidden = true
        selamat.alpha = 0
        view.willRemoveSubview(selamat)
        selamat.removeFromSuperview()
        
    }
    
    @objc func nextActivityTapped(){
        
        if(state == 0){
            state = 1
//            prevActivity.isHidden = false
            nameBoard.image = #imageLiteral(resourceName: "mengucapBoard")
            playSound(soundName: "mengucapkan")
//            prevActivity.image = #imageLiteral(resourceName: "arrow2")
            bantuanBoard.image = nil
            mendengar()
        } else if (state == 1){
            let storyBoard: UIStoryboard = UIStoryboard(name: "MenulisA", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "MenulisA") as! MenulisAViewController
            animationfromRight()
            newViewController.modalPresentationStyle = .fullScreen
            newViewController.huruf = huruf
            self.present(newViewController, animated: false, completion: nil)
        }
    }
    @objc func backgroundImageTapped(){
        bantuanBoard.image = nil
    }
    
    @objc func maskotTapped(){
        if(state == 0){
            isMascotShow.toggle()
            if(isMascotShow) {
                bantuanBoard.image = #imageLiteral(resourceName: "tekanGelembungDengar")
                playSound(soundName: "instruksiDengar")
            }else{
                bantuanBoard.image = nil
            }
            
        } else if(state == 1) {isMascotShow.toggle()
            if(isMascotShow) {
                bantuanBoard.image = #imageLiteral(resourceName: "tekanGelembungUcapkan")
                playSound(soundName: "instruksiUcap")
            }
            else{
                bantuanBoard.image = nil
            }
        }
        
    }
    
}

