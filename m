From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.12 3/8] xen/arm: p2m: Introduce an
 helper to allocate the root page-table
Date: Wed, 23 Jan 2019 15:29:22 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1901231529140.17936@sstabellini-ThinkPad-X260>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3kqX=P7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gmRxU-0007br-B3
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 23:29:24 +0000
In-Reply-To: <20181128164939.8329-4-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyOCBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgZm9sbG93LXVwIHBh
dGNoIHdpbGwgcmVxdWlyZSB0byBhbGxvY2F0ZSB0aGUgcm9vdCBwYWdlLXRhYmxlIHdpdGhvdXQK
PiBoYXZpbmcgYSBkb21haW4gaW4gaGFuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9wMm0uYyB8
IDE2ICsrKysrKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wMm0uYyBiL3hl
bi9hcmNoL2FybS9wMm0uYwo+IGluZGV4IDhlYmYxZThkYmEuLmU4YmFjYWI5ZDIgMTAwNjQ0Cj4g
LS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3AybS5jCj4gQEAg
LTExMzYsMjEgKzExMzYsMjkgQEAgaW50IGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2Uoc3RydWN0
IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCBtZm5fdCBtZm4sCj4gICAgICByZXR1cm4gcDJtX3JlbW92
ZV9tYXBwaW5nKGQsIGdmbiwgKDEgPDwgcGFnZV9vcmRlciksIG1mbik7Cj4gIH0KPiAgCj4gLXN0
YXRpYyBpbnQgcDJtX2FsbG9jX3RhYmxlKHN0cnVjdCBkb21haW4gKmQpCj4gK3N0YXRpYyBzdHJ1
Y3QgcGFnZV9pbmZvICpwMm1fYWxsb2NhdGVfcm9vdCh2b2lkKQo+ICB7Cj4gLSAgICBzdHJ1Y3Qg
cDJtX2RvbWFpbiAqcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOwo+ICAgICAgc3RydWN0IHBhZ2Vf
aW5mbyAqcGFnZTsKPiAgICAgIHVuc2lnbmVkIGludCBpOwo+ICAKPiAgICAgIHBhZ2UgPSBhbGxv
Y19kb21oZWFwX3BhZ2VzKE5VTEwsIFAyTV9ST09UX09SREVSLCAwKTsKPiAgICAgIGlmICggcGFn
ZSA9PSBOVUxMICkKPiAtICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArICAgICAgICByZXR1cm4g
TlVMTDsKPiAgCj4gICAgICAvKiBDbGVhciBib3RoIGZpcnN0IGxldmVsIHBhZ2VzICovCj4gICAg
ICBmb3IgKCBpID0gMDsgaSA8IFAyTV9ST09UX1BBR0VTOyBpKysgKQo+ICAgICAgICAgIGNsZWFy
X2FuZF9jbGVhbl9wYWdlKHBhZ2UgKyBpKTsKPiAgCj4gLSAgICBwMm0tPnJvb3QgPSBwYWdlOwo+
ICsgICAgcmV0dXJuIHBhZ2U7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgcDJtX2FsbG9jX3RhYmxl
KHN0cnVjdCBkb21haW4gKmQpCj4gK3sKPiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBw
Mm1fZ2V0X2hvc3RwMm0oZCk7Cj4gKwo+ICsgICAgcDJtLT5yb290ID0gcDJtX2FsbG9jYXRlX3Jv
b3QoKTsKPiArICAgIGlmICggIXAybS0+cm9vdCApCj4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07
Cj4gIAo+ICAgICAgcDJtLT52dHRiciA9IGdlbmVyYXRlX3Z0dGJyKHAybS0+dm1pZCwgcGFnZV90
b19tZm4ocDJtLT5yb290KSk7Cj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
