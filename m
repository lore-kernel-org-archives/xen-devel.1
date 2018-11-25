From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v1] Increase framebuffer size to todays standards
Date: Sun, 25 Nov 2018 20:14:05 +0100
Message-ID: <20181125191405.3028-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=t2uv=oe=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1gR0Pk-0005ws-Gp
 for xen-devel@lists.xenproject.org; Sun, 25 Nov 2018 19:49:56 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

TXkgbm90ZWJvb2sgcmVwb3J0cyBhIGRpc3BsYXkgc2l6ZSBvZiAxOTIweDEwODA6CgooWEVOKSB2
ZXNhZmI6IGZyYW1lYnVmZmVyIGF0IDB4ZDAwMDAwMDAsIG1hcHBlZCB0byAweGZmZmY4MmMwMDAy
MDEwMDAsIHVzaW5nIDgxMjhrLCB0b3RhbCA4MTI4awooWEVOKSB2ZXNhZmI6IG1vZGUgaXMgMTky
MHgxMDgweDMyLCBsaW5lbGVuZ3RoPTc2ODAsIGZvbnQgOHgxNgooWEVOKSB2ZXNhZmI6IFRydWVj
b2xvcjogc2l6ZT04Ojg6ODo4LCBzaGlmdD0yNDoxNjo4OjAKClRoZSBoYXJkY29kZWQgdmFsdWVz
IGZlZWwgYXJiaXRyYXJ5LCBzbyBqdXN0IGJ1bXAgdGhlbSB0byBmaXggbXkgc3lzdGVtLgpUaGUg
ZmlsdGVycyBmb3Igbm90ZWJvb2tzIGF0IGh0dHBzOi8vZ2VpemhhbHMuZXUvIGluZGljYXRlIHRo
ZSB1cHBlcgpsaW1pdCBjb3VsZCBiZSBldmVuIGxhcmdlciwgbGlrZSAzODQweDIxNjAuCgpGaXhl
cyBjb21taXQgZTdjYjM1ZThiMWI4Zjg3MmQ5MDY4MDBjNzJmOTJmMTBkNzAxZjc5YyAoInhlbjog
aW50cm9kdWNlIGEgZ2VuZXJpYyBmcmFtZWJ1ZmZlciBkcml2ZXIiKQoKU2lnbmVkLW9mZi1ieTog
T2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgotLS0KIHhlbi9kcml2ZXJzL3ZpZGVvL2xmYi5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdmlkZW8vbGZiLmMgYi94ZW4vZHJpdmVycy92aWRlby9s
ZmIuYwppbmRleCBkMGM4YzQ5MmIwLi4wZDA2MTI5M2Q0IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVy
cy92aWRlby9sZmIuYworKysgYi94ZW4vZHJpdmVycy92aWRlby9sZmIuYwpAQCAtMTAsNyArMTAs
NyBAQAogI2luY2x1ZGUgImxmYi5oIgogI2luY2x1ZGUgImZvbnQuaCIKIAotI2RlZmluZSBNQVhf
WFJFUyAxOTAwCisjZGVmaW5lIE1BWF9YUkVTIDE5MjAKICNkZWZpbmUgTUFYX1lSRVMgMTIwMAog
I2RlZmluZSBNQVhfQlBQIDQKICNkZWZpbmUgTUFYX0ZPTlRfVyA4CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
