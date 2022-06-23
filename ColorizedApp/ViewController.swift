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
    
    @IBOutlet var colorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabel.layer.cornerRadius = 15
                
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        changeSlider(redSlider)
    }

    // MARK: IB Action
    @IBAction func changeSlider(_ sender: UISlider) {
        let color = UIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: 1)
        
        colorLabel.backgroundColor = color
        colorLabel.text = color.toHex()
                
        switch sender {
        case redSlider:
            redLabel.text = String(format: "%.2f", sender.value)
        case greenSlider:
            greenLabel.text = String(format: "%.2f", sender.value)
        default:
            blueLabel.text = String(format: "%.2f", sender.value)
        }
    }
    
    @IBAction func copyButtonTapped() {
        guard let hexCode = colorLabel.text else { return }
        
        UIPasteboard.general.string = hexCode
    }
    
}

// MARK: - From UIColor to Hex
extension UIColor {

    func toHex(isAlpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }

        let red = Float(components[0])
        let green = Float(components[1])
        let blue = Float(components[2])
        var alpha = Float(1.0)

        if components.count >= 4 {
            alpha = Float(components[3])
        }

        if isAlpha {
            return String(
                format: "%02lx%02lx%02lx%02lx",
                lroundf(red * 255),
                lroundf(green * 255),
                lroundf(blue * 255),
                lroundf(alpha * 255)
            )
        } else {
            return String(
                format: "%02lx%02lx%02lx",
                lroundf(red * 255),
                lroundf(green * 255),
                lroundf(blue * 255)
            )
        }
    }
}

