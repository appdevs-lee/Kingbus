//
//  RecentSearchTableViewCell.swift
//  Kingbus
//
//  Created by 이주성 on 1/3/25.
//

import UIKit

final class RecentSearchTableViewCell: UITableViewCell {
    
    lazy var placeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .useCustomImage("placeImage")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var placeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .useRGB(red: 46, green: 45, blue: 45)
        label.font = .useFont(ofSize: 14, weight: .Regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .useRGB(red: 148, green: 147, blue: 147)
        label.font = .useFont(ofSize: 12, weight: .Regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(.useCustomImage("deleteImage"), for: .normal)
        button.addTarget(self, action: #selector(deleteButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setCellFoundation()
        self.initializeViews()
        self.setGestures()
        self.setNotificationCenters()
        self.setSubviews()
        self.setLayouts()
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

// MARK: Extension for essential methods
extension RecentSearchTableViewCell {
    // Set view foundation
    func setCellFoundation() {
        self.selectionStyle = .none
        self.contentView.isUserInteractionEnabled = true
        
    }
    
    // Initialize views
    func initializeViews() {
        
    }
    
    // Set gestures
    func setGestures() {
        
    }
    
    // Set notificationCenters
    func setNotificationCenters() {
        
    }
    
    // Set subviews
    func setSubviews() {
        SupportingMethods.shared.addSubviews([
            self.placeImageView,
            self.placeNameLabel,
            self.addressLabel,
            self.deleteButton,
        ], to: self)
    }
    
    // Set layouts
    func setLayouts() {
        //let safeArea = self.safeAreaLayoutGuide
        
        // placeImageView
        NSLayoutConstraint.activate([
            self.placeImageView.widthAnchor.constraint(equalToConstant: 36),
            self.placeImageView.heightAnchor.constraint(equalToConstant: 36),
            self.placeImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.placeImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.placeImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
        
        // placeNameLabel
        NSLayoutConstraint.activate([
            self.placeNameLabel.leadingAnchor.constraint(equalTo: self.placeImageView.trailingAnchor, constant: 8),
            self.placeNameLabel.trailingAnchor.constraint(equalTo: self.deleteButton.leadingAnchor, constant: -8),
            self.placeNameLabel.topAnchor.constraint(equalTo: self.placeImageView.topAnchor),
        ])
        
        // addressLabel
        NSLayoutConstraint.activate([
            self.addressLabel.leadingAnchor.constraint(equalTo: self.placeImageView.trailingAnchor, constant: 8),
            self.addressLabel.trailingAnchor.constraint(equalTo: self.deleteButton.leadingAnchor, constant: -8),
            self.addressLabel.bottomAnchor.constraint(equalTo: self.placeImageView.bottomAnchor),
        ])
        
        // deleteButton
        NSLayoutConstraint.activate([
            self.deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.deleteButton.centerYAnchor.constraint(equalTo: self.placeImageView.centerYAnchor),
            self.deleteButton.heightAnchor.constraint(equalToConstant: 18),
            self.deleteButton.widthAnchor.constraint(equalToConstant: 18),
        ])
    }
}
                         

// MARK: - Extension for methods added
extension RecentSearchTableViewCell {
    func setCell(searchPlace: SearchData) {
        self.placeNameLabel.text = searchPlace.placeName
        self.addressLabel.text = searchPlace.roadAddressName == "" ? searchPlace.addressName : searchPlace.roadAddressName
        
    }
    
}

// MARK: - Extension for methods added
extension RecentSearchTableViewCell {
    @objc func deleteButton(_ seder: UIButton) {
        
    }
    
}
