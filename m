From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: [PATCH v1] Fix p2m_set_suppress_ve
Date: Wed, 3 Apr 2019 14:29:00 +0000
Message-ID: <20190403142620.1224-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=41FP=SF=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hBgt0-0003mv-9N
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 14:29:06 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gYSBuZXcgYWx0cDJtIHZpZXcgdGhlIHAybV9zZXRfc3VwcHJlc3NfdmUoKSBmdW5jIHdpbGwg
ZmFpbCB3aXRoIGludmFsaWQgbWZuCmZyb20gcDJtLT5nZXRfZW50cnkoKSBpZiB0aGUgcDJtLT5z
ZXRfZW50cnkoKSB3YXMgbm90IGNhbGxlZCBiZWZvcmUuCgpUaGlzIHBhdGNoIHNvbHZlcyB0aGUg
cHJvYmxlbSBieSBnZXR0aW5nIHRoZSBtZm4gZnJvbSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKQph
bmQgdGhlbiByZXR1cm5pbmcgZXJyb3IgaWYgdGhlIG1mbiBpcyBpbnZhbGlkLgoKU2lnbmVkLW9m
Zi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L21tL3AybS5jIHwgMTIgKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
bW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKaW5kZXggYjliYmI4ZjQ4NS4uM2U2ZTVl
ZjE1MiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9wMm0uYwpAQCAtMzAxMSw4ICszMDExLDE2IEBAIGludCBwMm1fc2V0X3N1cHByZXNzX3Zl
KHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgYm9vbCBzdXBwcmVzc192ZSwKICAgICBtZm4g
PSBwMm0tPmdldF9lbnRyeShwMm0sIGdmbiwgJnQsICZhLCAwLCBOVUxMLCBOVUxMKTsKICAgICBp
ZiAoICFtZm5fdmFsaWQobWZuKSApCiAgICAgewotICAgICAgICByYyA9IC1FU1JDSDsKLSAgICAg
ICAgZ290byBvdXQ7CisgICAgICAgIHVuc2lnbmVkIGludCBwYWdlX29yZGVyOworCisgICAgICAg
IG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2Vzcyhob3N0X3AybSwgZ2ZuX3goZ2ZuKSwgJnQsICZh
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX0FMTE9DIHwgUDJNX1VO
U0hBUkUsICZwYWdlX29yZGVyLCAwKTsKKworICAgICAgICBpZiAoICFtZm5fdmFsaWQobWZuKSAp
CisgICAgICAgIHsKKyAgICAgICAgICAgIHJjID0gLUVTUkNIOworICAgICAgICAgICAgZ290byBv
dXQ7CisgICAgICAgIH0KICAgICB9CiAKICAgICByYyA9IHAybS0+c2V0X2VudHJ5KHAybSwgZ2Zu
LCBtZm4sIFBBR0VfT1JERVJfNEssIHQsIGEsIHN1cHByZXNzX3ZlKTsKLS0gCjIuMTcuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
