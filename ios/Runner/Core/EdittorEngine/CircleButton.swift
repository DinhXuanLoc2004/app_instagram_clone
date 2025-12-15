class CircleButton: UIButton {

    private let size: CGFloat

    init(
        systemName: String,
        size: CGFloat = 44,
        imageSize: CGFloat = 16
    ) {
        self.size = size
        super.init(frame: .zero)

        let image = UIImage(systemName: systemName)?
            .withConfiguration(
                UIImage.SymbolConfiguration(pointSize: imageSize, weight: .bold)
            )

        setImage(image, for: .normal)
        tintColor = .white

        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        layer.cornerRadius = size / 2
        clipsToBounds = true

        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
        contentEdgeInsets = .zero
        imageEdgeInsets = .zero
        titleEdgeInsets = .zero
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        CGSize(width: size, height: size)
    }
}
