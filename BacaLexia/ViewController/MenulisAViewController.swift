//
//  MenulisAViewController.swift
//  BacaLexia
//
//  Created by Patrick Chuang on 04/11/20.
//

import UIKit
import PencilKit

class MenulisAViewController: UIViewController,PKCanvasViewDelegate,PKToolPickerObserver {
    
    @IBOutlet weak var mCanvas: PKCanvasView!
    @IBOutlet weak var TextBantuan: UIImageView!
    @IBOutlet weak var KoalaBtn: UIImageView!
    
//    @IBAction func buttonPressed(sender: AnyObject) { //this is the ACTION connection for your button
//
//        if KoalaBtn.isHidden == true {
//
//            KoalaBtn.isHidden = false
//        } else {
//
//            KoalaBtn.isHidden = true
//        }

    
    var height :CGFloat = 500
    var width :CGFloat = 768
    
    var drawing = PKDrawing()
    var toolPicker : PKToolPicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        showguide()
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
    
    func showguide(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        KoalaBtn.isUserInteractionEnabled = true
        KoalaBtn.addGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer.numberOfTapsRequired = 1
        }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        // Your action
        
                if TextBantuan.isHidden == true {
                    
                    TextBantuan.isHidden = false
                    
                } else {
                    TextBantuan.isHidden = true
                }
    }
}

