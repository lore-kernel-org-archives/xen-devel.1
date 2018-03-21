From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.11 2/2] libxc/x86: do not unconditionally
 set the module cmdline address
Date: Wed, 21 Mar 2018 14:42:11 +0000
Message-ID: <20180321144211.57274-3-roger.pau@citrix.com>
References: <20180321144211.57274-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=eys7=gl=citrix.com=prvs=611d78d97=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eyf1A-0006pA-V1
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 14:47:08 +0000
In-Reply-To: <20180321144211.57274-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyB3aWxsIGxlYWQgdG8gd3JpdGluZyBhIHdyb25nIG1vZHVsZSBjb21tYW5kIGxpbmUgcGh5
c2ljYWwgbWVtb3J5CmFkZHJlc3MgaWYgbm8gY29tbWFuZCBsaW5lIGlzIGFjdHVhbGx5IHByb3Zp
ZGVkLgoKVGhpcyBoYXNuJ3QgY2F1c2VkIHByb2JsZW1zIHNvIGZhciBiZWNhdXNlIGh2bWxvYWRl
ciBpcyB0aGUgb25seQpjb25zdW1lciBvZiB0aGUgbW9kdWxlcyBjb21tYW5kIGxpbmUsIGFuZCBp
dCdzIHVuY29uZGl0aW9uYWxseSBzZXQKaW4gdGhhdCBjYXNlLgoKU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXgu
Y29tPgotLS0KIHRvb2xzL2xpYnhjL3hjX2RvbV94ODYuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGMveGNfZG9tX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNfZG9tX3g4Ni5jCmluZGV4IGUyOWM2
NjZiODkuLjI3ZGFkODk5MDYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX2RvbV94ODYuYwor
KysgYi90b29scy9saWJ4Yy94Y19kb21feDg2LmMKQEAgLTE2NTMsMTEgKzE2NTMsMTAgQEAgc3Rh
dGljIHZvaWQgYWRkX21vZHVsZV90b19saXN0KHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSwKICAg
ICAgICAgICAgICAgIDwgSFZNTE9BREVSX01PRFVMRV9DTURMSU5FX1NJWkUpOwogICAgICAgICBz
dHJuY3B5KG1vZHVsZXNfY21kbGluZV9zdGFydCArIEhWTUxPQURFUl9NT0RVTEVfQ01ETElORV9T
SVpFICogaW5kZXgsCiAgICAgICAgICAgICAgICAgY21kbGluZSwgSFZNTE9BREVSX01PRFVMRV9D
TURMSU5FX1NJWkUpOworICAgICAgICBtb2RsaXN0W2luZGV4XS5jbWRsaW5lX3BhZGRyID0gbW9k
dWxlc19jbWRsaW5lX3BhZGRyICsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEhWTUxPQURFUl9NT0RVTEVfQ01ETElORV9TSVpFICogaW5kZXg7CiAgICAgfQogCi0gICAg
bW9kbGlzdFtpbmRleF0uY21kbGluZV9wYWRkciA9Ci0gICAgICAgIG1vZHVsZXNfY21kbGluZV9w
YWRkciArIEhWTUxPQURFUl9NT0RVTEVfQ01ETElORV9TSVpFICogaW5kZXg7Ci0KICAgICBzdGFy
dF9pbmZvLT5ucl9tb2R1bGVzKys7CiB9CiAKLS0gCjIuMTYuMgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
