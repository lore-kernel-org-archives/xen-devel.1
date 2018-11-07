From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v4 10/12] IOMMU: introduce IOMMU_MIXED
 config option
Date: Wed, 7 Nov 2018 18:01:59 +0000
Message-ID: <dfa558ec-fe4a-98f5-96ef-ebba77235cea@arm.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BB343D802000078001ED9F6@prv1-mh.provo.novell.com>
 <5BB345DD02000078001EDA5A@prv1-mh.provo.novell.com>
 <cd8f6501-75d8-4c97-8559-77ac5b834fc6@arm.com>
 <5BE1B7B502000078001F8BD3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=seal=ns=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gKS9U-0002gz-2T
 for xen-devel@lists.xenproject.org; Wed, 07 Nov 2018 18:02:04 +0000
In-Reply-To: <5BE1B7B502000078001F8BD3@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSmFuLAoKT24gMDYvMTEvMjAxOCAxNTo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDIuMTAuMTggYXQgMTI6MzgsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IE9uIDAy
LzEwLzIwMTggMTE6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gQVJNIGlzIGludGVuZGVkIHRv
IGdhaW4gc3VwcG9ydCBmb3IgaGV0ZXJvZ2VuZW91cyBJT01NVXMgb24gYSBzaW5nbGUKPj4+IHN5
c3RlbS4gVGhpcyBub3Qgb25seSBkaXNhbGxvd3MgYm9vdCB0aW1lIHJlcGxhY2VtZW50IG9mIHJl
c3BlY3RpdmUKPj4+IGluZGlyZWN0IGNhbGxzIChoYW5kbGluZyBvZiB3aGljaCBpcyB0aGUgbWFp
biBnb2FsIG9mIHRoZSBpbnRyb2R1Y3Rpb24KPj4+IGhlcmUpLCBidXQgbW9yZSBnZW5lcmFsbHkg
ZGlzYWxsb3dzIGNhbGxzIHVzaW5nIHRoZSBpb21tdV9vcHMoKSByZXR1cm4KPj4+IHZhbHVlIGRp
cmVjdGx5IC0gYWxsIHN1Y2ggY2FsbHMgbmVlZCB0byBoYXZlIG1lYW5zIChjb21tb25seSBhIGRv
bWFpbgo+Pj4gcG9pbnRlcikgdG8ga25vdyB0aGUgdGFyZ2V0ZWQgSU9NTVUuCj4+Pgo+Pj4gRGlz
YWxsb3cgYWxsIGhvb2tzIGxhY2tpbmcgc3VjaCBjb250ZXh0IGZvciB0aGUgdGltZSBiZWluZywg
d2hpY2ggaW4KPj4+IGVmZmVjdCBpcyBzb21lIGRlYWQgY29kZSBlbGltaW5hdGlvbiBmb3IgQVJN
LiBPbmNlIGV4dGVuZGVkIHN1aXRhYmx5LAo+Pj4gaW5kaXZpZHVhbCBvZiB0aGVzZSBob29rcyBj
YW4gYmUgbW92ZWQgb3V0IG9mIHRoZWlyIGd1YXJkcyBhZ2FpbiBpbiB0aGUKPj4+IGZ1dHVyZS4K
Pj4KPj4gV2hpbGUgaW4gdGhlb3J5IGl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgcGxhdGZvcm0gd2l0
aCBoZXRlcmVuZW91cyBJT01NVXMuCj4+ICAgIEkgZG9uJ3Qgc2VlIHN1Y2ggc3VjaCBzdXBwb3J0
IGNvbWluZyBpbiBYZW4gZm9yIHRoZSBmb3Jlc2VlYWJsZQo+PiBmdXR1cmUuIE5vdGUgdGhhdCBl
dmVuIExpbnV4IGRvZXMgbm90IHN1cHBvcnQgc3VjaCBjYXNlLgo+Pgo+PiBUaGlzIHBhdGNoIGlz
IGdvaW5nIHRvIG1ha2UgbW9yZSBjb21wbGljYXRlIHRvIHVuc2hhcmUgcGFnZS10YWJsZXMgYXMK
Pj4gbm93IHdlIHdvdWxkIG5lZWQgdG8gY2FyZSBvZiBtaXhlZCBjYXNlLiBTbyBJIHdvdWxkIHJh
dGhlciBub3Qgc2V0Cj4+IElPTU1VX01JWEVEIG9uIEFybSB1bnRpbCB3ZSBoYXZlIGEgdXNlIGNh
c2UgZm9yIGl0Lgo+IAo+IFNvIGlmIEkgZHJvcCB0aGlzIGhlcmUsIGhvdyB3b3VsZCB5b3Ugd2Fu
dCBpb21tdV9nZXRfb3BzKCkKPiBnZXQgaGFuZGxlZCBvbiBBcm0gKHBhdGNoIDExKT8gUmlnaHQg
bm93IEknZCBtZWFuIHRvIGxlYXZlIGl0Cj4gYWxvbmUsIGJ1dCBpdCBjb3VsZCBhbHNvIGJlIHN3
aXRjaGVkIHRvIHRoZSAobmV3KSB4ODYgd2F5IChidXQKPiB0aGF0IHdvdWxkIHRoZW4gcGVyaGFw
cyBtYWtlIG1peGVkIG1vZGUgaW50cm9kdWN0aW9uIG1vcmUKPiBkaWZmaWN1bHQgZG93biB0aGUg
cm9hZCksIGFsbG93aW5nIHRvIGdldCBhd2F5IHdpdGggZmV3ZXIKPiAjaWZkZWYtcy4KCkkgd291
bGQgaW50cm9kdWNlIHRoZSBpb21tdV9nZXRfb3BzIGZvciB4ODYgaW4gYXNtLXg4Ni9pb21tdS5o
LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
