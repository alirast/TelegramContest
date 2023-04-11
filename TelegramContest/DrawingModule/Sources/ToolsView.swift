//
//  ToolsView.swift
//  TelegramContest
//
//  Created by N S on 10.04.2023.
//

import Foundation
import UIKit

class ToolsView {
    //old version
    //pen
    let penBody = UIButton(type: .custom)
    let penTip = UIButton(type: .custom)
    let penColor = UILabel()
    var tapCountPen = 0
    let penSlider = UIButton(type: .custom)
    let penSystemSlider = UISlider()
    var penIsSelected = false //if selected - change the frame (the position is higher)
    
    //penBody.setImage(UIImage(named: "pen1"), for: .normal)
    //penTip.setImage(UIImage(named: "pen").withRenderingMode(.alwaysTemplate), for: .normal)
    //penSystemSlider.minimumValue = 5
    //penSystemSlider.maximumValue = 10
    
    //penTip.addTarget(self, action: #selector(penIsTapped(sender:)), for: .touchUpInside)
    
    //penSystemSlider.addTarget(self, action: #selector(changePenWidth), for: .valueChanged)
    
    @objc func changePenWidth(sender: UISlider) {
        //penColor.frame = CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>)
    }
    
    func hidePen() {
        if penIsSelected == true {
            penIsSelected = false
            //penBody.frame change
        }
    }
    
    func onlyPenView() {}
    @objc func penIsTapped(sender: UIButton) {
        penIsSelected = true
        //canvasView.tool = pkInkingtool(.pen, color: ..., width: )
        onlyPenView()
    }
    
}
