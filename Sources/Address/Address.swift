import Blake2b
import Bech32

public enum NetworkType {
    case test
    case main
}

public struct Address {
    
    let blake2b = Blake2b()
    let bip173 = Bip173()
    
    public init() {}
    
    func base(payment: [UInt8], stake: [UInt8], networkType: NetworkType) -> String {
        let paymentHash = blake2b.computeHash(payment)
        let stakeHash = blake2b.computeHash(stake)
        return address(hash: paymentHash + stakeHash, addressType: "addr", networkType: networkType, headerType: 0b0000_0000)
    }
        
    func enterprise(payment: [UInt8], networkType: NetworkType) -> String {
        let paymentHash = blake2b.computeHash(payment)
        return address(hash: paymentHash, addressType: "addr", networkType: networkType, headerType: 0b0110_0000)
    }
    
    func stake(payment: [UInt8], networkType: NetworkType) -> String {
        let paymentHash = blake2b.computeHash(payment)
        return address(hash: paymentHash, addressType: "stake", networkType: networkType, headerType: 0b1110_0000)
    }
    
    private func address(hash: [UInt8], addressType: String, networkType: NetworkType, headerType: UInt8) -> String {
        let hrp: String
        let header: UInt8
        switch networkType {
        case .test:
            hrp = "\(addressType)_test"
            header = headerType | 0
        case .main:
            hrp = addressType
            header = headerType | 1
        }
        
        let bech32 = bip173.bip173(hrp: hrp, [header] + hash)
        return bech32
    }

}
