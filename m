From: Julien Grall <julien.grall@arm.com>
Subject: [PATCH for-4.12 3/8] xen/arm: p2m: Introduce an helper
 to allocate the root page-table
Date: Wed, 28 Nov 2018 16:49:34 +0000
Message-ID: <20181128164939.8329-4-julien.grall@arm.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=83fl=oh=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gS328-0000qv-6G
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:49:52 +0000
In-Reply-To: <20181128164939.8329-1-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: andre.przywara@arm.com, Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

QSBmb2xsb3ctdXAgcGF0Y2ggd2lsbCByZXF1aXJlIHRvIGFsbG9jYXRlIHRoZSByb290IHBhZ2Ut
dGFibGUgd2l0aG91dApoYXZpbmcgYSBkb21haW4gaW4gaGFuZC4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3AybS5j
IHwgMTYgKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2Fy
Y2gvYXJtL3AybS5jCmluZGV4IDhlYmYxZThkYmEuLmU4YmFjYWI5ZDIgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL2FybS9wMm0uYworKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMKQEAgLTExMzYsMjEgKzEx
MzYsMjkgQEAgaW50IGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwg
Z2ZuX3QgZ2ZuLCBtZm5fdCBtZm4sCiAgICAgcmV0dXJuIHAybV9yZW1vdmVfbWFwcGluZyhkLCBn
Zm4sICgxIDw8IHBhZ2Vfb3JkZXIpLCBtZm4pOwogfQogCi1zdGF0aWMgaW50IHAybV9hbGxvY190
YWJsZShzdHJ1Y3QgZG9tYWluICpkKQorc3RhdGljIHN0cnVjdCBwYWdlX2luZm8gKnAybV9hbGxv
Y2F0ZV9yb290KHZvaWQpCiB7Ci0gICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IHAybV9nZXRf
aG9zdHAybShkKTsKICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlOwogICAgIHVuc2lnbmVkIGlu
dCBpOwogCiAgICAgcGFnZSA9IGFsbG9jX2RvbWhlYXBfcGFnZXMoTlVMTCwgUDJNX1JPT1RfT1JE
RVIsIDApOwogICAgIGlmICggcGFnZSA9PSBOVUxMICkKLSAgICAgICAgcmV0dXJuIC1FTk9NRU07
CisgICAgICAgIHJldHVybiBOVUxMOwogCiAgICAgLyogQ2xlYXIgYm90aCBmaXJzdCBsZXZlbCBw
YWdlcyAqLwogICAgIGZvciAoIGkgPSAwOyBpIDwgUDJNX1JPT1RfUEFHRVM7IGkrKyApCiAgICAg
ICAgIGNsZWFyX2FuZF9jbGVhbl9wYWdlKHBhZ2UgKyBpKTsKIAotICAgIHAybS0+cm9vdCA9IHBh
Z2U7CisgICAgcmV0dXJuIHBhZ2U7Cit9CisKK3N0YXRpYyBpbnQgcDJtX2FsbG9jX3RhYmxlKHN0
cnVjdCBkb21haW4gKmQpCit7CisgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IHAybV9nZXRf
aG9zdHAybShkKTsKKworICAgIHAybS0+cm9vdCA9IHAybV9hbGxvY2F0ZV9yb290KCk7CisgICAg
aWYgKCAhcDJtLT5yb290ICkKKyAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKICAgICBwMm0tPnZ0
dGJyID0gZ2VuZXJhdGVfdnR0YnIocDJtLT52bWlkLCBwYWdlX3RvX21mbihwMm0tPnJvb3QpKTsK
IAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
