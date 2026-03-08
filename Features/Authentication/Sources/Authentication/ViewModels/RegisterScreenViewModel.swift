import Foundation
import Combine

enum NavigationDirection {
    case forward
    case backward
}

enum RegistrationStep: Int, CaseIterable {
    case username = 0
    case email
    case password
    case profile

    var title: String {
        switch self {
        case .username: return "Get started with a username"
        case .email:    return "Enter your email"
        case .password: return "Create a password"
        case .profile:  return "Set up your profile"
        }
    }

    var progress: Double {
        Double(rawValue + 1) / Double(RegistrationStep.allCases.count)
    }
}

@Observable
@MainActor
final class RegisterScreenViewModel {

    // MARK: - Input States

    var emailAddress: String = ""
    var username: String = ""
    var displayName: String = ""
    var password: String = ""
    var confirmPassword: String = ""

    // MARK: - Private properties

    var currentStep: RegistrationStep = .username
    var navigationDirection: NavigationDirection = .forward

    var isCurrentStepValid: Bool {
        switch currentStep {
        case .username: return isUsernameValid
        case .email:    return isEmailValid
        case .password: return isPasswordValid
        case .profile:  return isProfileValid
        }
    }

    var isUsernameValid: Bool {
        username.count >= 3 && !username.contains(" ")
    }

    var isEmailValid: Bool {
        let regex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/
        return (try? regex.ignoresCase().wholeMatch(in: emailAddress)) != nil
    }

    var isPasswordValid: Bool {
        password.count >= 8 && password == confirmPassword
    }

    var isProfileValid: Bool {
        displayName.count >= 2
    }

    init() {}

    // MARK: - Public methods

    func nextStep() {
        guard isCurrentStepValid else {
            return
        }

        guard let next = RegistrationStep(rawValue: currentStep.rawValue + 1) else {
            // TODO: Handle submit
            return
        }

        navigationDirection = .forward
        currentStep = next
    }

    func previousStep() {
        guard let prev = RegistrationStep(rawValue: currentStep.rawValue - 1) else { return }
        navigationDirection = .backward
        currentStep = prev
    }
}
