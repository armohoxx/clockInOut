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
        
        let timestamp = dataHistory.date_time
        let date = timestamp?.dateValue()
        let dayTimeFormatter = DateFormatter()
        dayTimeFormatter.timeZone = TimeZone.current
        dayTimeFormatter.dateFormat = "MMMM dd, yyyy - h:mm:ss a z"
        let currentDayTime = dayTimeFormatter.string(from: date ?? Date())
        
        let dataHistoryAll = "Date/Time: \(currentDayTime)\n" +
                             "Status: \(dataHistory.status ?? "")"

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
