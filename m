From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 v2 14/17] xen/arm: domctl: Use typesafe
 gfn in XEN_DOMCTL_cacheflush
Date: Tue,  4 Dec 2018 20:26:48 +0000
Message-ID: <20181204202651.8836-15-julien.grall@arm.com>
References: <20181204202651.8836-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aD1Q=ON=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gUHI5-0008Ch-A2
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 20:27:33 +0000
In-Reply-To: <20181204202651.8836-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyB3aWxsIG1ha2UgY2hhbmdlcyBpbiBhIGZvbGxvdy11cCBwYXRjaCBlYXNpZXIuCgpTaWdu
ZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKLS0tCiAgICBD
aGFuZ2VzIGluIHYyOgogICAgICAgIC0gUGF0Y2ggYWRkZWQKLS0tCiB4ZW4vYXJjaC9hcm0vZG9t
Y3RsLmMgfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21jdGwuYyBiL3hlbi9hcmNo
L2FybS9kb21jdGwuYwppbmRleCBjMTBmNTY4YWFkLi4yMDY5MTUyOGE2IDEwMDY0NAotLS0gYS94
ZW4vYXJjaC9hcm0vZG9tY3RsLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWN0bC5jCkBAIC01Miwx
NiArNTIsMTYgQEAgbG9uZyBhcmNoX2RvX2RvbWN0bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3Rs
LCBzdHJ1Y3QgZG9tYWluICpkLAogICAgIHsKICAgICBjYXNlIFhFTl9ET01DVExfY2FjaGVmbHVz
aDoKICAgICB7Ci0gICAgICAgIHVuc2lnbmVkIGxvbmcgcyA9IGRvbWN0bC0+dS5jYWNoZWZsdXNo
LnN0YXJ0X3BmbjsKLSAgICAgICAgdW5zaWduZWQgbG9uZyBlID0gcyArIGRvbWN0bC0+dS5jYWNo
ZWZsdXNoLm5yX3BmbnM7CisgICAgICAgIGdmbl90IHMgPSBfZ2ZuKGRvbWN0bC0+dS5jYWNoZWZs
dXNoLnN0YXJ0X3Bmbik7CisgICAgICAgIGdmbl90IGUgPSBnZm5fYWRkKHMsIGRvbWN0bC0+dS5j
YWNoZWZsdXNoLm5yX3BmbnMpOwogCiAgICAgICAgIGlmICggZG9tY3RsLT51LmNhY2hlZmx1c2gu
bnJfcGZucyA+ICgxVTw8TUFYX09SREVSKSApCiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
IAotICAgICAgICBpZiAoIGUgPCBzICkKKyAgICAgICAgaWYgKCBnZm5feChlKSA8IGdmbl94KHMp
ICkKICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwogCi0gICAgICAgIHJldHVybiBwMm1fY2Fj
aGVfZmx1c2hfcmFuZ2UoZCwgX2dmbihzKSwgX2dmbihlKSk7CisgICAgICAgIHJldHVybiBwMm1f
Y2FjaGVfZmx1c2hfcmFuZ2UoZCwgcywgZSk7CiAgICAgfQogICAgIGNhc2UgWEVOX0RPTUNUTF9i
aW5kX3B0X2lycToKICAgICB7Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
