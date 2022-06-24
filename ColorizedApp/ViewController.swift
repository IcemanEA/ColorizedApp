//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Egor Ledkov on 23.06.2022.
//

import UIKit

class ViewController: UIViewController {
 
    // MARK: IB Outlet
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        colorView.backgroundColor = .gray
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }

    @IBAction func changeSlider(_ sender: UISlider) {
        let color = UIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: 1)
        
        colorView.backgroundColor = color
        
        switch sender {
        case redSlider:
            redLabel.text = String(format: "%.2f", sender.value)
        case greenSlider:
            greenLabel.text = String(format: "%.2f", sender.value)
        default:
            blueLabel.text = String(format: "%.2f", sender.value)
        }
    }
}
