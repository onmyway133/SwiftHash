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

    XCTAssertEqual(md5_cmn(-617265063, -615378706, -617265106, 0, 17, -1473231341), 434767261)

    XCTAssertEqual(binl_md5(rstr2binl(hello), hello.count * 8), [708854109, 1982483388, -1851952711, -1832577264])
    XCTAssertEqual(binl_md5(rstr2binl(world), world.count * 8), [925923709, -2046724448, -2113778857, -415894286])
  }

  func testMD5() {
    XCTAssertEqual(hex_md5("hello"), "5d41402abc4b2a76b9719d911017c592")
//    XCTAssertEqual(hex_md5("wourld"), "7d793037a0760186574b0282f2f435e7")
  }
}
