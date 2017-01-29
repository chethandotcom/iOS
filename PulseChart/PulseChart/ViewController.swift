//
//  ViewController.swift
//  PulseChart
//
//  Created by Chethan Shetty on 29/01/17.
//  Copyright © 2017 Chethan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView! // Scrollview which holds all the pulses
    
    var array = [CGFloat(10), CGFloat(20), CGFloat(15), CGFloat(8), CGFloat(22), CGFloat(18), CGFloat(12), CGFloat(6), CGFloat(8),
                 CGFloat(10), CGFloat(20), CGFloat(15), CGFloat(8), CGFloat(22), CGFloat(18), CGFloat(12), CGFloat(6), CGFloat(8),
                 CGFloat(8), CGFloat(22), CGFloat(18), CGFloat(12), CGFloat(6), CGFloat(8), CGFloat(8), CGFloat(22), CGFloat(18),
                 CGFloat(12), CGFloat(6), CGFloat(8)]
    var scrollviewHeight:CGFloat = 0.0
    var maxHeight:CGFloat = 0.0
    
    let barThickness = 6
    let barCornerRadius:CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scrollviewHeight = scrollView.frame.size.height
        maxHeight = array.max()!
        
        drawPulse()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func drawPulse() {
        
        for index in 0..<array.count {
            let relativeHeight = getRelativeHeight(viewHeight: array[index])
            
            let rect: CGRect = CGRect(x: 20*index,
                                      y: Int(getVerticalCenter(viewHeight: relativeHeight)),
                                      width: barThickness,
                                      height: Int(relativeHeight))
            let bar: UIView = UIView(frame: rect)
            bar.layer.cornerRadius = barCornerRadius
            bar.backgroundColor = UIColor.gray
            scrollView.addSubview(bar)
            
            scrollView.contentSize = CGSize(width: rect.origin.x + rect.size.width, height: scrollviewHeight)
        }
    }
    
    func getRelativeHeight(viewHeight: CGFloat) -> CGFloat {
        return (viewHeight * scrollviewHeight) / maxHeight
    }
    
    func getVerticalCenter(viewHeight: CGFloat) -> CGFloat {
        return (scrollviewHeight/2) - (viewHeight/2)
    }
}

