import UIKit

class LoginViewController: UIViewController {
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8.0
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLayout()
        prepareActions()
    }
    
    private func prepareLayout() {
        title = nil
        view.backgroundColor = .white
        view.addSubview(loginButton)
        
        loginButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        loginButton.center = view.center
    }
    
    private func prepareActions() {
        loginButton.addTarget(self, action: #selector(onLoginButtonPress), for: .touchUpInside)
    }
    
    @objc private func onLoginButtonPress() {
        let mainView = MainViewController()
        mainView.modalPresentationStyle = .fullScreen
        mainView.loadViewIfNeeded()
        
        present(mainView, animated: true)
    }
}
