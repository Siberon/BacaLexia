//
//  MenulisAViewController.swift
//  BacaLexia
//
//  Created by Patrick Chuang on 04/11/20.
//

import UIKit
import AVFoundation
import PencilKit

class MenulisAViewController: UIViewController,PKCanvasViewDelegate,PKToolPickerObserver {
    

    @IBOutlet weak var mCanvas: PKCanvasView!
    @IBOutlet weak var TextBantuan: UIImageView!
    @IBOutlet weak var KoalaBtn: UIImageView!
    @IBOutlet weak var hurufImage: UIImageView!
    @IBOutlet weak var backButton: UIImageView!
    @IBOutlet weak var backActivityButton: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    var height :CGFloat = 500
    var width :CGFloat = 768
    
    var state: Int = 2
    
    var drawing = PKDrawing()
    var toolPicker : PKToolPicker!
    
    var huruf : String = ""

    override func viewDidLoad() {
        
        super.viewDidLoad()
        backToPrevActivity()
        backToPilihHuruf()
        checkAlphabets()
        ShowGuideSound()
        showguide()
        showCanvas()
        
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backimageTapped))
        gesture.numberOfTapsRequired = 1
        
        backButton.isUserInteractionEnabled = true
        backButton.addGestureRecognizer(gesture)
        
    }
    
    func backToPrevActivity(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(goToPrevActivity))
        gesture.numberOfTapsRequired = 1
        
        backActivityButton.isUserInteractionEnabled = true

        
        backActivityButton.addGestureRecognizer(gesture)
//        backButton.isUserInteractionEnabled = true
//        backButton.addGestureRecognizer(gesture)
//        dismiss(animated: true, completion: nil)
    }
    
    @objc func goToPrevActivity(){
        animationfromRight()
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
//
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
//        newViewController.huruf = huruf
//        newViewController.state = 1
//
//        newViewController.nameBoard.image = #imageLiteral(resourceName: "mengucapBoard")
//
//        newViewController.prevActivity.image = #imageLiteral(resourceName: "arrow2")
//        newViewController.bantuanBoard.image = nil
//        playSound(soundName: "mengucapkan")
//        newViewController.modalPresentationStyle = .fullScreen
//            self.present(newViewController, animated: false, completion: nil)
//
        dismiss(animated: true, completion: nil)
    }
    
    
    func animationfromRight(){
        let transition = CATransition()
        transition.duration = 1.0
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
    func backToPilihHuruf(){
     
        dismiss(animated: true, completion: nil)
        
    }
    
    @objc func backimageTapped(){
        animationfromRight()
        let storyBoard: UIStoryboard = UIStoryboard(name: "PilihV", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PilihVViewController") as! PilihVViewController
        
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: false, completion: nil)
    }

    func checkAlphabets() {
            if huruf == "A"{
                hurufImage.image = #imageLiteral(resourceName: "aMenulis")
            }else if huruf == "I"{
                hurufImage.image = #imageLiteral(resourceName: "iMenulis")
            }else if huruf == "U"{
                hurufImage.image = #imageLiteral(resourceName: "uMenulis")
            }else if huruf == "E"{
                hurufImage.image = #imageLiteral(resourceName: "eMenulis")
            }else if huruf == "O"{
                hurufImage.image = #imageLiteral(resourceName: "oMenulis")
            }
    }
    
    func ShowGuideSound(){
        let sound = Bundle.main.path(forResource: "ShowGuide", ofType: "m4a")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        
        catch {
            print(error)
        }
    }
    
    func showguide(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        KoalaBtn.isUserInteractionEnabled = true
        KoalaBtn.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.numberOfTapsRequired = 1
        }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        // let tappedImage = tapGestureRecognizer.view as! UIImageView
        // Your action
        
                if TextBantuan.isHidden == true {
                    
                    TextBantuan.isHidden = false
                    audioPlayer.play()
                    
                } else {
                
                    TextBantuan.isHidden = true
                    
                }
    }
    
    
    
    
    func showCanvas(){
        
//        self.mCanvas = PKCanvasView()
      
        self.mCanvas.delegate = self
        self.mCanvas.backgroundColor = .clear
        self.mCanvas.isOpaque = false
        self.mCanvas.tool = PKInkingTool(.marker, color: .black, width: 40)
        self.mCanvas.drawing = drawing
        self.mCanvas.alwaysBounceVertical = true
        if #available(iOS 14.0, *) {
            mCanvas.drawingPolicy = .anyInput
        } else {
            // Fallback on earlier versions
        }

//
//        // Set up the tool picker
//        if #available(iOS 14.1, *) {
//            toolPicker = PKToolPicker()
//        } else {
//            let window = parent?.view.window
//            toolPicker = PKToolPicker.shared(for: window!)
//        }
//        toolPicker.setVisible(true, forFirstResponder: mCanvas)
//        toolPicker.addObserver(mCanvas)
//        toolPicker.addObserver(self)
//        mCanvas.becomeFirstResponder()
        
//        @IBAction func onTapButton(_ sender: AnyObject)
//        {
//        if sender.isSelected
//        {
//            TextBantuan .isHidden = false
//        }
//        else
//        {
//            TextBantuan .isHidden = true
//        }
//        sender.isSelected = !sender.isSelected
//    }
        // Do any additional setup after loading the view.
//    let storyBoard: UIStoryboard = UIStoryboard(name: "MenulisA", bundle: nil)
//
//    let newViewController = storyBoard.instantiateViewController(withIdentifier: "MenulisAViewController") as! MenulisAViewController
//    newViewController.modalPresentationStyle = .fullScreen
//            self.present(newViewController, animated: true, completion: nil)
    }
}

