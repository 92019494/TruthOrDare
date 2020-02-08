//
//  UIViewController.swift
//  TruthOrDare
//
//  Created by Anthony on 6/02/20.
//  Copyright © 2020 Anthony. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func hideNavBar(){
        navigationController?.isNavigationBarHidden = true
    }

    func showNavBar(){
        navigationController?.isNavigationBarHidden = false
    }

}
