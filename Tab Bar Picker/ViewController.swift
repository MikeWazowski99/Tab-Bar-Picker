//
//  ViewController.swift
//  Tab Bar Picker
//
//  Created by Michael Tapia on 2/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelResults: UILabel!
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    let dateFormatter: DateFormatter = DateFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelResults.numberOfLines = 0
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Warning", message: "Zombies are loose!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in self.labelResults.text = "OK" })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { action -> Void in self.labelResults.text = "Cancel" })
        let destroyAction = UIAlertAction(title: "Destroy", style: .destructive, handler: { action -> Void in self.labelResults.text = "Destroy" })
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        alert.addAction(destroyAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func buttonTapped2(_ sender: UIButton) {
        let alert = UIAlertController(title: "Log In", message: "Enter Password", preferredStyle: .alert)
        alert.addTextField(configurationHandler: {(textField) in textField.placeholder = "Password here"; textField.isSecureTextEntry = true
        })
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
            let savedText = alert.textFields![0] as UITextField
            self.labelResults.text = savedText.text })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil) }
    
    

    
    
    func ShowAlert(dateTime : String) {
        let alert = UIAlertController(title: "Selected Date and Time", message: "\(dateTime)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in
            //Just dismiss the action sheet
        })
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let selectedDate: String = dateFormatter.string(from: sender.date)
        ShowAlert(dateTime: selectedDate)
    }
    
    @IBAction func getCurrentDateTime(_ sender: Any) {
        let selectedDate: String = dateFormatter.string(from: myDatePicker.date)
        ShowAlert(dateTime: selectedDate)

    }
}

