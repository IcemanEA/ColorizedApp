//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Egor Ledkov on 12.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare")
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.mainColor = view.backgroundColor
    }
}
