//
//  FoundRescueeTableViewCell.swift
//  BelocatedAlert
//
//  Created by RK on 21/08/24.
//

import UIKit

class FoundRescueeTableViewCell: UITableViewCell
{
    @IBOutlet var completedRescueeBg: UIImageView!
    @IBOutlet var rescueeCompletedStatusButton: UIButton!
    @IBOutlet var rescueeCompltedMessage: UILabel!
    @IBOutlet var rescueeCompletedMsgTwo: UILabel!
    @IBOutlet var rescueeCompletedDetailtext: UILabel!
    @IBOutlet var rescueeImage: UIImageView!
    @IBOutlet var rescueeName: UILabel!
    @IBOutlet var rescueeDetailsLabel: UILabel!
    @IBOutlet var rescueeDetailButton: UIButton!
    @IBOutlet var recueeDetailsView: UIView!
    @IBOutlet var completeRescueeDetailsTextheightConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        UpdateUI() // Function to update the Ui
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension FoundRescueeTableViewCell
{
    private func UpdateUI()
    {
        recueeDetailsView.applyGradient(hexColor1: "#FFFBE8", hexColor2: "#FFFFFF")
        recueeDetailsView.backgroundColor = .white
        recueeDetailsView.layer.cornerRadius = 16
        recueeDetailsView.layer.borderWidth = 1
        recueeDetailsView.layer.borderColor = UIColor().colorFromHexString("#FFCD00").cgColor
    }
    
    
    func terminatedRescuee()
    {
        completedRescueeBg.image = UIImage(named: "terminatedAlertBg")
        rescueeCompletedStatusButton.setImage(UIImage(named: "terminatedAlert"), for: .normal)
        rescueeCompltedMessage.text = "Rescue Terminated"
        rescueeCompltedMessage.textColor = UIColor().colorFromHexString("#D54C1A")
        rescueeCompletedMsgTwo.text = "The following alert chain has been terminated."
        rescueeCompletedMsgTwo.textColor = UIColor().colorFromHexString("#463A08")
        rescueeCompletedMsgTwo.numberOfLines = 0 // Allow multiple lines
        rescueeCompletedMsgTwo.lineBreakMode = .byWordWrapping // Break lines by words
        rescueeCompletedDetailtext.isHidden = true
        completeRescueeDetailsTextheightConstraint.constant = 0
        // Trigger layout updates to adjust cell height
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        // If this is in a table view cell, ensure the table view updates its layout
        if let tableView = self.superview as? UITableView 
        {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
}
