//
//  MainViewController.swift
//  BacaLexia
//
//  Created by Adri Nofrianto on 06/11/20.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    var bunyiPopUp: AVAudioPlayer!
    var bunyiOne: AVAudioPlayer!
    var isMascotShow: Bool = false
   
    @IBOutlet weak var xxButton: UIImageView!
    @IBOutlet weak var panduanMain: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var vocalButton: UIImageView!
    @IBOutlet weak var konsonanButton: UIImageView!
    @IBOutlet weak var bantuanBoard: UIImageView!
    var btn1 : UIView!
    
    @IBOutlet weak var maskot: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bantuanDisplay()
        xButtonAction()
        btn1 = UIView(frame: vocalButton.frame)
        btn1.center = vocalButton.center
        btn1.alpha = 0.1
        
        animationBuble()
        
        let gestureVocal =  UITapGestureRecognizer(target: self, action: #selector(imageVocalTapped))
        btn1.isUserInteractionEnabled = true
        gestureVocal.numberOfTapsRequired = 1
        btn1.addGestureRecognizer(gestureVocal)
        view.addSubview(btn1)
        
        let gestureKonsonan =  UITapGestureRecognizer(target: self, action: #selector(imageKonsonanTapped))
        konsonanButton.isUserInteractionEnabled = true
        gestureKonsonan.numberOfTapsRequired = 1
        konsonanButton.addGestureRecognizer(gestureKonsonan)
        
    }
    
    
    func animationBuble(){
        let a = CGFloat.random(in: 10...20)
        let b = CGFloat.random(in: 10...20)
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear]) {
            self.vocalButton.center.y = self.vocalButton.center.y + a
            self.vocalButton.center.x = self.vocalButton.center.x + b
        } completion: { (sucesss) in
            UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear]) {
                self.vocalButton.center.y = self.vocalButton.center.y - a
                self.vocalButton.center.x = self.vocalButton.center.x - b
            } completion: { (sucesss) in
                self.animationBuble()
            }
        }
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
        
    
    @objc func imageVocalTapped(){
        
        
       playSoundFalse()
        animationfromRight()
      //  playSoundTrue()
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "PilihV", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PilihVViewController") as! PilihVViewController
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)
        }
   
    @objc func imageKonsonanTapped(){
        
//        playSoundFalse()
//        animationfromRight()
//     //   playSoundTrue()
//
//        let storyBoard: UIStoryboard = UIStoryboard(name: "PilihKons", bundle: nil)
//
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PilihKonsViewController") as! PilihKonsViewController
//        newViewController.modalPresentationStyle = .fullScreen
//        self.present(newViewController, animated: false, completion: nil)
        }
    
    func backgroundTap(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backgroundImageTapped))
        background.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        background.addGestureRecognizer(gesture)
    }
    @objc func backgroundImageTapped(){
        panduanMain.image = nil
        xxButton.image = nil
    }
    func bantuanDisplay(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(maskotTapped))
        maskot.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        maskot.addGestureRecognizer(gesture)
    }
    func xButtonAction(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(xxButtonTapped))
        xxButton.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        xxButton.addGestureRecognizer(gesture)
        
    }
    @objc func xxButtonTapped(){
        
        panduanMain.image = nil
        xxButton.image = nil
    }
    
    @objc func maskotTapped(){
            isMascotShow.toggle()
            if(isMascotShow) {
                panduanMain.image = #imageLiteral(resourceName: "panduanMainMenu")
                xxButton.image = #imageLiteral(resourceName: "xButton")
                
        //        playSound(soundName: "intruksiDengar")
            }else{
                bantuanBoard.image = nil
            }
           
    
    }
    
    
}

