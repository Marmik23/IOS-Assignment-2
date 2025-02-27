//
//  ManagerPanelViewController.swift
//  Assignment_2
//
//  Created by Marmik Nalinkumar Patel on 2025-02-26.
//

import UIKit

class ManagerPanelViewController: UIViewController {
    
    var products: [(String, Double, Int)]!
    var purchaseHistory: [PurchaseHistory]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func historyButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showHistory", sender: self)
    }
    
    
    @IBAction func restockButtonTapped(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHistory" {
            if let historyVC = segue.destination as? HistoryViewController {
                historyVC.purchaseHistory = self.purchaseHistory
            }
        } else if segue.identifier == "showRestock" {
            if let restockVC = segue.destination as? RestockViewController {
                restockVC.products = self.products
            }
        }
    }
}
