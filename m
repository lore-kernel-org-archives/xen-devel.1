From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: [PATCH v1] x86/mm: Clean up p2m_finish_type_change
 return value
Date: Wed, 16 Jan 2019 15:13:05 +0000
Message-ID: <20190116151231.10210-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bGbE=PY=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gjmsQ-0000Fx-8P
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 15:13:10 +0000
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

Q2hhbmdlZCB0aGUgcmV0dXJuIHZhbHVlIG9mIDEgdG8gMCBzbyBub3cgcDJtX2ZpbmlzaF90eXBl
X2NoYW5nZSByZXR1cm5zCjAgZm9yIHN1Y2Nlc3Mgb3IgPDAgZm9yIGVycm9yLgoKU2lnbmVkLW9m
Zi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Ci0tLQogeGVu
L2FyY2gveDg2L21tL3AybS5jIHwgMTIgKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwppbmRleCBkMTRjZTU3ZGQ1Li5hZTY0NTlm
YTUzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKKysrIGIveGVuL2FyY2gveDg2
L21tL3AybS5jCkBAIC0xMTc4LDYgKzExNzgsNyBAQCBpbnQgcDJtX2ZpbmlzaF90eXBlX2NoYW5n
ZShzdHJ1Y3QgZG9tYWluICpkLAogCiAgICAgaWYgKCByYyA8IDAgKQogICAgICAgICBnb3RvIG91
dDsKKyAgICByYyA9IDA7CiAKICNpZmRlZiBDT05GSUdfSFZNCiAgICAgaWYgKCB1bmxpa2VseShh
bHRwMm1fYWN0aXZlKGQpKSApCkBAIC0xMTg4LDE5ICsxMTg5LDE0IEBAIGludCBwMm1fZmluaXNo
X3R5cGVfY2hhbmdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgICAgICBpZiAoIGQtPmFyY2gu
YWx0cDJtX2VwdHBbaV0gIT0gbWZuX3goSU5WQUxJRF9NRk4pICkKICAgICAgICAgICAgIHsKICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqYWx0cDJtID0gZC0+YXJjaC5hbHRwMm1f
cDJtW2ldOwotICAgICAgICAgICAgICAgIGludCByYzE7CiAKICAgICAgICAgICAgICAgICBwMm1f
bG9jayhhbHRwMm0pOwotICAgICAgICAgICAgICAgIHJjMSA9IGZpbmlzaF90eXBlX2NoYW5nZShh
bHRwMm0sIGZpcnN0X2dmbiwgbWF4X25yKTsKKyAgICAgICAgICAgICAgICByYyA9IGZpbmlzaF90
eXBlX2NoYW5nZShhbHRwMm0sIGZpcnN0X2dmbiwgbWF4X25yKTsKICAgICAgICAgICAgICAgICBw
Mm1fdW5sb2NrKGFsdHAybSk7CiAKLSAgICAgICAgICAgICAgICBpZiAoIHJjMSA8IDAgKQotICAg
ICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICAgICAgcmMgPSByYzE7CisgICAgICAgICAg
ICAgICAgaWYgKCByYyA8IDAgKQogICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKLSAgICAg
ICAgICAgICAgICB9Ci0KLSAgICAgICAgICAgICAgICByYyB8PSByYzE7CisgICAgICAgICAgICAg
ICAgcmMgPSAwOwogICAgICAgICAgICAgfQogICAgIH0KICNlbmRpZgotLSAKMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
