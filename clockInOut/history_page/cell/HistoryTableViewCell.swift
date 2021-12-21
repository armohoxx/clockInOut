//
//  HistoryTableViewCell.swift
//  clockInOut
//
//  Created by armyxx on 20/12/2564 BE.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    static let identifier = "HistoryTableViewCell"
    @IBOutlet weak var textViewData: UITextView!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with dataHistory: DataHistory) {
        let dataHistoryAll = "Date/Time: \(dataHistory.date_time ?? "null data") Status: \(dataHistory.status ?? "")"
        
        textViewData.text = "\(dataHistoryAll)"
        textViewHeight.constant = self.textViewData.contentSize.height
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "HistoryTableViewCell", bundle: nil)
    }
    
}
