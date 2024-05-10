//
//  LessonDetailsCell.swift
//  OlympIt
//
//  Created by Nariman on 09.05.2024.
//

import UIKit

final class LessonDetailsCell: UITableViewCell, ReusableView {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ._252527
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let accessoryCircleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 3
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ._727274
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: LessonOutput) {
        let accessoryBgColor: UIColor
        
        switch model.hardness {
        case .low:
            accessoryBgColor = .green
        case .medium:
            accessoryBgColor = .orange
        case .hard:
            accessoryBgColor = .red
        }
        
        titleLabel.text = model.name
        descriptionLabel.text = model.description
        accessoryCircleView.backgroundColor = accessoryBgColor
    }
}

private extension LessonDetailsCell {
    func setupViews() {
        contentView.backgroundColor = ._37343B
        
        contentView.addSubviews(containerView)
        
        containerView.addSubviews(accessoryCircleView, titleLabel, descriptionLabel)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
            make.height.greaterThanOrEqualTo(110)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.leading.equalTo(accessoryCircleView.snp.trailing).offset(4)
        }
        
        accessoryCircleView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(8)
            make.size.equalTo(6)
            make.centerY.equalTo(titleLabel.snp.centerY)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalToSuperview().inset(16)
        }
    }
}
