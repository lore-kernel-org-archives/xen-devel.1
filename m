From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 2/3] x86/mm: Introduce
 altp2m_set_entry_by_page_order
Date: Wed, 10 Apr 2019 15:18:15 +0100
Message-ID: <0ed3bfad-8c35-2143-0c1d-047492a00f31@citrix.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <20190409120324.13940-2-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O+PC=SM=citrix.com=prvs=996a3bdca=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hEE3g-0005JT-LO
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:18:36 +0000
In-Reply-To: <20190409120324.13940-2-aisaila@bitdefender.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC85LzE5IDE6MDMgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+IFRoaXMg
cGF0Y2ggbW92ZXMgY29tbW9uIGNvZGUgZnJvbSBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKCkg
YW5kCj4gcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKCkgaW50byBvbmUgZnVuY3Rpb24KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiAt
LS0KPiAgeGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyB8ICAyICstCj4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvcDJtLmggICAgfCAxMSArKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiBpbmRl
eCBiZjY3ZGRiMTVhLi42YTIyNTEyNTU1IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9t
ZW1fYWNjZXNzLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jCj4gQEAgLTI3
OSw3ICsyNzksNyBAQCBpbnQgcDJtX3NldF9hbHRwMm1fbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqaHAybSwKPiAgICAgICAgICBnZm5fdCBnZm4yID0gX2dm
bihnZm5fbCAmIG1hc2spOwo+ICAgICAgICAgIG1mbl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikg
JiBtYXNrKTsKPiAgCj4gLSAgICAgICAgLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZl
IHRvIHJlbWFwIHRvIGEgc2hhcmVkIGVudHJ5ICovCj4gKwkvKiBOb3RlOiBjdXJyZW50bHkgaXQg
aXMgbm90IHNhZmUgdG8gcmVtYXAgdG8gYSBzaGFyZWQgZW50cnkgKi8KPiAgICAgICAgICBpZiAo
IHQgIT0gcDJtX3JhbV9ydyApCj4gICAgICAgICAgICAgIHJldHVybiAtRVNSQ0g7Cj4gIAo+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9wMm0uaAo+IGluZGV4IDZkZTE1NDZkNzYuLjkwYTZjMTM1YTcgMTAwNjQ0Cj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9wMm0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgK
PiBAQCAtNDY3LDYgKzQ2NywxNyBAQCBzdGF0aWMgaW5saW5lIG1mbl90IGFsdHAybV9nZXRfZ2Zu
X3R5cGVfYWNjZXNzKAo+ICAgICAgcmV0dXJuIG1mbjsKPiAgfQo+ICAKPiArc3RhdGljIGlubGlu
ZSBpbnQgYWx0cDJtX3NldF9lbnRyeV9ieV9wYWdlX29yZGVyKAo+ICsgICAgc3RydWN0IHAybV9k
b21haW4gKmFwMm0sIHVuc2lnbmVkIGxvbmcgZ2ZuLCAgbWZuX3QgbWZuLAo+ICsgICAgdW5zaWdu
ZWQgaW50IHBhZ2Vfb3JkZXIsIHAybV90eXBlX3QgdCwgcDJtX2FjY2Vzc190IGEpCgpUaGlzIGZ1
bmN0aW9uIGRvZXNuJ3Qgc2VlbSB0byBiZSBjYWxsZWQgYW55d2hlcmUgaW4gdGhpcyBzZXJpZXMu
CgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
