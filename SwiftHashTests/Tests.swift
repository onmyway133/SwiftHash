import XCTest
@testable import SwiftHash

class Tests: XCTestCase {

  func testHelper() {
    XCTAssertEqual(str2rstr_utf8("hello"), [104, 101, 108, 108, 111])

    let hello = str2rstr_utf8("hello")
    let world = str2rstr_utf8("world")
    let google = str2rstr_utf8("https://www.google.com")

    XCTAssertEqual(rstr2tr(hello), "hello")
    XCTAssertEqual(rstr2tr(world), "world")
    XCTAssertEqual(rstr2tr(google), "https://www.google.com")

    XCTAssertEqual(rstr2binl(hello), [1819043176, 111])
    XCTAssertEqual(rstr2binl(world), [1819438967, 100])
    XCTAssertEqual(rstr2binl(google), [1886680168, 791624307, 779581303, 1735356263, 1663985004, 28015])

    XCTAssertEqual(rstr2hex(hello), "68656C6C6F")
    XCTAssertEqual(rstr2hex(world), "776F726C64")
    XCTAssertEqual(rstr2hex(google), "68747470733A2F2F7777772E676F6F676C652E636F6D")

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
    XCTAssertEqual(MD5("hello"),
                   "5D41402ABC4B2A76B9719D911017C592")
    XCTAssertEqual(MD5("world"),
                   "7D793037A0760186574B0282F2F435E7")
    XCTAssertEqual(MD5("https://www.google.com"),
                   "8FFDEFBDEC956B595D257F0AAEEFD623")
    XCTAssertEqual(MD5("https://www.google.com/logos/doodles/2016/parents-day-in-korea-5757703554072576-hp2x.jpg"),
                   "0DFB10E8D2AE771B3B3ED4544139644E")
    XCTAssertEqual(MD5("https://unsplash.it/600/300/?image=1"),
                   "D59E956EBB1BE415970F04EC77F4C875")
    XCTAssertEqual(MD5(""),
                   "D41D8CD98F00B204E9800998ECF8427E")
    XCTAssertEqual(MD5("ABCDEFGHIJKLMNOPQRSTWXYZ1234567890"),
                   "B8F4F38629EC4F4A23F5DCC6086F8035")
    XCTAssertEqual(MD5("abcdefghijklmnopqrstwxyz1234567890"),
                   "B2E875F4D53CCF6CEFB5CDA3F86FC542")
    XCTAssertEqual(MD5("0123456789"),
                   "781E5E245D69B566979B86E28D23F2C7")
    XCTAssertEqual(MD5("0"),
                   "CFCD208495D565EF66E7DFF9F98764DA")
  }

  func testMD5_Data() {
    let data = "https://www.google.com".dataUsingEncoding(NSUTF8StringEncoding)
    XCTAssertEqual(MD5(String(data: data!, encoding: NSUTF8StringEncoding)!),
                   "8FFDEFBDEC956B595D257F0AAEEFD623")
  }
}
