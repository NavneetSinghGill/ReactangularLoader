//
//  ViewController.swift
//  SwiftTest
//
//  Created by Navneet on 12/8/17.
//  Copyright © 2017 Navneet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: UIView!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        progressView.layer.borderWidth = 1
        progressView.layer.borderColor = UIColor.brown.cgColor
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = progressView.bounds
        
        shapeLayer.borderWidth = 1
        shapeLayer.borderColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.orange.cgColor
        
        progressView.layer.addSublayer(shapeLayer)
        
        let bezierPath = UIBezierPath()
        bezierPath.lineWidth = 5
        
        // Fill
        UIColor.green.setFill()
        bezierPath.fill()
        
        // Stroke
        UIColor.lightGray.setStroke()
        bezierPath.lineWidth = 5
        bezierPath.stroke()
        
        let lineWidth = 5
        
        var value: Double = 0
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            value = value + 2
            if value > 100 {
                timer.invalidate()
            }
        
            let points: [CGPoint] = self.getPointsForValue(value: value, with: CGFloat(lineWidth), and: self.progressView.bounds)
            print("\n\n Value: \(value), Points: \(points)")
            bezierPath.removeAllPoints()
            bezierPath.move(to: CGPoint(x: self.progressView.frame.size.width / 2, y: 0))
            for point in points {
                bezierPath.addLine(to: point)
            }
            
            shapeLayer.path = bezierPath.cgPath
        }
    }
    
    func getPointsForValue(value: Double, with lineWidth: CGFloat, and frame: CGRect) -> [CGPoint] {
        let actualValue = value
        
        var points = [CGPoint]()
        
        //Add points for outer line
        
        var x: Double = Double(frame.width/2)
        var y: Double = 0
        
        points.append(CGPoint(x: x, y: y))
        
        if value > 13 {
            
        }
        
        if Double(actualValue) >= 12.5 {
            x = Double(frame.width)
            points.append(CGPoint(x: x, y: y))
        } else if Double(actualValue) >= 0 {
            x = Double(frame.width) * (Double(actualValue) + 12.5) / 25
            points.append(CGPoint(x: x , y: y))
        }
        
        if Double(actualValue) >= (12.5 + 25) {
            x = Double(frame.width)
            y = Double(frame.height)
            points.append(CGPoint(x: x, y: y))
        } else if Double(actualValue) > 12.5 {
            x = Double(frame.width)
            y = Double(frame.height) * (Double(actualValue) - 12.5) / 25
            points.append(CGPoint(x: x, y: y))
        }
        
        if Double(actualValue) >= (12.5 + 50) {
            x = 0
            points.append(CGPoint(x: x, y: y))
        } else if Double(actualValue) > (12.5 + 25) {
            x = Double(frame.width) * (25 - (Double(actualValue) - (12.5+25))) / 25
            points.append(CGPoint(x: x, y: y))
        }
        
        if Double(actualValue) >= (12.5 + 75) {
            x = 0
            y = 0
            points.append(CGPoint(x: x, y: y))
        } else if Double(actualValue) > (12.5 + 50) {
            y = Double(frame.height) * (25 - (Double(actualValue) - (12.5+25+25))) / 25
            points.append(CGPoint(x: x, y: y))
        }
        
        if Double(actualValue) >= 87.5 {
            x = Double(frame.width) * (Double(actualValue) - 87.5) / 25
            y = 0
            points.append(CGPoint(x: x, y: y))
        }
        
        //Add points for inner line which eventually creates a closed area
        
        
        if Double(actualValue) >= 87.5 {
            x = Double(frame.width) * (Double(actualValue) - 87.5) / 25
            y = Double(lineWidth)
            points.append(CGPoint(x: x, y: y))
        }
        
        if Double(actualValue) >= (12.5 + 75) {
            x = Double(lineWidth)
            y = Double(lineWidth)
            points.append(CGPoint(x: x, y: y))
        } else if Double(actualValue) > (12.5 + 50) {
            x = Double(lineWidth)
            y = Double(frame.height) * (25 - (Double(actualValue) - (12.5+25+25))) / 25
            points.append(CGPoint(x: x, y: y))
        }
        
        if Double(actualValue) >= (12.5 + 50) {
            x = Double(lineWidth)
            y = Double(frame.height - lineWidth)
            points.append(CGPoint(x: x, y: y))
        } else if Double(actualValue) > (12.5 + 25) {
            x = Double(frame.width) * (25 - (Double(actualValue) - (12.5+25))) / 25
            y = Double(frame.height - lineWidth)
            points.append(CGPoint(x: x, y: y))
        }
        
        if Double(actualValue) >= (12.5 + 25) {
            x = Double(frame.width - lineWidth)
            y = Double(frame.height - lineWidth)
            points.append(CGPoint(x: x, y: y))
        } else if Double(actualValue) > 12.5 {
            x = Double(frame.width - lineWidth)
            y = Double(frame.height) * (Double(actualValue) - 12.5) / 25
            points.append(CGPoint(x: x, y: y))
        }
        
        y = Double(lineWidth)
        if Double(actualValue) >= 12.5 {
            points.append(CGPoint(x: x, y: y))
        } else if Double(actualValue) >= 0 {
            x = Double(frame.width) * (Double(actualValue) + 12.5) / 25
            points.append(CGPoint(x: x, y: y))
        }
        
        points.append(CGPoint(x: frame.width/2, y: lineWidth))
        return points
    }
    

}

