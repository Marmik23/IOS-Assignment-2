//
//  ViewController.swift
//  Assignment_2
//
//  Created by Marmik Nalinkumar Patel on 2025-02-25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var products = [("Hat", 10.0, 10), ("Shirt", 20.0, 20), ("Pants", 30.0, 15)]
    var selectedProduct: (String, Double, Int)?
    var selectedQuantity = 0
    var purchaseHistory: [PurchaseHistory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = "\(product.0) - $\(product.1) (\(product.2) in stock)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProduct = products[indexPath.row]
        productLabel.text = selectedProduct?.0
        updateTotal()
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text, let digit = Int(number) else { return }
        selectedQuantity = selectedQuantity * 10 + digit
        quantityLabel.text = String(selectedQuantity)
        updateTotal()
    }
    
    @IBAction func buyButtonTapped(_ sender: UIButton) {
        guard let product = selectedProduct else {
            showAlert(message: "Please select a product")
            return
        }
        
        if selectedQuantity > product.2 {
            showAlert(message: "Not enough stock available")
            return
        }
        
        if let index = products.firstIndex(where: { $0.0 == product.0 }) {
            products[index].2 -= selectedQuantity
            tableView.reloadData()
            
            let totalPrice = Double(selectedQuantity) * product.1
            let purchase = PurchaseHistory(name: product.0, quantity: selectedQuantity, totalPrice: totalPrice, purchaseDate: Date())
            purchaseHistory.append(purchase)
        }
        
        productLabel.text = "Product"
        quantityLabel.text = "Quantity"
        totalLabel.text = "Total"
        selectedProduct = nil
        selectedQuantity = 0
    }
    
    
    @IBAction func managerButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "showManagerPanel", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showManagerPanel" {
            if let managerVC = segue.destination as? ManagerPanelViewController {
                managerVC.products = self.products
                managerVC.purchaseHistory = self.purchaseHistory
            }
        }
    }
    
    func updateTotal() {
        if let product = selectedProduct {
            let total = Double(selectedQuantity) * product.1
            totalLabel.text = String(format: "$%.2f", total)
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
