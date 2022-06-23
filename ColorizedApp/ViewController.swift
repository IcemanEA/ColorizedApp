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
                
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        colorTextView.text = ""
        changeSlider(redSlider)
    }

    // MARK: IB Action
    @IBAction func changeSlider(_ sender: UISlider) {
        let color = UIColor(red: CGFloat(redSlider.value),
                            green: CGFloat(greenSlider.value),
                            blue: CGFloat(blueSlider.value),
                            alpha: 1)
        
        colorTextView.backgroundColor = color
        colorTextView.text = color.toHex()
        
        
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

// MARK: - From UIColor to String
extension UIColor {

    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }

        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)

        if components.count >= 4 {
            a = Float(components[3])
        }

        if alpha {
            return String(format: "%02lx%02lx%02lx%02lx", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lx%02lx%02lx", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
}

