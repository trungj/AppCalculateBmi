//
//  ViewController.swift
//  CalculatorBMI
//
//  Created by trung on 11/10/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI () {
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 400
        weightSlider.minimumTrackTintColor = .green
        
        heightSlider.minimumValue = 30
        heightSlider.maximumValue = 220
        heightSlider.minimumTrackTintColor = .blue
    }

    @IBAction func actionChangeWeight(_ sender: UISlider) {
        weightLabel.text = String(format: "%.2f kg", sender.value)
    }
    
    @IBAction func actionChangeHeight(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f m", sender.value)
    }
    @IBAction func actionTinh(_ sender: UIButton) {
        // BMI = can nang / 2 * chieu cao
        let bmi = weightSlider.value / (2*heightSlider.value/100)
        print(bmi)
        
        
        var status: String = ""
        // Hien thi bang UIAlertController
        
        
        switch bmi {
                case ..<18.5:
                    status = "Gầy"
                    
        case 18.5...24.9:
                    status = "Bình thường"
                    
                case 25...29.9:
                    status = "Tăng cân"
                    
                case 30...34.9:
                    status = "Béo phì độ 1"
                    
                case 35...39.9:
                    status = "Béo phì độ 2"
                    
                default:
                    status = "Béo phì độ 3"
                }
        
        let alertController = UIAlertController(title: "Thong bao: \(status)", message: "Chi so BMI cua ban la: \(bmi)", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "Huy", style: .cancel)
        let actionRepeat = UIAlertAction(title: "Tinh lai", style: .default) { _ in
            self.weightSlider.value = self.weightSlider.minimumValue
            self.weightLabel.text = "0"
            
            self.heightSlider.value = self.heightSlider.minimumValue
            self.heightLabel.text = "0"
            
        }
        
        alertController.addAction(actionCancel)
        alertController.addAction(actionRepeat)
        
        present(alertController, animated: true)
        
    }
}

