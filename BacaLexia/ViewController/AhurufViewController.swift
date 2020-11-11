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
    var huruf : String = ""
    var isMascotShow: Bool = false
    
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
        
    }

    func animationfromRight(){
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
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
        let gestureDengar =  UITapGestureRecognizer(target: self, action: #selector(hurufImageTapped))
        hurufImage.isUserInteractionEnabled = true
        gestureDengar.numberOfTapsRequired = 1
        hurufImage.addGestureRecognizer(gestureDengar)
        
    }
    func backgroundTap(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backgroundImageTapped))
        background.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        background.addGestureRecognizer(gesture)
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
        }else if huruf == "O"{
            hurufImage.image = #imageLiteral(resourceName: "u")
        }
    }

    @objc func backimageTapped(){
        
        animationfromRight()
       playSound(soundName: "pilihlahHuruf")
        bantuanBoard.image = nil
        
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
        bantuanBoard.image = nil
    }
    
    @objc func nextActivityTapped(){
        state += 1
            if state == 1 {
            nameBoard.image = #imageLiteral(resourceName: "Text Box")
            playSound(soundName: "mengucapkan")
            prevActivity.image = #imageLiteral(resourceName: "arrow2")
            bantuanBoard.image = nil
            }
            else if state == 2 {
                if huruf == "A"{

                        let storyBoard: UIStoryboard = UIStoryboard(name: "MenulisA", bundle: nil)
                        
                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MenulisA") as! MenulisAViewController
                
                        newViewController.huruf = "A"

                        newViewController.modalPresentationStyle = .fullScreen
                            self.present(newViewController, animated: false, completion: nil)


                } else if huruf == "O"{

                        let storyBoard: UIStoryboard = UIStoryboard(name: "MenulisA", bundle: nil)

                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MenulisA") as! MenulisAViewController
                    
                    newViewController.huruf = "O"

                    newViewController.modalPresentationStyle = .fullScreen
                    self.present(newViewController, animated: false, completion: nil)


                } else if huruf == "I"{

                        let storyBoard: UIStoryboard = UIStoryboard(name: "MenulisA", bundle: nil)

                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MenulisA") as! MenulisAViewController


                        newViewController.huruf = "I"
                    
                        newViewController.modalPresentationStyle = .fullScreen
                            self.present(newViewController, animated: false, completion: nil)


                } else if huruf == "E"{

                        let storyBoard: UIStoryboard = UIStoryboard(name: "MenulisA", bundle: nil)

                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MenulisA") as! MenulisAViewController


                    newViewController.huruf = "E"
                    
                        newViewController.modalPresentationStyle = .fullScreen
                            self.present(newViewController, animated: false, completion: nil)



                } else if huruf == "U"{

                        let storyBoard: UIStoryboard = UIStoryboard(name: "MenulisA", bundle: nil)

                        let newViewController = storyBoard.instantiateViewController(withIdentifier: "MenulisA") as! MenulisAViewController


                    newViewController.huruf = "U"

                        newViewController.modalPresentationStyle = .fullScreen
                            self.present(newViewController, animated: false, completion: nil)


                }
            }
        
//
//        let vc = storyboard? .instantiateViewController(identifier: "MenulisA") as! MenulisAViewController
//
    }
    @objc func backgroundImageTapped(){
        bantuanBoard.image = nil
    }
    @objc func prevActivityTapped(){
        state = 0
        nameBoard.image = #imageLiteral(resourceName: "board")
        playSound(soundName: "mendengarkan")
        bantuanBoard.image = nil
    }
    @objc func maskotTapped(){
        if(state == 0){
            isMascotShow.toggle()
            if(isMascotShow) {
                bantuanBoard.image = #imageLiteral(resourceName: "Text Box")
                playSound(soundName: "intruksiDengar")
            }else{
                bantuanBoard.image = nil
            }
           
        } else if(state == 1) {isMascotShow.toggle()
            if(isMascotShow) {
                bantuanBoard.image = #imageLiteral(resourceName: "board")
                playSound(soundName: "intruksiUcap")
        }else{
            bantuanBoard.image = nil
        }
    }
    
    }
}
