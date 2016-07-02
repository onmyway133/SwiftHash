import XCTest
@testable import SwiftHash

class Tests: XCTestCase {

  func testHelper() {
    XCTAssertEqual(str2rstr_utf8("hello"), [104, 101, 108, 108, 111])

    let hello = str2rstr_utf8("hello")
    let world = str2rstr_utf8("world")

    XCTAssertEqual(rstr2tr(hello), "hello")
    XCTAssertEqual(rstr2tr(world), "world")

    XCTAssertEqual(rstr2binl(hello), [1819043176, 111])
    XCTAssertEqual(rstr2binl(world), [1819438967, 100])

    XCTAssertEqual(rstr2hex(hello), "68656C6C6F")
    XCTAssertEqual(rstr2hex(world), "776F726C64")

    XCTAssertEqual(Int32(-991732713) << Int32(12), 901869568)
    XCTAssertEqual(Int32(991732713) << Int32(12), -901869568)
    XCTAssertEqual(zeroFillRightShift(-991732713, (32 - 12)), 3150)

    XCTAssertEqual(bit_rol(1589092186, 17), 1052032367)
    XCTAssertEqual(bit_rol(-991732713, 12), 901872718)

    XCTAssertEqual(md5_cmn(-617265063, -615378706, -617265106, 0, 17, -1473231341), 434767261)

    XCTAssertEqual(md5_ff(271733878, -615343318, -271733879, -1732584194, 32879, 12, -389564586), 286529400)

    XCTAssertEqual(binl_md5(rstr2binl(hello), hello.count * 8), [708854109, 1982483388, -1851952711, -1832577264])
    XCTAssertEqual(binl_md5(rstr2binl(world), world.count * 8), [925923709, -2046724448, -2113778857, -415894286])
  }

  func testMD5() {
    XCTAssertEqual(hex_md5("hello"), "5D41402ABC4B2A76B9719D911017C592")
    XCTAssertEqual(hex_md5("world"), "7D793037A0760186574B0282F2F435E7")
  }
}
