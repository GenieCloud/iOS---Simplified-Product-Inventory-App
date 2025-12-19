//
//  SecondViewController.swift
//  Code_Exercise04
//
//  Created by Gio on 12/18/25.
//

import UIKit

class SecondViewController: UIViewController {

    //UI Text Fields
    @IBOutlet weak var productNameTextField: UITextField!
    @IBOutlet weak var productQuantityTextField: UITextField!
    @IBOutlet weak var productPriceTextField: UITextField!
    @IBOutlet weak var productTotalValueTextField: UITextField!
    @IBOutlet weak var productInventoryStatusTextField: UITextField!
    
    //UI Buttons
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveProductButton: UIButton!
    
    //Delegate
    weak var delegate: SecondViewControllerDelegate?
    
    //Product variable
    var product: Product!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func saveProductButtonTapped()
    {
        let alert = UIAlertController(title: "Error", message: "Please enter a value for all fields.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        
        if(productNameTextField?.text == "" || productQuantityTextField?.text == "" || productPriceTextField?.text == "" || productTotalValueTextField?.text == "" || productInventoryStatusTextField?.text == "")
        {
            self.present(alert, animated: true, completion: nil)
        }else{
            delegate?.productDidSave(product: Product(name: productNameTextField?.text ?? "", quantity: Int(productQuantityTextField?.text ?? "0") ?? 0, price: Double(productPriceTextField?.text ?? "0") ?? 0))
            dismiss(animated: true)
        }
        
        
    }
    
    func updateUI()
    {
        productNameTextField?.text = product.name
        productQuantityTextField?.text = String(product.quantity)
        productPriceTextField?.text = String(product.price)
        productTotalValueTextField?.text = String(product.totalValue)
        productInventoryStatusTextField?.text = product.inventoryStatus.description
    }
    

//
    
    @IBAction func backButtonTapped()
    {
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
