//
//  ViewController.swift
//  HomeTask10TB
//
//  Created by MacBook on 21.01.22.
//

import UIKit

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeSegment ()
        setupUI()
    }
    func setupUI () {
        sliderLabel.text = "How much do you weight?"
        slider.minimumValue = 50
        slider.maximumValue = 200
        slider.maximumTrackTintColor = .red
        slider.minimumTrackTintColor = .white
        slider.thumbTintColor = .black
        datePicker.locale = Locale(identifier: "ru_Ru")
        getResult.layer.cornerRadius = 10
    }

    @IBOutlet private var mainLabel: UILabel!

    @IBOutlet private var sliderLabel: UILabel!

    @IBOutlet private var slider: UISlider!

    @IBOutlet private var dateLabel: UILabel!

    @IBOutlet private var datePicker: UIDatePicker!

    @IBOutlet private var segment: UISegmentedControl!

    @IBOutlet private var switchButton: UISwitch!

    @IBOutlet private var getResult: UIButton!

    @IBOutlet private var switchLabel: UILabel!

    @IBAction private func doneButtonTap() {
        mainLabel.text = String(result)
    }
    private func summOfResult () -> Double {
        result = (age/10 + multiPL + weight)
        return result
    }
    @IBAction private func changeDate() {
        var yearOfBirth = Double(datePicker.calendar.component(.year, from: datePicker.date))
        let date = Date()
        let currentYear = Double(Calendar.current.component(.year, from: date))
        age = currentYear - yearOfBirth
        summOfResult ()
    }
    
    private var result = 0.0
    private var age = 0.0
    private var multiPL = 0.0
    private var weight = 0.0
    

    @IBAction private func changeSegment () {
    
        switch segment.selectedSegmentIndex {
        case 0:
            multiPL = 0.9
        case 1:
            multiPL = 2
        case 2:
            multiPL = 0.5
        default: break
        }
        summOfResult ()

    }

    @IBAction private func sliderMove() {
        sliderLabel.text = String(round(slider.value))
        weight = Double(slider.value/100)

    }

    @IBAction private func switcher () {
        segment.isHidden.toggle()
        mainLabel.isHidden.toggle()
        slider.isHidden.toggle()
        sliderLabel.isHidden.toggle()
        datePicker.isHidden.toggle()
        switchLabel.text = switchButton.isOn ? "Are you adult" : "Get out"
    }
    @IBAction func textAction(_ sender: Any) {
//        if let text = volumeField.text,
//           let vol = Float(text) {
//            volumeProgress.progress = vol
//            volumeSlider.value = vol
//        }else{
//            getResult.text = "wrong value"
//        }
    }

}



