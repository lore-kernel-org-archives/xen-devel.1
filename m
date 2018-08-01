From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] iommu: generalize
 iommu_inclusive_mapping
Date: Wed, 01 Aug 2018 03:59:15 -0600
Message-ID: <5B61847302000078001D9D57@prv1-mh.provo.novell.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-3-roger.pau@citrix.com>
 <5B60749A02000078001D9886@prv1-mh.provo.novell.com>
 <20180731153317.kryord4hezdukfgy@mac>
 <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
 <b3a008c7-bb58-21f3-45d1-afbd2d08ce9d@citrix.com>
 <5B61791802000078001D9C8B@prv1-mh.provo.novell.com>
 <6654f71d-935d-b560-db7f-e2f65f20bcf5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fknuZ-00060t-5K
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 09:59:19 +0000
In-Reply-To: <6654f71d-935d-b560-db7f-e2f65f20bcf5@citrix.com>
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

Pj4+IE9uIDAxLjA4LjE4IGF0IDExOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMDgvMjAxOCAxMDoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBGdXJ0aGVy
bW9yZSwgb24gYnkgZGVmYXVsdCBpcyB0aGUgb25seSByZWFzb25hYmxlIG9wdGlvbi4gIERvbTAg
aXMKPj4+IHNwZWNpZmljYWxseSBnaXZlbiBjcHUgbWFwcGluZ3Mgb2YgdGhlIHJlc2VydmVkIHJl
Z2lvbnMsIHRoZXJlZm9yZSBpdAo+Pj4gc2hvdWxkIGhhdmUgbWF0Y2hpbmcgSU9NTVUgbWFwcGlu
Z3MuCj4+IEkgZG9uJ3QgdGhpbmsgSSBjYW4gdW5pZm9ybWx5IGFncmVlIHdpdGggdGhpczogVGhl
cmUgYXJlIHJlc2VydmVkCj4+IHJlZ2lvbnMgd2hpY2ggc3BlY2lmaWNhbGx5IHdvdWxkIGJldHRl
ciBub3QgaGF2ZSBJT01NVSBtYXBwaW5nczoKPj4gTEFQSUMsIElPLUFQSUMsIE1NQ0ZHIGp1c3Qg
dG8gbmFtZSB0aGluZ3MgSSBjYW4gaW1tZWRpYXRlbHkKPj4gdGhpbmsgb2YuCj4gCj4gUmlnaHQs
IGJ1dCB0aGF0J3Mgbm90IHdoYXQgSSBzYWlkLgo+IAo+IEZvciBhbnkgQ1BVIG1hcHBpbmcsIHdl
IHNob3VsZCBoYXZlIGEgbWF0Y2hpbmcgSU9NTVUgbWFwcGluZy4gIFRoaXMgaXMKPiBob3cgaGFy
ZHdhcmUgYmVoYXZlcyBpbiBhIG5hdGl2ZSBzeXN0ZW0sIGFuZCBpcyBob3cgYWxsIG9wZXJhdGlu
Zwo+IHN5c3RlbXMgYXJlIHdyaXR0ZW4gdG8gYmVoYXZlLiAgQnJlYWtpbmcgdGhpcyBleHBlY3Rh
dGlvbiB3aWxsIGJyZWFrCj4gc29mdHdhcmUgaW4gdW5leHBlY3RlZCB3YXlzLgoKV2VsbCwgTEFQ
SUMgaXMgYSBjbGVhciBleGNlcHRpb24gdG8gdGhpcyBydWxlLCBhcyBmcm9tIGRldmljZXMnIHBv
aW50Cm9mIHZpZXcgdGhlIDB4RkVFeHh4eHggcmFuZ2UgaGFzIGEgY29tcGxldGVseSBkaWZmZXJl
bnQgbWVhbmluZy4KCj4gRm9yIHRoZSBpdGVtcyB5b3UgbGlzdCB0aGVyZSwgd2UgZG9uJ3QgZ2l2
ZSBkb20wIENQVSBtYXBwaW5ncyAoYmVjYXVzZQo+IHJlc3RyaWN0aW5nIHRoZW0gaXMgaW5kZWVk
IGEgc2Vuc2libGUgdGhpbmcpLCBhbmQgdGhlICJtYXRjaGluZyIgbWFwcGluZwo+IGluIHRoZSBJ
T01NVSBpcyBhbHNvIG5vdCBwcmVzZW50LgoKTm90IGV4YWN0bHk6IFdlIHN0aWxsIGVtdWxhdGUg
dGhvc2UgcmFuZ2VzIGZvciBDUFUgc2lkZSBhY2Nlc3NlcywKd2hpbGUgd2UgZG9uJ3QgZW11bGF0
ZSBJT01NVSAvIGRldmljZSBzaWRlIG9uZXMuIFNvIHRoZXJlJ3MgYQpkaWZmZXJlbmNlIHRvIG5h
dGl2ZSBoYXJkd2FyZSBhbnl3YXkuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
