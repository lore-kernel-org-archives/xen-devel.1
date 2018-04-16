From: Anthony PERARD <anthony.perard@citrix.com>
Subject: [RFC v2 9/9] libxl_qmp: Add a warning to not trust QEMU
Date: Mon, 16 Apr 2018 18:32:27 +0100
Message-ID: <20180416173227.22671-10-anthony.perard@citrix.com>
References: <20180416173227.22671-1-anthony.perard@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vmis=hf=citrix.com=prvs=6372a2554=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f87zV-0006ic-CQ
 for xen-devel@lists.xenproject.org; Mon, 16 Apr 2018 17:32:33 +0000
In-Reply-To: <20180416173227.22671-1-anthony.perard@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Li4uIGV2ZW4gaWYgaXQgaXMgbm90IHRoZSBjYXNlIGZvciB0aGUgY3VycmVudCBjb2RlLgoKU2ln
bmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0t
LQogdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3FtcC5jIGIvdG9vbHMv
bGlieGwvbGlieGxfcW1wLmMKaW5kZXggODNiZDgwNDIxOS4uM2IxNjdmMjRkZCAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfcW1wLmMK
QEAgLTE2LDYgKzE2LDkgQEAKIC8qCiAgKiBUaGlzIGZpbGUgaW1wbGVtZW50IGEgY2xpZW50IGZv
ciBRTVAgKFFFTVUgTW9uaXRvciBQcm90b2NvbCkuIEZvciB0aGUKICAqIFNwZWNpZmljYXRpb24s
IHNlZSBpbiB0aGUgUUVNVSByZXBvc2l0b3J5LgorICoKKyAqIFdBUk5JTkcgLSBEbyBub3QgdHJ1
c3QgUUVNVSB3aGVuIHdyaXRpbmcgY29kZXMgZm9yIG5ldyBjb21tYW5kcyBvciB3aGVuCisgKiAg
ICAgICAgICAgaW1wcm92aW5nIHRoZSBjbGllbnQgY29kZS4KICAqLwogCiAvKgotLSAKQW50aG9u
eSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
