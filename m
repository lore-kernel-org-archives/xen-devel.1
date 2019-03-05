From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH for-next RFC 0/4] tools: Python 3 compatibility
Date: Tue, 5 Mar 2019 16:42:02 +0000
Message-ID: <20190305164206.6793-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Y1m=RI=citrix.com=prvs=960e31256=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1h1D8w-0008LR-2d
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 16:42:14 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBzZXJpZXMgbWFrZXMgdG9vbHMgYnVpbGQgd2l0aCBQeXRob24gMy4KCkNvbXBpbGUgdGVz
dCBvbmx5IHdpdGggMi43IGFuZCAzLjUgdGh1cyBmYXIsIGhlbmNlIHRoZSBSRkMuIFRoaXMgc2hv
dWxkIGJlIGFibGUKdG8gZ2l2ZSBwZW9wbGUgc29tZSBpZGVhIHdoYXQgc29ydCBvZiB3b3JrIGlz
IGludm9sdmVkLgoKWW91IHdpbGwgYWxzbyBuZWVkIEFuZHJldydzICJ0b29scy94ZW4tZm9yZWln
bjogVXBkYXRlIHB5dGhvbiBzY3JpcHRzIHRvIGJlClB5MyBjb21wYXRpYmxlIi4KCldlaS4KCldl
aSBMaXUgKDQpOgogIGJ1aWxkL200OiBtYWtlIHB5dGhvbl9kZXZlbC5tNCB3b3JrIHdpdGggYm90
aCBweXRob24gMiBhbmQgMwogIGxpYnhsOiBtYWtlIHB5dGhvbiBzY3JpcHRzIHdvcmsgd2l0aCBw
eXRob24gMiBhbmQgMwogIHB5Z3J1YjogY29udmVydCBweXRob24gZmlsZXMgd2l0aCAydG8zCiAg
cHlncnViOiBtYWtlIGl0IGJ1aWxkIHdpdGggcHl0aG9uIDMKCiBtNC9weXRob25fZGV2ZWwubTQg
ICAgICAgICAgICAgICAgIHwgMjcgKysrKysrLS0tLS0KIHRvb2xzL2NvbmZpZ3VyZSAgICAgICAg
ICAgICAgICAgICAgfCAzNCArKysrKysrKy0tLS0tLQogdG9vbHMvbGlieGwvZ2VudGVzdC5weSAg
ICAgICAgICAgICB8ICA0ICstCiB0b29scy9saWJ4bC9nZW50eXBlcy5weSAgICAgICAgICAgIHwg
MTIgKystLS0KIHRvb2xzL2xpYnhsL2lkbC5weSAgICAgICAgICAgICAgICAgfCAyMSArKysrLS0t
LS0KIHRvb2xzL3B5Z3J1Yi9zcmMvRXh0TGludXhDb25mLnB5ICAgfCAxNiArKystLS0tCiB0b29s
cy9weWdydWIvc3JjL0dydWJDb25mLnB5ICAgICAgIHwgMzYgKysrKysrKy0tLS0tLS0tCiB0b29s
cy9weWdydWIvc3JjL0xpbG9Db25mLnB5ICAgICAgIHwgMTYgKysrLS0tLQogdG9vbHMvcHlncnVi
L3NyYy9mc2ltYWdlL2ZzaW1hZ2UuYyB8IDkyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tCiA5IGZpbGVzIGNoYW5nZWQsIDE3NSBpbnNlcnRpb25zKCspLCA4MyBkZWxldGlv
bnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
