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
        
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel)
    }

    @IBAction func changeSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redLabel)
        case greenSlider:
            setValue(for: greenLabel)
        default:
            setValue(for: blueLabel)
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                redLabel.text = string(from: redSlider.value)
            case greenLabel:
                greenLabel.text = string(from: greenSlider.value)
            default:
                blueLabel.text = string(from: blueSlider.value)
            }
        }
    }
    
    private func string(from value: Float) -> String {
        String(format: "%.2f", value)
    }
}
