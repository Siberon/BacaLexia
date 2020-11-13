//
//  PilihVViewController+Extention.swift
//  BacaLexia
//
//  Created by Muhammad Tafani Rabbani on 12/11/20.
//

import Foundation
import UIKit

extension AhurufViewController{
    
    func bubleAnimation(){
        let a = CGFloat.random(in: 10...20)
        let b = CGFloat.random(in: 10...20)
        UIView.animate(withDuration: 2) {
            self.hurufImage.center.x = self.hurufImage.center.x + a
            self.hurufImage.center.y = self.hurufImage.center.y + b
        } completion: { (sucess) in
            UIView.animate(withDuration: 2) {
                self.hurufImage.center.x = self.hurufImage.center.x - a
                self.hurufImage.center.y = self.hurufImage.center.y - b
            } completion: { (sucess) in
                self.bubleAnimation()
            }
        }

    }
}
