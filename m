From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH] domctl: revert double increment of domctl
	version
Date: Wed, 21 Feb 2018 18:34:22 +0100
Message-ID: <20180221173422.10550-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
Cc: Olaf Hering <olaf@aepfle.de>
List-Id: xen-devel@lists.xenproject.org

WGVuIDQuMTAgaGFzIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHhlLCBzdGFnaW5nIHNo
b3VsZCBiZSBmaW5lCndpdGggMHhmIHVudGlsIHRoZSBuZXh0IHJlbGVhc2UgaXMgcHJlcGFyZWQu
CgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xhZkBhZXBmbGUuZGU+Ci0tLQogeGVuL2lu
Y2x1ZGUvcHVibGljL2RvbWN0bC5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0
bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCmluZGV4IGVjN2E4NjBhZmMuLjUwMWM0
NDIzMGIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAorKysgYi94ZW4v
aW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgKQEAgLTM4LDcgKzM4LDcgQEAKICNpbmNsdWRlICJodm0v
c2F2ZS5oIgogI2luY2x1ZGUgIm1lbW9yeS5oIgogCi0jZGVmaW5lIFhFTl9ET01DVExfSU5URVJG
QUNFX1ZFUlNJT04gMHgwMDAwMDAxMAorI2RlZmluZSBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJT
SU9OIDB4MDAwMDAwMGYKIAogLyoKICAqIE5CLiB4ZW5fZG9tY3RsLmRvbWFpbiBpcyBhbiBJTi9P
VVQgcGFyYW1ldGVyIGZvciB0aGlzIG9wZXJhdGlvbi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
