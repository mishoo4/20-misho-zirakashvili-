//
//  ViewController.swift
//  20(misho zirakashvili)
//
//  Created by misho zirakashvili on 09.08.22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    let pickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pickerView)
        setUpView()
        // Do any additional setup after loading the view.
    }
    func setUpView() {
        
        addPickerViewConstraints()
        configurePickerView()
    }
    func addPickerViewConstraints() {
        
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            pickerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            pickerView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    func configurePickerView() {
        
        pickerView.backgroundColor = .white
        pickerView.date = Date()
        pickerView.locale = .current
        pickerView.preferredDatePickerStyle = .wheels
    }
    @IBAction func calculatePrimeNumberBtn(_ sender: UIButton) {
        let primeNumberQueue = DispatchQueue(label: "℗")
        sender.isEnabled = false
        
        primeNumberQueue.async {
            self.printPrimeNumbers()
            DispatchQueue.main.async {
                self.indicator.startAnimating()
                sender.isEnabled = true
            }
        }
        self.indicator.stopAnimating()
    }
    private func printPrimeNumbers() {
        print(2)
        print(3)
        for each in stride(from: 5, through: 10000, by: 2) {
            if each.isPrime() {
                print(each)
            }
        }
    }
}
extension Int {
    func isPrime() -> Bool  {
        for each in 2 ... self / 2 {
            if self % each == 0 {
                return false
            }
        }
        return true
    }
}


