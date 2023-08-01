import UIKit
import Security

class SessionManager {
    static let shared = SessionManager()
    
    private let service = "com.yourapp.session"
    private let account = "sessionToken"
    
    func saveSession(sessionToken: String) {
        let token = sessionToken.replacingOccurrences(of: "\"", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        guard let tokenData = token.data(using: .utf8) else {
            // Handle the conversion error
            return
        }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecValueData as String: tokenData
        ]
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status != errSecSuccess {
            // Handle the error when saving the token to the Keychain
        }
    }
    
    func getSessionToken() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account,
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess, let tokenData = result as? Data {
            return String(data: tokenData, encoding: .utf8)
        } else {
            // Handle the error when retrieving the token from the Keychain
            return nil
        }
    }
    
    func clearSession() {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: account
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        if status != errSecSuccess {
            // Handle the error when clearing the session from the Keychain
        }
    }
}
