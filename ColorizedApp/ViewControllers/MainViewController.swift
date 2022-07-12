//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Egor Ledkov on 12.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewBackground(color: UIColor)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.mainColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setViewBackground(color: UIColor) {
        view.backgroundColor = color
    }
}
