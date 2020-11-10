//
//  PilihKonsViewController.swift
//  BacaLexia
//
//  Created by Adri Nofrianto on 10/11/20.
//

import UIKit
import AVFoundation

class PilihKonsViewController: UIViewController {
    
    var bunyiPopUp: AVAudioPlayer!
    var bunyiOne: AVAudioPlayer!
    
    var selectedArrayOfConsonant = [String]()
    var arrayOfConsonantOne = ["B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N"]
    var arrayOfConsonantTwo = ["P", "Q", "R", "S", "T", "V", "W", "X", "Y", "Z", ""]
    
    var isMascotShow: Bool = false
    
    var state: Int = 0
    
    @IBOutlet weak var arrowButton: UIImageView!
    @IBOutlet weak var bButton: UIImageView!
    @IBOutlet weak var cButton: UIImageView!
    @IBOutlet weak var dButton: UIImageView!
    @IBOutlet weak var fButton: UIImageView!
    @IBOutlet weak var gButton: UIImageView!
    @IBOutlet weak var hButton: UIImageView!
    @IBOutlet weak var jButton: UIImageView!
    @IBOutlet weak var kButton: UIImageView!
    @IBOutlet weak var lButton: UIImageView!
    @IBOutlet weak var mButton: UIImageView!
    @IBOutlet weak var nButton: UIImageView!
    @IBOutlet weak var nextActivity: UIImageView!
    @IBOutlet weak var prevActivity: UIImageView!
    @IBOutlet weak var maskot: UIButton!
    
    override func viewDidLoad() {
    super.viewDidLoad()
        self.selectedArrayOfConsonant = arrayOfConsonantOne
        goToNextActivity()
        backToPilihHuruf()
    
    let gestureB =  UITapGestureRecognizer(target: self, action: #selector(imageBTapped))
    bButton.isUserInteractionEnabled = true
    gestureB.numberOfTapsRequired = 1
    bButton.addGestureRecognizer(gestureB)
    
    let gestureC =  UITapGestureRecognizer(target: self, action: #selector(imageCTapped))
    cButton.isUserInteractionEnabled = true
    gestureC.numberOfTapsRequired = 1
    cButton.addGestureRecognizer(gestureC)
    
    let gestureD =  UITapGestureRecognizer(target: self, action: #selector(imageDTapped))
    dButton.isUserInteractionEnabled = true
    gestureD.numberOfTapsRequired = 1
    dButton.addGestureRecognizer(gestureD)
    
    let gestureF =  UITapGestureRecognizer(target: self, action: #selector(imageFTapped))
    fButton.isUserInteractionEnabled = true
    gestureF.numberOfTapsRequired = 1
    fButton.addGestureRecognizer(gestureF)
    
    let gestureG =  UITapGestureRecognizer(target: self, action: #selector(imageGTapped))
    gButton.isUserInteractionEnabled = true
    gestureG.numberOfTapsRequired = 1
    gButton.addGestureRecognizer(gestureG)
    
    let gestureH =  UITapGestureRecognizer(target: self, action: #selector(imageHTapped))
    hButton.isUserInteractionEnabled = true
    gestureH.numberOfTapsRequired = 1
    hButton.addGestureRecognizer(gestureH)

    let gestureJ =  UITapGestureRecognizer(target: self, action: #selector(imageJTapped))
    jButton.isUserInteractionEnabled = true
    gestureJ.numberOfTapsRequired = 1
    jButton.addGestureRecognizer(gestureJ)
    
    let gestureK =  UITapGestureRecognizer(target: self, action: #selector(imageKTapped))
    kButton.isUserInteractionEnabled = true
    gestureK.numberOfTapsRequired = 1
    kButton.addGestureRecognizer(gestureK)
    
    let gestureL =  UITapGestureRecognizer(target: self, action: #selector(imageLTapped))
    lButton.isUserInteractionEnabled = true
    gestureL.numberOfTapsRequired = 1
    lButton.addGestureRecognizer(gestureL)
    
    let gestureM =  UITapGestureRecognizer(target: self, action: #selector(imageMTapped))
    mButton.isUserInteractionEnabled = true
    gestureM.numberOfTapsRequired = 1
    mButton.addGestureRecognizer(gestureM)
    
    let gestureN =  UITapGestureRecognizer(target: self, action: #selector(imageNTapped))
    nButton.isUserInteractionEnabled = true
    gestureN.numberOfTapsRequired = 1
    nButton.addGestureRecognizer(gestureN)
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

func animationfromRight(){
    let transition = CATransition()
    transition.duration = 0.5
    transition.type = CATransitionType.fade
    transition.subtype = CATransitionSubtype.fromRight
    transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
    view.window!.layer.add(transition, forKey: kCATransition)
}
    func backToPilihHuruf(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backimageTapped))
        arrowButton.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        arrowButton.addGestureRecognizer(gesture)
    }
    @objc func backimageTapped(){
        
        animationfromRight()
     //  playSound(soundName: "pilihlahHuruf")
     //   bantuanBoard.image = nil
        dismiss(animated: true, completion: nil)
        
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
    

//Func Image Tappped
@objc func imageBTapped(){
    
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[0]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)
    
}
@objc func imageCTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[1]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)
}
@objc func imageDTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[2]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)

}
@objc func imageFTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[3]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)

}
@objc func imageGTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()

    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[4]
    newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: false, completion: nil)

}
@objc func imageHTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[5]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)
    
}
@objc func imageJTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[6]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)
}
@objc func imageKTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[7]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)

}
@objc func imageLTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[8]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)

}
@objc func imageMTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()
    
    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[9]
    newViewController.modalPresentationStyle = .fullScreen
    self.present(newViewController, animated: false, completion: nil)

}
@objc func imageNTapped(){
    playSoundFalse()
    animationfromRight()
    playSoundTrue()

    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
    newViewController.huruf = selectedArrayOfConsonant[10]
    newViewController.modalPresentationStyle = .fullScreen
            self.present(newViewController, animated: false, completion: nil)

}
    @objc func prevActivityTapped(){
        self.selectedArrayOfConsonant = arrayOfConsonantOne
        state = 0
        bButton.image = #imageLiteral(resourceName: "b")
        cButton.image = #imageLiteral(resourceName: "c")
        dButton.image = #imageLiteral(resourceName: "d")
        fButton.image = #imageLiteral(resourceName: "f")
        gButton.image = #imageLiteral(resourceName: "g")
        hButton.image = #imageLiteral(resourceName: "h")
        jButton.image = #imageLiteral(resourceName: "j")
        kButton.image = #imageLiteral(resourceName: "k")
        lButton.image = #imageLiteral(resourceName: "l")
        nButton.image = #imageLiteral(resourceName: "n")
        mButton.image = #imageLiteral(resourceName: "m")
        
        
       // nameBoard.image = #imageLiteral(resourceName: "board")
      //  playSound(soundName: "mendengarkan")
      //  bantuanBoard.image = nil
    }
    @objc func nextActivityTapped(){
        self.selectedArrayOfConsonant = arrayOfConsonantTwo
        state = 1
        bButton.image = #imageLiteral(resourceName: "p")
        cButton.image = #imageLiteral(resourceName: "q")
        dButton.image = #imageLiteral(resourceName: "r")
        fButton.image = #imageLiteral(resourceName: "s")
        gButton.image = #imageLiteral(resourceName: "t")
        hButton.image = #imageLiteral(resourceName: "v")
        jButton.image = #imageLiteral(resourceName: "w")
        kButton.image = #imageLiteral(resourceName: "x")
        lButton.image = #imageLiteral(resourceName: "y")
        mButton.image = #imageLiteral(resourceName: "z")
        nButton.image = nil
       // nameBoard.image = #imageLiteral(resourceName: "Text Box")
      //  playSound(soundName: "mengucapkan")
        prevActivity.image = #imageLiteral(resourceName: "arrow2")
       // bantuanBoard.image = nil
    }
    
    
}
