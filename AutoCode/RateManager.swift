//
//  RateManager.swift
//  AutoCode
//
//  Created by Andrey Kudryavtsev on 11.11.2020.
//

import UIKit
import StoreKit

@available(iOS 14.0, *)

class RateManager {
    
    class func incrementCount() {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count < 6 {
            UserDefaults.standard.set(count + 1, forKey: "run_count")
        }
    }
    
    class func showRatesController() {
        let count = UserDefaults.standard.integer(forKey: "run_count")
        if count == 5 {
            if let scene = UIApplication.shared.currentScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}

extension UIApplication {
    var currentScene: UIWindowScene? {
        connectedScenes
            .first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}
