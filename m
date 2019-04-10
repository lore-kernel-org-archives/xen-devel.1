From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 02/62] power: Fix uninitialised variable
 warning
Date: Wed, 10 Apr 2019 15:23:08 +0100
Message-ID: <20190410142408.22848-3-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAE-0006F8-4b
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:22 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4KICBwb3dlcjogUmVjb3JkIGFwcHJvYWNoIHVzZWQgZm9yIHBvd2VyIGN5Y2xlcyBpbiBydW52
YXJzCndlIGludHJvZHVjZWQgYSByZWZlcmVuY2UgdG8gJHJ7JHJ2fSB3aGljaCBtaWdodCBiZSB1
bmRlZiwKcmVzdWx0aW5nIGluIHRoaXM6CiAgVXNlIG9mIHVuaW5pdGlhbGl6ZWQgdmFsdWUgaW4g
Y29uY2F0ZW5hdGlvbiAoLikgb3Igc3RyaW5nIGF0IE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gbGlu
ZSAxMDY5LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJp
eC5jb20+Ci0tLQogT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVz
dFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IDMzNGNjMmNiLi5kMzVh
Nzg0YiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rl
c3RTdXBwb3J0LnBtCkBAIC0xMDIzLDcgKzEwMjMsNyBAQCBzdWIgcG93ZXJfcmVib290X2F0dGVt
cHRzICgkJCQ7JCQpIHsKIAkgICAgbG9nbSgicG93ZXI6IHJlYm9vdGVkICRoby0+e05hbWV9ICh1
c2luZyAkYXBwcm9hY2gtPntOYW1lfSkiKTsKIAkgICAgaWYgKGRlZmluZWQgJHJlY29yZF9ydW52
YXJfdGFpbCkgewogCQlteSAkcnYgPSAiJGhvLT57SWRlbnR9X3Bvd2VyXyR7cmVjb3JkX3J1bnZh
cl90YWlsfSI7Ci0JCW15ICRuZXd2YWwgPSAkcnskcnZ9LighIWxlbmd0aCgkcnskcnZ9KSBhbmQg
JywnKQorCQlteSAkbmV3dmFsID0gKCRyeyRydn0gLy8gJycpLighIWxlbmd0aCgkcnskcnZ9KSBh
bmQgJywnKQogCQkgICAgLiRhcHByb2FjaC0+e05hbWV9OwogCQlzdG9yZV9ydW52YXIoJHJ2LCAk
bmV3dmFsKTsKIAkgICAgfQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
