//
//  ViewController.swift
//  UIElements
//
//  Created by Milton Palaguachi on 10/9/20.
//  Copyright © 2020 Milton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!

    @IBOutlet weak var title1Label: UILabel!
    @IBOutlet weak var title2Label: UILabel!
    @IBOutlet weak var title3Label: UILabel!

    @IBOutlet weak var countryPickerView: UIPickerView!
    @IBOutlet weak var datePickeView: UIDatePicker!

    
    var countries: [String] = CountryNames.countries
    var weekDays: [String] = DateInfo.days
    var months: [String] = DateInfo.months

    
    
    @IBAction func changedBackGroundColor(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .systemGroupedBackground
            
        } else {
            view.backgroundColor = .systemGray3
        }
    }
    //datepicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)

    override func viewDidLoad() {
        super.viewDidLoad()
        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        title = "UIElemts"
        title1Label.text = "Choose Country Destination"
        title2Label.text = "Picked Date"
        title3Label.text = "Changed background Color"
        datePickeView.datePickerMode = .date
        datePickeView.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker ){
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
           if let day = components.day, let month = components.month, let year = components.year {
            dateTextField.text = "\(day), \(months[month - 1]) \(year)"
           }
        
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        countries[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row]
    }
    
}


