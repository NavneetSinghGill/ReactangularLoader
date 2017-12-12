//
//  Pop.swift
//  SwiftTest
//
//  Created by Navneet on 12/8/17.
//  Copyright © 2017 Navneet. All rights reserved.
//

import UIKit

@objc protocol AnswerDelegate {
    
    func isCorrectAnswer()
}

class Pop: UIView {
    
    var answerDelegate: AnswerDelegate?
    
    class func instanceFromNib() -> Pop {
        return UINib(nibName: "Pop", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! Pop
    }
    
    @IBAction func sendDataToDbAction(_ sender: Any)
    {
        if(false)
        {
            //Alert
        }
        else
        {
            answerDelegate?.isCorrectAnswer()
        }
        
    }

}
