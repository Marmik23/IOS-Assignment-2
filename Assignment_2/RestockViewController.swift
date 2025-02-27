//
//  RestockViewController.swift
//  Assignment_2
//
//  Created by Marmik Nalinkumar Patel on 2025-02-26.
//

import UIKit

class RestockViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var quantityTextField: UITextField!
    
    var products: [(String, Double, Int)]!
    var selectedProductIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")
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
        selectedProductIndex = indexPath.row
    }
    
    @IBAction func restockButtonTapped(_ sender: UIButton) {
        guard let index = selectedProductIndex, let quantityText = quantityTextField.text, let quantity = Int(quantityText) else {
            showAlert(message: "Please select a product and enter a valid quantity")
            return
        }
        
        products[index].2 += quantity
        tableView.reloadData()
        quantityTextField.text = ""
        selectedProductIndex = nil
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
