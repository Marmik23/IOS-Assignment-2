//
//  HistoryViewController.swift
//  Assignment_2
//
//  Created by Marmik Nalinkumar Patel on 2025-02-26.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var purchaseHistory: [PurchaseHistory]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "HistoryCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        let purchase = purchaseHistory[indexPath.row]
        cell.textLabel?.text = "\(purchase.name) - Qty: \(purchase.quantity)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showPurchaseDetails", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPurchaseDetails", let indexPath = sender as? IndexPath {
            if let detailsVC = segue.destination as? PurchaseDetailsViewController {
                detailsVC.purchase = purchaseHistory[indexPath.row]
            }
        }
    }
}
