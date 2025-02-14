import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    weak var coordinator: MainCoordinator?

    private let mainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("詳細画面へ", for: .normal)
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
        title = "メイン画面"
        view.backgroundColor = .white
        view.addSubview(mainButton)

        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - Actions
    @objc private func mainButtonTapped() {
        coordinator?.showDetail()
    }
}