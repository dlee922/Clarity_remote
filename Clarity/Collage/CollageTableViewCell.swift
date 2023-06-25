//
//  CollageTableViewCell.swift
//  Clarity
//
//  Created by Isha Chadalavada on 6/24/23.
//


import UIKit
 
  

class CollageTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var imageCell: UIImageView!
    var labelText: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupWrapperCellView()
        setupImageCell()
        setupLabelText()
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupImageCell(){
        imageCell = UIImageView()
        imageCell.image = UIImage(systemName: "photo")
        imageCell.contentMode = .scaleAspectFill
        imageCell.clipsToBounds = true
        imageCell.layer.cornerRadius = 10
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageCell)
    }
    func setupLabelText(){
        labelText = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelText)
    }

    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            imageCell.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 4),
            imageCell.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: 20),
            imageCell.centerXAnchor.constraint(equalTo: wrapperCellView.centerXAnchor),
//            imageCell.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 4),
//            imageCell.trailingAnchor.constraint(equalTo: wrapperCellView.trailingAnchor, constant: 4),
            imageCell.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: 2),
            
            labelText.topAnchor.constraint(equalTo: imageCell.bottomAnchor, constant: 4),
            labelText.leadingAnchor.constraint(equalTo: imageCell.leadingAnchor),
            labelText.centerXAnchor.constraint(equalTo: imageCell.centerXAnchor),
            labelText.bottomAnchor.constraint(equalTo: wrapperCellView.bottomAnchor, constant: 2),

//
            wrapperCellView.heightAnchor.constraint(equalToConstant: 76)
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
