//
//  HighLowCardGameView.swift
//  TTT
//
//  Created by Feliciano Medina on 3/4/25.
//

import Foundation
import SwiftUI
import UIKit

struct HighLowCardGameView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "HighLowViewController")
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // No updates needed for now
    }
}
