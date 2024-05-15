//
//  vegetableViewCellTableViewCell.swift
//  E-Commerce
//
//  Created by Anshika Pathak on 15/05/24.
//

import UIKit


class vegetableViewCellTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLable :UILabel!
    @IBOutlet weak var decribptionLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var addToLbl: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var vegetableImg: UIImageView!
    @IBOutlet weak var wholeView: UIView!
    
    var buttonTapped: (() -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUi()
        
    }
    
    @IBAction func addToCart(_ sender: UIButton) {
        buttonTapped?()
    }

   
    @IBAction func plusButtonAdded(_ sender: UIButton) {
        if let currentText = addToLbl.text, let currentValue = Int(currentText) {
            let newValue = currentValue + 1
            addToLbl.text = "\(newValue)"
        }
    }
    
    @IBAction func minusButtonAdded(_ sender: UIButton) {
        if let currentText = addToLbl.text, var currentValue = Int(currentText) {
               if currentValue > 0 {
                   currentValue -= 1
                   addToLbl.text = "\(currentValue)"
               }
           }
    }
    
    func configure(title: String , decription: String , image: UIImage?) {
        titleLable.text = title
        decribptionLabel.text = decription
        vegetableImg.image = image
    }
    
    func updateUi(){
        let borderColorHex = "#00A9B7"
        wholeView.layer.borderColor = UIColor(hex: borderColorHex).cgColor
        wholeView.layer.cornerRadius = 10
        wholeView.layer.borderWidth = 2
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
