//
//  ViewController.swift
//  BelocatedAlert
//
//  Created by RK on 19/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableview: UITableView!
    var cellHeights: [Int: CGFloat] = [0: 100, 1: 100] // Dictionary to track the heights of each section
    var isSupportCastCollapsed: Bool = false // State variable to track the collapse state
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register the custom cell nib files with the table view
        tableview.register(UINib(nibName: "RescuerHistoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RescuerHistoryTableViewCell")
        tableview.register(UINib(nibName: "SupportCastTableViewCell", bundle: nil), forCellReuseIdentifier: "SupportCastTableViewCell")
        //HeaderTableViewCell
        tableview.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCell")
        //FoundRescueeTableViewCell
        tableview.register(UINib(nibName: "FoundRescueeTableViewCell", bundle: nil), forCellReuseIdentifier: "FoundRescueeTableViewCell")
        tableview.rowHeight = UITableView.automaticDimension
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Return the number of rows in each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return isSupportCastCollapsed ? 1 : 5
        case 2:
            return 1 // Number of rows in the Current Rescuer section
        case 3:
            return 2 // Number of rows in the Rescuer History section
        default:
            return 1 // Default number of rows if section is out of bounds
        }
    }
    
    // Return the number of sections
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 4 // Total number of sections
    }
    
    // Configure and return a cell for a given index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let FoundRescueeCell = tableView.dequeueReusableCell(withIdentifier: "FoundRescueeTableViewCell", for: indexPath) as! FoundRescueeTableViewCell
            return FoundRescueeCell
        case 1:
            let supportCastCell = tableView.dequeueReusableCell(withIdentifier: "SupportCastTableViewCell", for: indexPath) as! SupportCastTableViewCell
            supportCastCell.assigneeNumberlabel.text = String(indexPath.row+1)
            if isSupportCastCollapsed {
                // Show only the "Accepted" cell and hide others
                supportCastCell.updateCellUi(assigneState: "Accepted", name: "Back Anthony", Relation: "Uncle")
            } else {
                switch indexPath.row {
                case 0:
                    supportCastCell.updateCellUi(assigneState: "Reassigned", name: "Back Anthony", Relation: "Uncle")
                case 1:
                    supportCastCell.updateCellUi(assigneState: "Alerted", name: "Derik John", Relation: "Brother")
                case 2:
                    supportCastCell.updateCellUi(assigneState: "Pending", name: "Mason Jose", Relation: "Friend")
                case 3:
                    supportCastCell.updateCellUi(assigneState: "Accepted", name: "Derik John", Relation: "Brother")
                default:
                    supportCastCell.updateCellUi(assigneState: "Accepted", name: "Back Anthony", Relation: "Uncle")
                }
            }
            return supportCastCell
            
        case 2:
            // Configure and return RescuerHistoryTableViewCell
            let currentRescuerCell = tableView.dequeueReusableCell(withIdentifier: "RescuerHistoryTableViewCell", for: indexPath) as! RescuerHistoryTableViewCell
            currentRescuerCell.messageLabel.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s..."
            return currentRescuerCell
        case 3:
            // Configure and return RescuerHistoryTableViewCell with custom styling
            let rescuerHistoryCell = tableView.dequeueReusableCell(withIdentifier: "RescuerHistoryTableViewCell", for: indexPath) as! RescuerHistoryTableViewCell
            
            // Set text color for various labels
            let textColor = UIColor(hex: "#636569")
            rescuerHistoryCell.locationDistance.textColor = textColor
            rescuerHistoryCell.message.textColor = textColor
            rescuerHistoryCell.location.textColor = textColor
            rescuerHistoryCell.scannedOn.textColor = textColor
            rescuerHistoryCell.resucerName.textColor = textColor
            rescuerHistoryCell.resucerStatus.textColor = textColor
            
            // Hide buttons
            rescuerHistoryCell.callButton.isHidden = true
            rescuerHistoryCell.viewLoactionButton.isHidden = true
            
            // Add a separator image view to cells in section 2, excluding the first row
            if indexPath.row >= 1
            {
                let separatorImageView = UIImageView(image: UIImage(named: "dashed line"))
                separatorImageView.translatesAutoresizingMaskIntoConstraints = false
                rescuerHistoryCell.contentView.addSubview(separatorImageView)
                
                // Set up constraints for the separator image view
                NSLayoutConstraint.activate([
                    separatorImageView.leadingAnchor.constraint(equalTo: rescuerHistoryCell.contentView.leadingAnchor, constant: 15),
                    separatorImageView.trailingAnchor.constraint(equalTo: rescuerHistoryCell.contentView.trailingAnchor, constant: -15),
                    separatorImageView.topAnchor.constraint(equalTo: rescuerHistoryCell.contentView.topAnchor, constant: 10),
                    separatorImageView.heightAnchor.constraint(equalToConstant: 1)
                ])
            }
            return rescuerHistoryCell
        default:
            return UITableViewCell() // Return a default cell if section is out of bounds
        }
  
        
    }
    
    // Return the height of the header for each section
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if section == 0
        {
            return 0
        }
        else
        {
            return  42 // Hide header for section 0, show for others
        }
    }
    
    // Create and return a custom view for the header of each section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {// Configure the header view
        switch section
        {
        case 1:
            let SupportCastheaderView = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            SupportCastheaderView.hideAndShowDetailsButton.addTarget(self, action: #selector(hideBtnAction(sender:)), for: .touchUpInside)
            SupportCastheaderView.isHidden = false
            return SupportCastheaderView
        case 2:
            let CurrentRescuerHeaderView = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            CurrentRescuerHeaderView.headerTitleLabel.text = "CurrentRescuer"
            return CurrentRescuerHeaderView
        case 3:
            let RescuerHistoryHeaderView = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            RescuerHistoryHeaderView.headerTitleLabel.text = "Rescuer History"
            return RescuerHistoryHeaderView
        default:
            return UITableViewCell()
        }
    }
    
    
    // Return the height of each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController {
    
    @objc func hideBtnAction(sender: UIButton) {
        // Toggle the collapse state
        isSupportCastCollapsed.toggle()
        
        // Reload the Support Cast section (section 0)
        tableview.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    // Toggle the height of the specified section when the button is tapped
    @objc func toggleSectionHeight(_ sender: UIButton) {
        let section = sender.tag
        if cellHeights[section] == 100 {
            cellHeights[section] = 50 // Reduce height
        } else {
            cellHeights[section] = 100 // Reset height
        }
        
        // Update the table view to reflect the height changes
        tableview.beginUpdates()
        tableview.endUpdates() // This animates the height change
    }
    // Create and configure a custom header view with a title and a toggle button
    func createHeaderView(title: String, tableViewWidth: CGFloat, section: Int) -> UIView {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0) // Background color
        
        // Create and configure the title label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.textColor = UIColor.darkGray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        
        // Create and configure the toggle button
        let toggleButton = UIButton(type: .custom)
        toggleButton.setImage(UIImage(named: "hide details"), for: .normal)
        toggleButton.tintColor = .clear
        toggleButton.titleLabel?.textAlignment = .right
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.tag = section
        toggleButton.addTarget(self, action: #selector(toggleSectionHeight(_:)), for: .touchUpInside)
        headerView.addSubview(toggleButton)
        
        // Set up constraints for the title label and toggle button
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            
            toggleButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -15),
            toggleButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            toggleButton.widthAnchor.constraint(equalToConstant: 100),
            toggleButton.heightAnchor.constraint(equalToConstant: 42)
        ])
        
        // Ensure the header view has the correct height
        headerView.frame.size.height = 42
        
        return headerView
    }
}

extension UIColor {
    
    // Convert a hex color string to a UIColor object
    func colorFromHexString(_ hex: String) -> UIColor {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt32 = 0
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        let length = hexSanitized.count
        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return .red }
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        } else {
            return .red
        }
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
    
    // Convenience initializer to create UIColor from hex string
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            self.init(white: 1.0, alpha: 0.0)
            return
        }
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

extension UIView {
    
    // Apply a gradient to the view
    func applyGradient(hexColor1: String, hexColor2: String) {
        let color1 = UIColor(hex: hexColor1)
        let color2 = UIColor(hex: hexColor2)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 16
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    // Apply a gradient to the footer of the view
    func applyGradientFooter(hexColor1: String, hexColor2: String) {
        let color1 = UIColor(hex: hexColor1)
        let color2 = UIColor(hex: hexColor2)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = self.bounds
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
