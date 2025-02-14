import UIKit

class WatchDetailViewController: UIViewController {

    // MARK: - Properties
    weak var coordinator: WatchDetailCoordinator?

    private let mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("ボタン", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    // MARK: - Setup
    private func setupUI() {
        title = "詳細画面"
        view.backgroundColor = .white
        view.addSubview(mainButton)

        mainButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - Actions
    @objc private func buttonTapped() {
//        coordinator?.()
    }
}
