From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 0/4] clang fixes
Date: Mon, 19 Feb 2018 14:16:16 +0000
Message-ID: <20180219141620.20008-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=fu7w=fn=citrix.com=prvs=5814e79b2=roger.pau@srs-us1.protection.inumbo.net>)
 id 1enmFK-0000rs-2p
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 14:16:46 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyByZS1lbmFibGUgdGhlIGludGVncmF0ZWQgY2xh
bmcgYXNzZW1ibGVyIHdoZW4gdGhlCmZlYXR1cmVzIHJlcXVpcmVkIGluIG9yZGVyIHRvIGJ1aWxk
IFhlbiBhcmUgYXZhaWxhYmxlLgoKRmlyc3QgMiBwYXRjaGVzIHJlbW92ZSB0aGUgdW5jb25kaXRp
b25hbCBhZGRpdGlvbiBvZiAtbm8taW50ZWdyYXRlZC1hcwp0byBDRkxBR1MgKG9ubHkgYWRkaW5n
IGl0IHRvIEFGTEFHUyBsaWtlIGl0IHdhcyBkb25lIGJlZm9yZSkuIEZpbmFsbHkKcGF0Y2hlcyAz
IGFuZCA0IHJlbW92ZSB0aGUgdXNhZ2Ugb2YgLW5vLWludGVncmF0ZWQtYXMgZnJvbSBBRkxBR1Mg
d2hlbgpwb3NzaWJsZS4KClRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIGNsYW5nIDYg
KHdpdGhvdXQgLW5vLWludGVncmF0ZWQtYXMpLApjbGFuZyAzLjUgYW5kIGdjYyA2LgoKVGhhbmtz
LCBSb2dlci4KClJvZ2VyIFBhdSBNb25uZSAoNCk6CiAgYnVpbGQ6IGZpbHRlciBvdXQgY29tbWFu
ZCBsaW5lIGFzc2VtYmxlciBhcmd1bWVudHMKICB4ODYvY2xhbmc6IHJlc3RvcmUgaW50ZWdyYXRl
ZCBhc3NlbWJsZXIgdXNhZ2Ugd2l0aCBpbmRpcmVjdCB0aHVua3MKICB4ODY6IGZpeCBpbmRpcmVj
dCB0aHVuayB1c2FnZSBvZiBDT05GSUdfSU5ESVJFQ1RfVEhVTksKICBidWlsZC9jbGFuZzogYWRk
IGEgY2hlY2sgd2hldGhlciB0aGUgYXNzZW1ibGVyIHN1cHBvcnRzIC5za2lwIHdpdGgKICAgIGxh
YmVscwoKIENvbmZpZy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKyst
LS0KIHhlbi9SdWxlcy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysr
LS0KIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0K
IHhlbi9hcmNoL3g4Ni9SdWxlcy5tayAgICAgICAgICAgICAgICAgICAgfCAxNyArKysrKysrKysr
KysrKy0tLQogeGVuL2luY2x1ZGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAyICst
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2luZGlyZWN0X3RodW5rX2FzbS5oIHwgIDQgKysrKwogNiBm
aWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCi0tIAoyLjE2
LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
