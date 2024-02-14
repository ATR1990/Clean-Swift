import UIKit

final class FAQTableViewCell: UITableViewCell {
    // MARK: - Properties
    private var hidesTopSeparator = false
    private var hidesBottomSeparator = false
    var item: FAQElement? {
        didSet {
            faqImage.image = UIImage(named: item?.icon ?? "document")
            infoLabel.text = item?.title
        }
    }

    // MARK: - UI
    private lazy var faqImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = AppFont.regular.s16()
        label.textColor = AppColor.black.uiColor
        return label
    }()

    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateSeparatorVisibility()
    }
    
    private func updateSeparatorVisibility() {
        let topSeparator = subviews.first {
            $0.frame.minY == 0 && $0.frame.height <= 1
        }
        let bottomSeparator = subviews.first {
            $0.frame.minY >= bounds.maxY - 1 && $0.frame.height <= 1
        }
        topSeparator?.isHidden = hidesTopSeparator
        bottomSeparator?.isHidden = hidesBottomSeparator
    }

    // MARK: - Public
    func setCornerRadius(
        forIndexPath indexPath: IndexPath, inTableView tableView: UITableView
    ) {
        let lastRow = tableView.numberOfRows(inSection: indexPath.section) - 1
            
        if indexPath.row == 0 {
            hidesTopSeparator = true
            applyRoundedCorners([.layerMaxXMinYCorner, .layerMinXMinYCorner])
        }
        if indexPath.row == lastRow {
            hidesBottomSeparator = true
            applyRoundedCorners([.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        }
    }
    
    private func applyRoundedCorners(_ maskedCorners: CACornerMask) {
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 16
        layer.maskedCorners = maskedCorners
    }

    // MARK: - Setup Views
    private func setupViews() {
        addSubview(faqImage)
        addSubview(infoLabel)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        faqImage.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-12)
        }
        infoLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(faqImage.snp.trailing).offset(12)
        }
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        self.item = nil
    }
}
