//  ChessView.swift
//  HwChessProject

import UIKit

@IBDesignable class ChessView: UIView {
    
    //from stroryboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    
    private func setup(){
        //clean up
        for item in self.subviews{
            if item is BlackView || item is WhiteView{
                item.removeFromSuperview()
            }
        }
        
        //create chess
        let tileSize = min(self.bounds.width, self.bounds.height) / 8
        
        var rect = CGRect(x: 0, y: 0, width: tileSize, height: tileSize)
        
        for row in 0..<8{
            for col in 0..<8{
                //create new subview
                if (col + row) % 2 == 0{
                    //black
                    let subView = BlackView(frame: rect)
                    self.addSubview(subView)
                }else{
                    //white
                    //let subView = WhiteView(frame: rect)
                    self.addSubview(WhiteView(frame: rect))
                }
                
                //increament x
                rect.origin.x += tileSize
                
            }
            
            //zero x
            rect.origin.x = 0
            
            //increament y
            rect.origin.y += tileSize
        }
    }
    
    
}
