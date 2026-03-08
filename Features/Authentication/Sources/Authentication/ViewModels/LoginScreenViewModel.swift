import Foundation
import Combine

@Observable
final class LoginScreenViewModel {

    // MARK: - Input States

    var emailAddress: String = ""
    var password: String = ""

    init() {

    }
}
