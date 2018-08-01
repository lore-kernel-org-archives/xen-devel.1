From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] iommu: generalize
 iommu_inclusive_mapping
Date: Wed, 1 Aug 2018 10:20:41 +0100
Message-ID: <6654f71d-935d-b560-db7f-e2f65f20bcf5@citrix.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-3-roger.pau@citrix.com>
 <5B60749A02000078001D9886@prv1-mh.provo.novell.com>
 <20180731153317.kryord4hezdukfgy@mac>
 <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
 <b3a008c7-bb58-21f3-45d1-afbd2d08ce9d@citrix.com>
 <5B61791802000078001D9C8B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bzmx=kq=citrix.com=prvs=744b97e16=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fknJG-0002Y2-4l
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 09:20:46 +0000
In-Reply-To: <5B61791802000078001D9C8B@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMjAxOCAxMDoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZ1cnRoZXJtb3JlLCBv
biBieSBkZWZhdWx0IGlzIHRoZSBvbmx5IHJlYXNvbmFibGUgb3B0aW9uLiAgRG9tMCBpcwo+PiBz
cGVjaWZpY2FsbHkgZ2l2ZW4gY3B1IG1hcHBpbmdzIG9mIHRoZSByZXNlcnZlZCByZWdpb25zLCB0
aGVyZWZvcmUgaXQKPj4gc2hvdWxkIGhhdmUgbWF0Y2hpbmcgSU9NTVUgbWFwcGluZ3MuCj4gSSBk
b24ndCB0aGluayBJIGNhbiB1bmlmb3JtbHkgYWdyZWUgd2l0aCB0aGlzOiBUaGVyZSBhcmUgcmVz
ZXJ2ZWQKPiByZWdpb25zIHdoaWNoIHNwZWNpZmljYWxseSB3b3VsZCBiZXR0ZXIgbm90IGhhdmUg
SU9NTVUgbWFwcGluZ3M6Cj4gTEFQSUMsIElPLUFQSUMsIE1NQ0ZHIGp1c3QgdG8gbmFtZSB0aGlu
Z3MgSSBjYW4gaW1tZWRpYXRlbHkKPiB0aGluayBvZi4KClJpZ2h0LCBidXQgdGhhdCdzIG5vdCB3
aGF0IEkgc2FpZC4KCkZvciBhbnkgQ1BVIG1hcHBpbmcsIHdlIHNob3VsZCBoYXZlIGEgbWF0Y2hp
bmcgSU9NTVUgbWFwcGluZy7CoCBUaGlzIGlzCmhvdyBoYXJkd2FyZSBiZWhhdmVzIGluIGEgbmF0
aXZlIHN5c3RlbSwgYW5kIGlzIGhvdyBhbGwgb3BlcmF0aW5nCnN5c3RlbXMgYXJlIHdyaXR0ZW4g
dG8gYmVoYXZlLsKgIEJyZWFraW5nIHRoaXMgZXhwZWN0YXRpb24gd2lsbCBicmVhawpzb2Z0d2Fy
ZSBpbiB1bmV4cGVjdGVkIHdheXMuCgpGb3IgdGhlIGl0ZW1zIHlvdSBsaXN0IHRoZXJlLCB3ZSBk
b24ndCBnaXZlIGRvbTAgQ1BVIG1hcHBpbmdzIChiZWNhdXNlCnJlc3RyaWN0aW5nIHRoZW0gaXMg
aW5kZWVkIGEgc2Vuc2libGUgdGhpbmcpLCBhbmQgdGhlICJtYXRjaGluZyIgbWFwcGluZwppbiB0
aGUgSU9NTVUgaXMgYWxzbyBub3QgcHJlc2VudC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
