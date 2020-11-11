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
    }
    
    @objc func backToPrevActivity(){
            let gesture =  UITapGestureRecognizer(target: self, action: #selector(goToPrevActivity))
            backActivityButton.isUserInteractionEnabled = true
            gesture.numberOfTapsRequired = 1
            backActivityButton.addGestureRecognizer(gesture)
    }
    
    @objc func goToPrevActivity(){
            if huruf == "A"{

                    let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
                    
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController
            
                    newViewController.huruf = "A"

                    newViewController.modalPresentationStyle = .fullScreen
                        self.present(newViewController, animated: false, completion: nil)


            } else if huruf == "O"{

                let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
                
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController

                newViewController.huruf = "O"

                newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: false, completion: nil)


            } else if huruf == "I"{

                let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
                
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController


                    newViewController.huruf = "I"
                
                    newViewController.modalPresentationStyle = .fullScreen
                        self.present(newViewController, animated: false, completion: nil)


            } else if huruf == "E"{

                let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
                
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController


                newViewController.huruf = "E"
                
                    newViewController.modalPresentationStyle = .fullScreen
                        self.present(newViewController, animated: false, completion: nil)



            } else if huruf == "U"{

                let storyBoard: UIStoryboard = UIStoryboard(name: "Ahuruf", bundle: nil)
                
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "AhurufViewController") as! AhurufViewController


                newViewController.huruf = "U"

                    newViewController.modalPresentationStyle = .fullScreen
                        self.present(newViewController, animated: false, completion: nil)


            }
        playSound(soundName: "mendengarkan")
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
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
    func backToPilihHuruf(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backimageTapped))
        backButton.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        backButton.addGestureRecognizer(gesture)
    }
    
    @objc func backimageTapped(){
        
        animationfromRight()
       playSound(soundName: "pilihlahHuruf")
        
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
//        mCanvas.delegate = self
////        mCanvas.tool = PKInkingTool(.marker,color: .blue)
//        mCanvas.drawing = drawing
//        mCanvas.alwaysBounceVertical = true
//        mCanvas.drawingPolicy = .anyInput
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

