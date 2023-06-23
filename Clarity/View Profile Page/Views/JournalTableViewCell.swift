//
//  JournalTableViewCell.swift
//  Clarity
//
//  Created by Daniel Lee on 6/22/23.
//

import UIKit

class JournalTableViewCell: UITableViewCell {

    var wrapperCellView: UIView!
    var labelDateTime: UILabel!
    var labelText: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupLabelDateTime()
        setupLabelText()
        
        initConstraints()
    }

    func setupWrapperCellView() {
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelDateTime() {
        labelDateTime = UILabel()
        labelDateTime.font = UIFont.boldSystemFont(ofSize: 16)
        labelDateTime.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelDateTime)
    }
    
    func setupLabelText() {
        labelText = UILabel()
        labelText.font = UIFont.boldSystemFont(ofSize: 16)
        labelText.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelText)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor,constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelDateTime.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelDateTime.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelDateTime.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            labelText.topAnchor.constraint(equalTo: labelDateTime.bottomAnchor, constant: 8),
            labelText.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            labelText.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            labelText.heightAnchor.constraint(equalToConstant: 24),
//            labelText.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: 2),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 72)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
