From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] mm: don't defer struct page initialization
 for Xen pv guests
Date: Fri, 16 Feb 2018 15:02:17 +0100
Message-ID: <1424bb25-7d6a-ee21-83b4-0e90369d6132__18887.969517573$1518789702$gmane$org@suse.com>
References: <20180216133726.30813-1-jgross@suse.com>
 <20180216135940.GQ7275@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=zjwl=fk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1emgan-0004C3-Fn
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 14:02:25 +0000
In-Reply-To: <20180216135940.GQ7275@dhcp22.suse.cz>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michal Hocko <mhocko@kernel.org>
Cc: Pavel Tatashin <pasha.tatashin@oracle.com>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, xen-devel@lists.xenproject.org, akpm@linux-foundation.org
List-Id: xen-devel@lists.xenproject.org

T24gMTYvMDIvMTggMTQ6NTksIE1pY2hhbCBIb2NrbyB3cm90ZToKPiBbQ0MgUGF2ZWxdCj4gCj4g
T24gRnJpIDE2LTAyLTE4IDE0OjM3OjI2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBDb21taXQg
ZjdmOTkxMDBkOGQ5NWRiY2YwOWUwMjE2YTE0MzIxMWU3OTQxOGI5ZiAoIm1tOiBzdG9wIHplcm9p
bmcKPj4gbWVtb3J5IGR1cmluZyBhbGxvY2F0aW9uIGluIHZtZW1tYXAiKSBicm9rZSBYZW4gcHYg
ZG9tYWlucyBpbiBzb21lCj4+IGNvbmZpZ3VyYXRpb25zLCBhcyB0aGUgIlBpbm5lZCIgaW5mb3Jt
YXRpb24gaW4gc3RydWN0IHBhZ2Ugb2YgZWFybHkKPj4gcGFnZSB0YWJsZXMgY291bGQgZ2V0IGxv
c3QuCj4gCj4gQ291bGQgeW91IGJlIG1vcmUgc3BlY2lmaWMgcGxlYXNlPwoKSW4gd2hpY2ggd2F5
PyBEbyB5b3Ugd2FudCB0byBzZWUgdGhlIHJlc3VsdGluZyBjcmFzaCBpbiB0aGUgY29tbWl0Cm1l
c3NhZ2Ugb3Igc29tZSBtb3JlIGJhY2tncm91bmQgaW5mb3JtYXRpb24/Cgo+IAo+PiBBdm9pZCB0
aGlzIHByb2JsZW0gYnkgbm90IGRlZmVycmluZyBzdHJ1Y3QgcGFnZSBpbml0aWFsaXphdGlvbiB3
aGVuCj4+IHJ1bm5pbmcgYXMgWGVuIHB2IGd1ZXN0Lgo+Pgo+PiBDYzogPHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmc+ICM0LjE1Cj4gRml4ZXM6IGY3Zjk5MTAwZDhkOSAoIm1tOiBzdG9wIHplcm9pbmcg
bWVtb3J5IGR1cmluZyBhbGxvY2F0aW9uIGluIHZtZW1tYXAiKQo+IAo+IHBsZWFzZQoKT2theS4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
