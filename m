From: Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH 2/3] xen/drivers/char: Don't require vpl011 for
 all non-x86 archs
Date: Wed, 15 May 2019 17:02:11 -0700
Message-ID: <20190516000212.13468-2-alistair.francis@wdc.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N00O=TQ=wdc.com=prvs=032022a23=alistair.francis@srs-us1.protection.inumbo.net>)
 id 1hR3sV-0004II-AJ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 00:04:07 +0000
In-Reply-To: <20190516000212.13468-1-alistair.francis@wdc.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: wei.liu2@citrix.com, Alistair Francis <alistair.francis@wdc.com>, ian.jackson@eu.citrix.com, alistair23@gmail.com
List-Id: xen-devel@lists.xenproject.org

TWFrZSB0aGUgYXNtL3ZwbDAxMS5oIGRlcGVuZGVudCBvbiB0aGUgQVJNIGFyY2hpdGVjdHVyZS4K
ClNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNv
bT4KLS0tCiB4ZW4vZHJpdmVycy9jaGFyL2NvbnNvbGUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJz
L2NoYXIvY29uc29sZS5jIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKaW5kZXggOWJiY2Iw
ZjU3YS4uZjg0MGQ5OTliYyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMK
KysrIGIveGVuL2RyaXZlcnMvY2hhci9jb25zb2xlLmMKQEAgLTM2LDcgKzM2LDcgQEAKICNpZmRl
ZiBDT05GSUdfWDg2CiAjaW5jbHVkZSA8eGVuL2NvbnNvbGVkLmg+CiAjaW5jbHVkZSA8YXNtL2d1
ZXN0Lmg+Ci0jZWxzZQorI2VsaWYgQ09ORklHX0FSTQogI2luY2x1ZGUgPGFzbS92cGwwMTEuaD4K
ICNlbmRpZgogCi0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
