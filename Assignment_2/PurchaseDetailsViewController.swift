//
//  PurchaseDetailsViewController.swift
//  Assignment_2
//
//  Created by Marmik Nalinkumar Patel on 2025-02-26.
//

import UIKit

class PurchaseDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var purchase: PurchaseHistory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Product: \(purchase.name)"
        quantityLabel.text = "Quantity: \(purchase.quantity)"
        totalPriceLabel.text = String(format: "Total Price: $%.2f", purchase.totalPrice)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateLabel.text = "Date: \(dateFormatter.string(from: purchase.purchaseDate))"
    }
}
