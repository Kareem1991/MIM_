var isCommingFromCheckOut = false
var isCommingFromMapAddress = false

public enum API: String {
//    case baseURL = "http://dev2.pinkmerce.com/rest/"
    case baseURL = "https://uat.pinkmerce.com/rest/"
}

enum SecetKeyPaymentSdk : String {
    case production = ""
    case development = "sk_test_XQ6n2GBUL1e0fFZysNJquIdM"
}
//enum otpUrl: String {
//
//    case forgetPassword = "http://dev2.pinkmerce.com/rest/all/V1/mobiconnect/customer/forgotpasswordwithotp"
//    case signUp = "http://dev2.pinkmerce.com/rest/all/V1/mobiconnect/customer/confirm_code"
//    case changeMobile = "http://dev2.pinkmerce.com/rest/all/V1/mobiconnect/customer/changenumber"
//    case changeMail = "http://dev2.pinkmerce.com/rest/all/V1/mobiconnect/customer/changeemail"
//
//}
public enum otpUrl {
    case forgetPassword, signUp , changeMobile , changeMail
    var rawValue: String {
        get {
            switch self {
            case .forgetPassword:
                return  "\(API.baseURL)\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/forgotpasswordwithotp"
            case .signUp:
                return "\(API.baseURL)\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/confirm_code"
            case .changeMobile:
                return "\(API.baseURL)\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/changenumber"
            case .changeMail:
                return "\(API.baseURL)\(UserStatus.lang ?? "en")/V1/mobiconnect/customer/changeemail"
            }
        }
    }
}
enum ViewAllUrl {
    case viewAllRecentAdded
    case viewAllInterests
    case viewAllDoubleTake
    case viewAllLikes
    case viewAllProductsByCat
}

enum MyOrders {
    case mySales
    case myPurchases
}

enum LikeUrl {
    case like
    case unlike
}
enum CartUrl {
    case add
    case remove
}
enum resendCodeStatus: String {
    case phone
    case email
}

class Constants {
    static let deviceToken = "deviceToken"
    static let isLogged = "isLogged"
    static let email = "email"
    static let token = "token"
    static let id = "id"
    static let name = "name"
    static let referralCode = "referralCode"
    static let lastName = "last_name"
    static let mobile = "mobile"
    static let image = "image"
    static let firebaseToken = "firebaseToken"
    static let googleAPI = "AIzaSyDOtj-U2UmthoMba435jqqS8L8mXAT2HOo"
    static let currencyIndex = "currencyIndex"
    static let currency = "currency"
    static let currencyName = "currencyName"
    static let currencyImage = "currencyImage"
    static let appLanguage = "appLanguage"
    static let UserKey = "UserKey"
//  static let baseURL = "http://dev2.pinkmerce.com/rest/"
    static let baseURL  = "https://uat.pinkmerce.com/rest/"
//  static let baseURL = "http://52.175.211.95/rest/"
//  static let baseURL = "https://dev.pinkmerce.com/workislam/rest/"
    static let isEnterIntro = "isEnterIntro"
    static var wrong: String { return "Something went wrong".localized }
    static let AccessTokenKey = "AccessTokenKey"
    static let Product = "ProductStb"
    static let sellProduct = "SellProductSTB"
    static let settingSTB = "SettingSTB"
    static let homeSTB = "Home"
    static let menuSTB = "SideMenuSTB"
    static let shopGuideSTB = "ShopGuideSTB"
    static let menuListSTB = "MenuSTB"
    static let helpSTB = "HelpSTB"
    static let ValidationSTB = "ValidationStb"
    static let sellProductSTB = "SellProductSTB"
    static let checkOutSTB = "CheckOutStoryboard"
    static let trackNavSTB = "MyOrders"
    static var selectedTabbarIndex: Int = 0
    static var privacy: String = "privacy-policy-cookie-restriction-mode"
    static var terms: String = "terms-and-conditions"
    static var about: String = "about-us"
    static var isCommingFromNotification = "isCommingFromNotification"
    static var orderId = "orderId"
    static var isNetworkFail = "isNetworkFail"
    static var cartCount = "cartCount"
}



