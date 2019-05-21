From: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3] xen/drivers/char: Protect the asm/vpl011.h
 include
Date: Tue, 21 May 2019 15:24:18 -0700
Message-ID: <20190521222418.27107-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fYR2=TV=wdc.com=prvs=03708bf4b=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hTDD5-0005Fp-MV
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 22:26:16 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com, Alistair Francis <alistair.francis@wdc.com>, jbeulich@suse.com, andrew.cooper3@citrix.com, alistair23@gmail.com
List-Id: xen-devel@lists.xenproject.org

VGhlIG9ubHkgdXNlIG9mIGFzbS92cGwwMTEuaCBpcyBwcm90ZWN0ZWQgYnkgdGhlIENPTkZJR19T
QlNBX1ZVQVJUX0NPTlNPTEUKZGVmaW5lIHNvIGxldHMgcHJvdGVjdCB0aGUgaW5jbHVkZSBhcyB3
ZWxsLgoKU2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3
ZGMuY29tPgotLS0KIHYzOgogIC0gUmV3b3JrIGNvbW1pdCB0aXRsZSBhbmQgbWVzc2FnZQogIC0g
U3BsaXQgaXQgaW50byBhIHNlcGVyYXRlIGlmZGVmCgogeGVuL2RyaXZlcnMvY2hhci9jb25zb2xl
LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jIGIveGVuL2RyaXZlcnMv
Y2hhci9jb25zb2xlLmMKaW5kZXggMzhlY2Q5YzAxNS4uZDcyOGU3MzdkMSAxMDA2NDQKLS0tIGEv
eGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKKysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xl
LmMKQEAgLTM2LDcgKzM2LDggQEAKICNpZmRlZiBDT05GSUdfWDg2CiAjaW5jbHVkZSA8eGVuL2Nv
bnNvbGVkLmg+CiAjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+Ci0jZWxzZQorI2VuZGlmCisjaWZkZWYg
Q09ORklHX1NCU0FfVlVBUlRfQ09OU09MRQogI2luY2x1ZGUgPGFzbS92cGwwMTEuaD4KICNlbmRp
ZgogCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
