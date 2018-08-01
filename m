From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] iommu: generalize
 iommu_inclusive_mapping
Date: Wed, 01 Aug 2018 03:10:48 -0600
Message-ID: <5B61791802000078001D9C8B@prv1-mh.provo.novell.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-3-roger.pau@citrix.com>
 <5B60749A02000078001D9886@prv1-mh.provo.novell.com>
 <20180731153317.kryord4hezdukfgy@mac>
 <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
 <b3a008c7-bb58-21f3-45d1-afbd2d08ce9d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fkn9g-0001Ep-02
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 09:10:52 +0000
In-Reply-To: <b3a008c7-bb58-21f3-45d1-afbd2d08ce9d@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDEwOjMyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMDgvMjAxOCAwOToyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDMx
LjA3LjE4IGF0IDE3OjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gT24gVHVl
LCBKdWwgMzEsIDIwMTggYXQgMDg6Mzk6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+
Pj4+Pj4gT24gMjcuMDcuMTggYXQgMTc6MzEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6
Cj4+Pj4+IEludHJvZHVjZSBhIG5ldyBpb21tdT1pbmNsdXNpdmUgZ2VuZXJpYyBvcHRpb24gdGhh
dCBzdXBlcnNlZGVzCj4+Pj4+IGlvbW11X2luY2x1c2l2ZV9tYXBwaW5nLiBUaGlzIHNob3VsZCBi
ZSBhIG5vbi1mdW5jdGlvbmFsIGNoYW5nZSBvbgo+Pj4+PiBJbnRlbCBoYXJkd2FyZSwgd2hpbGUg
QU1EIGhhcmR3YXJlIHdpbGwgZ2FpbiB0aGUgc2FtZSBmdW5jdGlvbmFsaXR5IG9mCj4+Pj4+IG1h
cHBpbmcgYWxtb3N0IGV2ZXJ5dGhpbmcgYmVsb3cgdGhlIDRHQiBib3VuZGFyeS4KPj4+PiBTbyBm
aXJzdCBvZiBhbGwgLSB3aGF0J3MgdGhlIG1vdGl2YXRpb24gYmVoaW5kIHRoaXMgY2hhbmdlPyBT
byBmYXIgd2UKPj4+PiBoYWQgbm8gbmVlZCBmb3IgaGFja3MgbGluZSB0aGUgVlQtZCBzaWRlIG9u
ZSBvbiBBTUQuIEkgZG9uJ3QgdGhpbmsKPj4+PiB0aGlzIHNob3VsZCBiZSB3aWRlbmVkIHdpdGhv
dXQgdGhlcmUgYmVpbmcgaW5kaWNhdGlvbiBvZiBhIHByb2JsZW0KPj4+PiB3aXRoIG5vbi1uaWNo
ZSBBTUQgc3lzdGVtcy4KPj4+IE9LLCBJIGNhbiBsZWF2ZSB0aGUgZGVmYXVsdCBvbiBmb3IgSW50
ZWwgYW5kIG9mZiBmb3IgZXZlcnl0aGluZyBlbHNlLAo+Pj4gYnV0IEkgd2lsbCBpbnRyb2R1Y2Ug
dGhlIGdlbmVyaWMgZG9tMC1pb21tdT0gb3B0aW9uIGFueXdheS4KPj4gSG1tLCBJJ3ZlIGFsd2F5
cyBiZWVuIHdpc2hpbmcgd2UnZCBjaGFuZ2UgdG8gYSBkZWZhdWx0IG9mIG9mZiBmb3IKPj4gVlQt
ZCBhcyB3ZWxsIC0gaW1vIHdlIHNob3VsZG4ndCBieSBkZWZhdWx0IGFzc3VtZSBicm9rZW4gZmly
bXdhcmUuCj4+IEtldmluPwo+Pgo+PiBBcyB0byBBTUQgLSB5b3Ugc3RpbGwgZG9uJ3QgcmVhbGx5
IHNheSB3aHkgdGhpcyB3b3VsZCBiZSBuZWVkZWQKPj4gdGhlcmUuIEknbSBub3QgaW4gZmF2b3Ig
b2Ygd29ya2Fyb3VuZHMgd2hlbiB0aGVyZSdzIG5vdGhpbmcgdG8KPj4gd29yayBhcm91bmQuIElP
VyAtIGlmIHRoZSBsb2dpYyBpc24ndCBuZWVkZWQgb24gQU1ELCBkbyB3ZSBuZWVkCj4+IHRoaXMg
Y29kZSBtb3ZlbWVudCBpbiB0aGUgZmlyc3QgcGxhY2U/Cj4gCj4gVGhpcyBpcyBzdWZmaWNpZW50
bHkgYnJva2VuIG9uIEFNRCBhcyB3ZWxsLiAgVGFrZSBhIGxvb2sgYXQgYWxsIHRoZQo+IElWUlMv
SVZIVCByZXBvcnRzIHdlJ3ZlIGhhZCBvbiB4ZW4tZGV2ZWwuCgpXZSd2ZSBoYWQgSVZSUyBpc3N1
ZXMsIHllcywgYW5kIHdlIG5vdyBoYXZlIGNvbW1hbmQgbGluZSBvcHRpb25zCnRvIGRlYWwgd2l0
aCB0aGVtLiBUaGF0J3MgZW50aXJlbHkgdW5yZWxhdGVkIHRvIG1lbW9yeSByYW5nZXMgdGhvdWdo
LgoKPiBGdXJ0aGVybW9yZSwgb24gYnkgZGVmYXVsdCBpcyB0aGUgb25seSByZWFzb25hYmxlIG9w
dGlvbi4gIERvbTAgaXMKPiBzcGVjaWZpY2FsbHkgZ2l2ZW4gY3B1IG1hcHBpbmdzIG9mIHRoZSBy
ZXNlcnZlZCByZWdpb25zLCB0aGVyZWZvcmUgaXQKPiBzaG91bGQgaGF2ZSBtYXRjaGluZyBJT01N
VSBtYXBwaW5ncy4KCkkgZG9uJ3QgdGhpbmsgSSBjYW4gdW5pZm9ybWx5IGFncmVlIHdpdGggdGhp
czogVGhlcmUgYXJlIHJlc2VydmVkCnJlZ2lvbnMgd2hpY2ggc3BlY2lmaWNhbGx5IHdvdWxkIGJl
dHRlciBub3QgaGF2ZSBJT01NVSBtYXBwaW5nczoKTEFQSUMsIElPLUFQSUMsIE1NQ0ZHIGp1c3Qg
dG8gbmFtZSB0aGluZ3MgSSBjYW4gaW1tZWRpYXRlbHkKdGhpbmsgb2YuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
