import UIKit

class OlympTableViewCell: UITableViewCell, ReusableView {
    private let containerView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = ._252527
        view.axis = .vertical
        view.alignment = .leading
        view.spacing = 5
        view.distribution = .fill
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = ._727274
        label.font = .systemFont(ofSize: 9, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: OlympModel) {
        titleLabel.text = model.year
        descriptionLabel.text = model.description
    }
}

extension OlympTableViewCell {
    func setupViews() {
        layer.cornerRadius = 12
        backgroundColor = ._252527
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(12)
            make.horizontalEdges.equalToSuperview().inset(12)
        }
        [titleLabel, descriptionLabel].forEach { containerView.addArrangedSubview($0)}
    }
}
