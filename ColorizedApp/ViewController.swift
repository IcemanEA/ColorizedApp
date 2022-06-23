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
    
    @IBOutlet var colorTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.view.backgroundColor = .gray
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        colorTextView.text = ""
    }

    @IBAction func changeSlider(_ sender: UISlider) {
        let color = UIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: 1)
        
        colorTextView.backgroundColor = color
        
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

