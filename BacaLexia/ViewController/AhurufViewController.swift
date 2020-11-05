//
//  AhurufViewController.swift
//  BacaLexia
//
//  Created by Adri Nofrianto on 05/11/20.
//

import UIKit

class AhurufViewController: UIViewController {

    @IBOutlet weak var arrowButton: UIImageView!
    var huruf : String = ""
    @IBOutlet weak var hurufImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        back()
        pilihPic()
       
    }
    
    func back(){
        let gesture =  UITapGestureRecognizer(target: self, action: #selector(backimageTapped))
        arrowButton.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        arrowButton.addGestureRecognizer(gesture)
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
        }
    }

    @objc func backimageTapped(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "PilihV", bundle: nil)
        
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "PilihVViewController") as! PilihVViewController
        newViewController.modalPresentationStyle = .fullScreen
                self.present(newViewController, animated: false, completion: nil)
        
    }


}
