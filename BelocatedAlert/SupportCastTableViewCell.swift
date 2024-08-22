//
//  SupportCastTableViewCell.swift
//  BelocatedAlert
//
//  Created by RK on 20/08/24.
//

import UIKit

class SupportCastTableViewCell: UITableViewCell 
{
    
    @IBOutlet var assignesBgView: UIView!          // Background view for assignees
    @IBOutlet var AssigneProfileImage: UIImageView! // Profile image of assignee
    @IBOutlet var assigneCallButton: UIButton!     // Button for calling assignee
    @IBOutlet var assigneName: UILabel!            // Label for assignee's name
    @IBOutlet var assigneRelation: UILabel!        // Label for assignee's relation
    @IBOutlet var footerView: UIView!              // Footer view of the cell
    @IBOutlet var assignStatusLabel: UILabel!      // Label for displaying the assignment status
    @IBOutlet var assigneDistanceLabel: UILabel!   // Label for displaying the distance of the assignee
    @IBOutlet var assigneStatusButton: UIButton!   // Label for displaying the distance of the assignee
    @IBOutlet var assigneeNumberlabel: UILabel!    // Label for displaying the distance of the assignee
    @IBOutlet var acceptedSupportCastTick: UIImageView!
    override func awakeFromNib() 
    {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // Additional layout code if needed
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state if needed
    }

    /// Configures the cell UI based on the provided assignment state.
    /// - Parameters:
    ///   - assigneState: The state of the assignment, affecting the cell's appearance.
    ///   - name: The name of the assignee.
    ///   - Relation: The relation of the assignee.
    func updateCellUi(assigneState: String, name: String, Relation: String) 
    {
        switch assigneState 
        {
        case "Reassigned":
            configureReassignedState()
        case "Alerted":
            configureAlertedState()
        case "Pending":
            configurePendingState()
        case "Accepted":
            configureAcceptedState()
        default:
            break
        }
        // Update common labels
        assigneName.text = name
        assigneRelation.text = Relation
    }

    // Sets up the initial UI configuration of the cell.
    private func setupUI() 
    {
        assignesBgView.layer.cornerRadius = 16
        assignesBgView.layer.borderWidth = 1
        assignesBgView.backgroundColor = .clear
        footerView.backgroundColor = .white
        footerView.roundBottomCorners(cornerRadius: 16)
        contentView.backgroundColor = .clear
    }

    // Configures the cell for the "Reassigned" state.
    private func configureReassignedState() 
    {
        assignesBgView.applyGradient(hexColor1: "#FFF3EF", hexColor2: "#FFFFFF")
        footerView.applyGradientFooter(hexColor1: "#FFE3D9", hexColor2: "#FFE0D500")
        assignesBgView.layer.borderColor = UIColor().colorFromHexString("#EBEAEA").cgColor
        AssigneProfileImage.image = UIImage(named: "Reassigned_SupportCast")
        assignStatusLabel.text = "Reassigned"
        assignStatusLabel.textColor = UIColor().colorFromHexString("#D54C1A")
        assigneCallButton.isHidden = false
        assignStatusLabel.isHidden = false
        assigneStatusButton.isHidden = true
    }

    // Configures the cell for the "Alerted" state.
    private func configureAlertedState()
    {
        assignesBgView.layer.borderColor = UIColor().colorFromHexString("#56BC56").cgColor
        AssigneProfileImage.image = UIImage(named: "alertedAssigne")
        assignesBgView.layer.borderColor = UIColor().colorFromHexString("#FFCD00").cgColor
        assignesBgView.applyGradient(hexColor1: "#FFFBE8", hexColor2: "#FFFFFF")
        footerView.applyGradientFooter(hexColor1: "#FFEFAF", hexColor2: "#FFF8DB00")
        assignStatusLabel.isHidden = true
        assigneCallButton.isHidden = true
        assigneStatusButton.isHidden = true
    }

    // Configures the cell for the "Pending" state.
    private func configurePendingState()
    {
        assignesBgView.layer.borderColor = UIColor().colorFromHexString("#56BC56").cgColor
        AssigneProfileImage.image = UIImage(named: "pendingAssigne")
        assignesBgView.layer.borderColor = UIColor().colorFromHexString("#EBEAEA").cgColor
        assignesBgView.backgroundColor = UIColor().colorFromHexString("#FFFFFF")
        footerView.applyGradientFooter(hexColor1: "#F9F9F9", hexColor2: "#F9F9F900")
        assignStatusLabel.isHidden = true
        assigneStatusButton.isHidden = false
    }

    // Configures the cell for the "Accepted" state.
    private func configureAcceptedState()
    {
        assignesBgView.layer.borderColor = UIColor().colorFromHexString("#56BC56").cgColor
        AssigneProfileImage.image = UIImage(named: "acceptedAssigne")
        assignesBgView.layer.borderColor = UIColor().colorFromHexString("#EBEAEA").cgColor
        assignesBgView.applyGradient(hexColor1: "#E9F5E9", hexColor2: "#FFFFFF")
        footerView.applyGradientFooter(hexColor1: "#DFF3DF", hexColor2: "#C1F0C100")
        assignStatusLabel.text = "Accepted"
        assignStatusLabel.textColor = UIColor().colorFromHexString("#56BC56")
        assignStatusLabel.isHidden = false
        assigneStatusButton.isHidden = true
        acceptedSupportCastTick.isHidden = false
    }
}

extension UIView 
{
    /// Rounds the bottom corners of the view.
    /// - Parameter cornerRadius: The radius of the corners to be rounded.
    func roundBottomCorners(cornerRadius: CGFloat) {
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
