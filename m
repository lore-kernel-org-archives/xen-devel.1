From: Olaf Hering <olaf@aepfle.de>
Subject: [PATCH v2] xen: add DEBUG_INFO Kconfig symbol
Date: Fri, 31 Aug 2018 10:29:21 +0200
Message-ID: <20180831082921.11208-1-olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=elmk=lo=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1fvep4-0000pN-Tu
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 08:30:31 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

Q3JlYXRpbmcgZGVidWcgaW5mbyBkdXJpbmcgYnVpbGQgaXMgbm90IHN0cmljdGx5IHJlcXVpcmVk
IGF0IHJ1bnRpbWUuCk1ha2UgaXQgb3B0aW9uYWwgYnkgaW50cm9kdWNpbmcgYSBuZXcgS2NvbmZp
ZyBrbm9iICJERUJVR19JTkZPIi4KVGhpcyBzbGlnaHRseSByZWR1Y2VzIGJ1aWxkIHRpbWUgYW5k
IGRpc2t1c2FnZSwgaWYgZGlzYWJsZWQuCgpTaWduZWQtb2ZmLWJ5OiBPbGFmIEhlcmluZyA8b2xh
ZkBhZXBmbGUuZGU+Ci0tLQogeGVuL0tjb25maWcuZGVidWcgfCA3ICsrKysrKysKIHhlbi9SdWxl
cy5tayAgICAgIHwgNSArKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL0tjb25maWcuZGVidWcgYi94ZW4vS2NvbmZp
Zy5kZWJ1ZwppbmRleCAzODBjNGU4ZDc1Li4xZDhjMmM5NGE5IDEwMDY0NAotLS0gYS94ZW4vS2Nv
bmZpZy5kZWJ1ZworKysgYi94ZW4vS2NvbmZpZy5kZWJ1ZwpAQCAtMTEsNiArMTEsMTMgQEAgY29u
ZmlnIERFQlVHCiAKIAkgIFlvdSBwcm9iYWJseSB3YW50IHRvIHNheSAnTicgaGVyZS4KIAorY29u
ZmlnIERFQlVHX0lORk8KKwlib29sICJDb21waWxlIFhlbiB3aXRoIGRlYnVnIGluZm8iCisJZGVm
YXVsdCB5CisJLS0taGVscC0tLQorCSAgSWYgeW91IHNheSBZIGhlcmUgdGhlIHJlc3VsdGluZyBY
ZW4gd2lsbCBpbmNsdWRlIGRlYnVnZ2luZyBpbmZvCisJICByZXN1bHRpbmcgaW4gYSBsYXJnZXIg
YmluYXJ5IGltYWdlLgorCiBpZiBERUJVRyB8fCBFWFBFUlQgPSAieSIKIAogY29uZmlnIENSQVNI
X0RFQlVHCmRpZmYgLS1naXQgYS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5kZXggNDdj
OTU0NDI1ZC4uNDdjNWM2OTRkNiAxMDA2NDQKLS0tIGEveGVuL1J1bGVzLm1rCisrKyBiL3hlbi9S
dWxlcy5tawpAQCAtNTUsNyArNTUsMTAgQEAgZW5kaWYKIAogQ0ZMQUdTICs9IC1ub3N0ZGluYyAt
Zm5vLWJ1aWx0aW4gLWZuby1jb21tb24KIENGTEFHUyArPSAtV2Vycm9yIC1XcmVkdW5kYW50LWRl
Y2xzIC1Xbm8tcG9pbnRlci1hcml0aAotQ0ZMQUdTICs9IC1waXBlIC1nIC1EX19YRU5fXyAtaW5j
bHVkZSAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2NvbmZpZy5oCitpZmVxICgkKENPTkZJR19ERUJV
R19JTkZPKSx5KQorQ0ZMQUdTICs9IC1nCitlbmRpZgorQ0ZMQUdTICs9IC1waXBlIC1EX19YRU5f
XyAtaW5jbHVkZSAkKEJBU0VESVIpL2luY2x1ZGUveGVuL2NvbmZpZy5oCiBDRkxBR1MgKz0gJy1E
X19PQkpFQ1RfRklMRV9fPSIkQCInCiAKIGlmbmVxICgkKGNsYW5nKSx5KQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
