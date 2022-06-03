//
//  SavedConfirmation.swift
//  IvanZrvnarBusinessDirectoryApp
//
//  Created by Ivan Zrvnar on 2022-06-03.
//

import Foundation
import UIKit

class SavedConfirmation: UIView{
    override func draw(_ rect: CGRect) {
        
        let width: CGFloat = 100
        let height: CGFloat = 100
        
        let viewRect = CGRect(x: round((bounds.size.width - width) / 2), y: round((bounds.size.height - height) / 2), width: width, height: height)
        
        let insideRect =  UIBezierPath(roundedRect: viewRect, cornerRadius: 15)
        UIColor(red: 0, green: 0, blue: 0, alpha: 0.9).setFill()
        insideRect.fill()
        
        guard let image = UIImage(systemName: "car.circle.fill")?.withTintColor(.white) else { return }
        
        image.draw(in: CGRect(x: center.x - 15, y: center.y - 15, width: 30, height: 30))
        
        let text: NSString = "Store Added"
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.white
        ]
        let textSize =  text.size(withAttributes: attributes)
        let textPoint = CGPoint(x: center.x - (textSize.width/2), y: center.y - (textSize.height/2) + height/4)
        text.draw(at: textPoint, withAttributes: attributes)
    }
    
    func showDialog(){
        alpha = 0
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
            self.alpha = 1
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
        
        
    }
}
