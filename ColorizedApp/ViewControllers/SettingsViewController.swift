//
//  SettingsViewController.swift
//  ColorizedApp
//
//  Created by Egor Ledkov on 23.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
 
    // MARK: IB Outlet
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var colorView: UIView!
    
    // MARK: - Properties
    var mainColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
            
        setSliders()
        setColor()
        setValue(for: redLabel, greenLabel, blueLabel,
                 and: redTextField, greenTextField, blueTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    // MARK: - IB Actions
    @IBAction func changeSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redLabel, and: redTextField)
        case greenSlider:
            setValue(for: greenLabel, and: greenTextField)
        default:
            setValue(for: blueLabel, and: blueTextField)
        }
    }

    @IBAction func donePressed() {
        view.endEditing(true)
        delegate.setViewBackground(color: mainColor)
        dismiss(animated: true)
    }

    // MARK: - Set UI
    private func setSliders() {
        if let rgb = mainColor.cgColor.components {
            for (index, value) in rgb.enumerated() {
                switch index {
                case 0:
                    redSlider.value = Float(value)
                case 1:
                    greenSlider.value = Float(value)
                case 2:
                    blueSlider.value = Float(value)
                default:
                    break
                }
            }
        }
    }
    
    private func setColor() {
        mainColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        colorView.backgroundColor = mainColor
    }
    
    private func setValue(for labels: UILabel..., and fields: UITextField...) {
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

        fields.forEach { field in
            switch field {
            case redTextField:
                redTextField.text = string(from: redSlider.value)
            case greenTextField:
                greenTextField.text = string(from: greenSlider.value)
            default:
                blueTextField.text = string(from: blueSlider.value)
            }
        }
    }
    
    private func string(from value: Float) -> String {
        String(format: "%.2f", value)
    }
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let value = Float(textField.text ?? "0.0"), value <= 1, value >= 0 else { return }
        
        switch textField {
        case redTextField:
            redSlider.setValue(value, animated: true)
        case greenTextField:
            greenSlider.setValue(value, animated: true)
        default:
            blueSlider.setValue(value, animated: true)
        }
        
        setColor()
    }
}
