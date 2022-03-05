import XCTest
@testable import Address

final class AddressTests: XCTestCase {
    
    // MARK: - Base

    func testCorrectPrefixForMainNet() {
        // given
        let sut = Address()

        // when
        let address = sut.base(payment: [], stake: [], networkType: .main)

        // then
        XCTAssertEqual(address.prefix(4), "addr")
    }
    
    func testCorrectPrefixForTestNet() {
        // given
        let sut = Address()

        // when
        let address = sut.base(payment: [], stake: [], networkType: .test)

        // then
        XCTAssertEqual(address.prefix(9), "addr_test")
    }
    
    func testPrefixForMainNetEndsWithSeparator() {
        // given
        let sut = Address()

        // when
        let address = sut.base(payment: [], stake: [], networkType: .main)

        // then
        XCTAssertEqual(address.prefix(5), "addr1")
    }
    
    func testHeaderForMainNet() {
        // given
        let sut = Address()

        // when
        let address = sut.base(payment: [], stake: [], networkType: .main)

        // then
        XCTAssertEqual(address.prefix(6), "addr1q")
    }
    
    func testHeaderForTestNet() {
        // given
        let sut = Address()

        // when
        let address = sut.base(payment: [], stake: [], networkType: .test)

        // then
        XCTAssertEqual(address.prefix(11), "addr_test1q")
    }
    
    func testTestnetAddressWithOneBytePayment() {
        // given
        let sut = Address()

        // when
        let address = sut.base(payment: [0], stake: [], networkType: .test)

        // then
        XCTAssertEqual(address, "addr_test1qqxefct5wvh0n2h88uu44dz9q7l6nq7k2q3uzx54ruxr9eyrdnrgjvwzun37swrq9m9pjqjer5sksda6lh07duxgevrste6kq9")
    }
    
    func testTestnetAddressWithOneBytePaymentAndOneByteStake() {
        // given
        let sut = Address()

        // when
        let address = sut.base(payment: [0], stake: [0], networkType: .test)

        // then
        XCTAssertEqual(address, "addr_test1qqxefct5wvh0n2h88uu44dz9q7l6nq7k2q3uzx54ruxr9eqdjnshguewlx4ww0eet26y2pal4xpav5prcydf28cvxtjqunl6rf")
    }
    
    // MARK: - Enterprise
    
    func testEnterpriseCorrectPrefixForMainNet() {
        // given
        let sut = Address()

        // when
        let address = sut.enterprise(payment: [], networkType: .main)

        // then
        XCTAssertEqual(address.prefix(4), "addr")
    }
    
    func testEnterpriseCorrectPrefixForTestNet() {
        // given
        let sut = Address()

        // when
        let address = sut.enterprise(payment: [], networkType: .test)

        // then
        XCTAssertEqual(address.prefix(9), "addr_test")
    }
    
    func testEnterpriseHeaderForMainNet() {
        // given
        let sut = Address()

        // when
        let address = sut.enterprise(payment: [], networkType: .main)

        // then
        XCTAssertEqual(address.prefix(6), "addr1v")
    }
    
    func testEnterpriseHeaderForTestNet() {
        // given
        let sut = Address()

        // when
        let address = sut.enterprise(payment: [], networkType: .test)

        // then
        XCTAssertEqual(address.prefix(11), "addr_test1v")
    }
    
    func testEnterpriseTestnetAddressWithOneBytePayment() {
        // given
        let sut = Address()

        // when
        let address = sut.enterprise(payment: [0], networkType: .test)

        // then
        XCTAssertEqual(address, "addr_test1vqxefct5wvh0n2h88uu44dz9q7l6nq7k2q3uzx54ruxr9eqq6x8va")
    }
    
    // MARK: - Stake
    
    func testStakeCorrectPrefixForMainNet() {
        // given
        let sut = Address()

        // when
        let address = sut.stake(payment: [], networkType: .main)

        // then
        XCTAssertEqual(address.prefix(5), "stake")
    }
    
    func testStakeCorrectPrefixForTestNet() {
        // given
        let sut = Address()

        // when
        let address = sut.stake(payment: [], networkType: .test)

        // then
        XCTAssertEqual(address.prefix(10), "stake_test")
    }
    
    func testStakeHeaderForMainNet() {
        // given
        let sut = Address()

        // when
        let address = sut.stake(payment: [], networkType: .main)

        // then
        XCTAssertEqual(address.prefix(7), "stake1u")
    }
    
    func testStakeTestnetAddressWithOneBytePayment() {
        // given
        let sut = Address()

        // when
        let address = sut.stake(payment: [0], networkType: .test)

        // then
        XCTAssertEqual(address, "stake_test1uqxefct5wvh0n2h88uu44dz9q7l6nq7k2q3uzx54ruxr9eqqjclmh")
    }
}
