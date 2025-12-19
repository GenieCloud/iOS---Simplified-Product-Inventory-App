//  Name: Gio Jones
// Assignment: Code Exercise 04: Classes and Objects
//  ViewController.swift
//  Code_Exercise04
//
//  Created by Gio on 12/16/25.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject
{
    //Method signature, the method name, parameter and any returns. No implementation
    func productDidSave(product: Product)
}

class ViewController: UIViewController, SecondViewControllerDelegate {

    //UI Labels
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productQuantityLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productTotalValueLabel: UILabel!
    @IBOutlet weak var productInventoryStatusLabel: UILabel!
    @IBOutlet weak var sellLabel: UILabel!
    
    //UI Buttons
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var sellButton: UIButton!
    
    //Product object
    var product = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        productDidSave(product: product)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "editSegue" {
            if let vc = segue.destination as? SecondViewController
            {
                //Connects the product variable to the secondViewController
                vc.product = product
                vc.delegate = self
            }
        }
    }
    
    @IBAction func buyButtonTapped(_ sender: Any)
    {
        sellLabel.text = product.buy(amount: product.quantity)
    }
    
    @IBAction func sellButtonTapped(_ sender: Any)
    {
        sellLabel.text = product.sell(amount: product.quantity)
    }
    
    func productDidSave(product: Product)
    {
        self.product = product
        self.productNameLabel.text = product.name
        self.productQuantityLabel.text = String(product.quantity)
        self.productPriceLabel.text = String(product.price)
        self.productTotalValueLabel.text = String(product.totalValue)
        self.productInventoryStatusLabel.text = product.inventoryStatus
    }
}

