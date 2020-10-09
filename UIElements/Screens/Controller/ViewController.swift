//
//  ViewController.swift
//  UIElements
//
//  Created by Milton Palaguachi on 10/9/20.
//  Copyright © 2020 Milton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets Declaration
    
    @IBOutlet private weak var countryTextField: UITextField!
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var title1Label: UILabel!
    @IBOutlet private weak var title2Label: UILabel!
    @IBOutlet private weak var title3Label: UILabel!
    @IBOutlet private weak var title4Label: UILabel!
    @IBOutlet private weak var sliderResultLabel: UILabel!
    @IBOutlet private weak var countryPickerView: UIPickerView!
    @IBOutlet private weak var datePickeView: UIDatePicker!
    @IBOutlet private weak var rateSlider: UISlider!
    
    // MARK: - Store Properties Declaration
    
    private var countries: [String] = CountryNames.countries
    private var weekDays: [String] = DateInfo.days
    private var months: [String] = DateInfo.months
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIProperties()
    }
    
    // MARK: - setupUIProperties
    func setupUIProperties() {
        
        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        title = "Trip Planning"
        title1Label.text = "Choose Country Destination"
        title2Label.text = "Pick Date"
        title3Label.text = "Changed background Color"
        title4Label.text = "Rate my UI Elments Implementaiton: "
        sliderResultLabel.text = "Rate: "
        
        datePickeView.datePickerMode = .date
        datePickeView.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
    }
    
    // MARK: - Changed Back GroundColor of the View

    @IBAction func changedBackGroundColor(_ sender: UISwitch) {
        if sender.isOn {
            view.backgroundColor = .systemGroupedBackground
        } else {
            view.backgroundColor = .systemGray3
        }
    }
    
    // MARK: - movedSlider: update sliderResultLabel

    @IBAction func movedSlider(_ sender: UISlider) {
        sliderResultLabel.text = "Rate: \(Int(rateSlider.value * 10))"
    }
    
    // MARK: - dateChanged: update dateTextField
    
    @objc func dateChanged(_ sender: UIDatePicker ) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
           if let day = components.day, let month = components.month, let year = components.year {
            dateTextField.text = "\(day), \(months[month - 1]) \(year)"
           }
    }
    
}

// MARK: - Delegate DataSource for UIPickerView

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
