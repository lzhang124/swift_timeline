//
//  TimelineView.swift
//  Timeline
//
//  Created by Larry Zhang on 4/1/15.
//  Copyright (c) 2015 Larry Zhang. All rights reserved.
//

import UIKit

public struct TimeFrame {
    let time: String
//    let name: String
    let image: UIImage?
//    let button: UIButton
}

public class TimelineView: UIView {
    var timeFrames: [TimeFrame]
    var lineColor = UIColor(red: 0.906, green: 0.569, blue: 0.165, alpha: 1.000)
    var timeColor = UIColor(red: 0.608, green: 0.608, blue: 0.608, alpha: 1.000)
    var backColor = UIColor(red: 0.941, green: 0.941, blue: 0.941, alpha: 1.000)
    
    required public init(coder aDecoder: NSCoder) {
        timeFrames = []
        super.init(coder: aDecoder)
    }
    
    public init(timeFrames: [TimeFrame]) {
        self.timeFrames = timeFrames
        super.init(frame: CGRect.zeroRect)
        
        setTranslatesAutoresizingMaskIntoConstraints(false)
        
        setupContent()
    }

    private func setupContent() {
        let guideView = UIView()
		guideView.setTranslatesAutoresizingMaskIntoConstraints(false)
        addSubview(guideView)
        addConstraints([
            NSLayoutConstraint(item: guideView, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: guideView, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1.0, constant: 0),
            ])
        
        var i = 0
        var viewFromAbove = guideView
        
        for element in timeFrames {
            let v = blockForTimeFrame(element, imageTag: i)
            addSubview(v)
            addConstraints([
                NSLayoutConstraint(item: v, attribute: .Top, relatedBy: .Equal, toItem: viewFromAbove, attribute: .Bottom, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: v, attribute: .Width, relatedBy: .Equal, toItem: viewFromAbove, attribute: .Width, multiplier: 1.0, constant: 0),
                ])
            viewFromAbove = v
            i++
        }
        
        let line = UIView()
        line.setTranslatesAutoresizingMaskIntoConstraints(false)
        line.backgroundColor = lineColor
        addSubview(line)
        sendSubviewToBack(line)
        addConstraints([
            NSLayoutConstraint(item: line, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: line, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 2.5),
            NSLayoutConstraint(item: line, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: -200),
            NSLayoutConstraint(item: line, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 200),
            ])
        addConstraint(NSLayoutConstraint(item: viewFromAbove, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: -30))
    }

    private func blockForTimeFrame(element: TimeFrame, imageTag: Int) -> UIView {
        let v = UIView()
        v.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let timeStamp = UILabel()
        timeStamp.setTranslatesAutoresizingMaskIntoConstraints(false)
        timeStamp.font = UIFont(name: "HelveticaNeue-Medium", size: 12)
        timeStamp.textColor = timeColor
        timeStamp.textAlignment = NSTextAlignment.Center
        timeStamp.text = element.time
        timeStamp.backgroundColor = backColor
        v.addSubview(timeStamp)
        v.addConstraints([
            NSLayoutConstraint(item: timeStamp, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 60),
            NSLayoutConstraint(item: timeStamp, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 15),
            NSLayoutConstraint(item: timeStamp, attribute: .CenterX, relatedBy: .Equal, toItem: v, attribute: .CenterX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: timeStamp, attribute: .Top, relatedBy: .Equal, toItem: v, attribute: .Top, multiplier: 1.0, constant: 20),
            ])
        
        if let image = element.image {
            let backgroundViewForImage = UIView()
            backgroundViewForImage.setTranslatesAutoresizingMaskIntoConstraints(false)
            backgroundViewForImage.backgroundColor = lineColor
            backgroundViewForImage.layer.cornerRadius = 40
            v.addSubview(backgroundViewForImage)
            v.addConstraints([
                NSLayoutConstraint(item: backgroundViewForImage, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 80),
                NSLayoutConstraint(item: backgroundViewForImage, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 80),
                NSLayoutConstraint(item: backgroundViewForImage, attribute: .CenterX, relatedBy: .Equal, toItem: v, attribute: .CenterX, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: backgroundViewForImage, attribute: .Top, relatedBy: .Equal, toItem: timeStamp, attribute: .Bottom, multiplier: 1.0, constant: 5),
                NSLayoutConstraint(item: backgroundViewForImage, attribute: .Bottom, relatedBy: .Equal, toItem: v, attribute: .Bottom, multiplier: 1.0, constant: 0),
                ])
            
            let imageView = UIImageView(image: image)
            imageView.layer.cornerRadius = 37.5
            imageView.layer.masksToBounds = true
            imageView.setTranslatesAutoresizingMaskIntoConstraints(false)
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            v.addSubview(imageView)
            imageView.tag = imageTag
            v.addConstraints([
                NSLayoutConstraint(item: imageView, attribute: .Left, relatedBy: .Equal, toItem: backgroundViewForImage, attribute: .Left, multiplier: 1.0, constant: 2.5),
                NSLayoutConstraint(item: imageView, attribute: .Right, relatedBy: .Equal, toItem: backgroundViewForImage, attribute: .Right, multiplier: 1.0, constant: -2.5),
                NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: backgroundViewForImage, attribute: .Top, multiplier: 1.0, constant: 2.5),
                NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: backgroundViewForImage, attribute: .Bottom, multiplier: 1.0, constant: -2.5),
                ])
            
            
            let button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
            button.setTranslatesAutoresizingMaskIntoConstraints(false)
            button.backgroundColor = UIColor.clearColor()
            button.tag = imageTag
            button.addTarget(self, action: "tapImage:", forControlEvents: UIControlEvents.TouchUpInside)
            v.addSubview(button)
            v.addConstraints([
                NSLayoutConstraint(item: button, attribute: .Width, relatedBy: .Equal, toItem: imageView, attribute: .Width, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: imageView, attribute: .Height, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: imageView, attribute: .Left, multiplier: 1.0, constant: 0),
                NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: imageView, attribute: .Top, multiplier: 1.0, constant: 0),
                ])
        }
        
        return v
    }
    
    func tapImage(button: UIButton){
        var imageView: UIImageView? = nil
        for v in subviews{
            for w in v.subviews{
                if w.tag == button.tag && w is UIImageView{
                    imageView = (w as UIImageView)
                    println(w.tag)
                }
            }
        }
    }
}
