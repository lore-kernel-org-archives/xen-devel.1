From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] iommu: generalize
 iommu_inclusive_mapping
Date: Wed, 1 Aug 2018 11:25:17 +0100
Message-ID: <baf1b88e-af52-7ffd-d675-f217a497891e@citrix.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-3-roger.pau@citrix.com>
 <5B60749A02000078001D9886@prv1-mh.provo.novell.com>
 <20180731153317.kryord4hezdukfgy@mac>
 <5B616D5402000078001D9BFE@prv1-mh.provo.novell.com>
 <b3a008c7-bb58-21f3-45d1-afbd2d08ce9d@citrix.com>
 <5B61791802000078001D9C8B@prv1-mh.provo.novell.com>
 <6654f71d-935d-b560-db7f-e2f65f20bcf5@citrix.com>
 <5B61847302000078001D9D57@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bzmx=kq=citrix.com=prvs=744b97e16=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fkoK0-0008Q4-W2
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 10:25:37 +0000
In-Reply-To: <5B61847302000078001D9D57@prv1-mh.provo.novell.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDgvMTggMTA6NTksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAxLjA4LjE4IGF0
IDExOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDAxLzA4LzIw
MTggMTA6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEZ1cnRoZXJtb3JlLCBvbiBieSBkZWZh
dWx0IGlzIHRoZSBvbmx5IHJlYXNvbmFibGUgb3B0aW9uLiAgRG9tMCBpcwo+Pj4+IHNwZWNpZmlj
YWxseSBnaXZlbiBjcHUgbWFwcGluZ3Mgb2YgdGhlIHJlc2VydmVkIHJlZ2lvbnMsIHRoZXJlZm9y
ZSBpdAo+Pj4+IHNob3VsZCBoYXZlIG1hdGNoaW5nIElPTU1VIG1hcHBpbmdzLgo+Pj4gSSBkb24n
dCB0aGluayBJIGNhbiB1bmlmb3JtbHkgYWdyZWUgd2l0aCB0aGlzOiBUaGVyZSBhcmUgcmVzZXJ2
ZWQKPj4+IHJlZ2lvbnMgd2hpY2ggc3BlY2lmaWNhbGx5IHdvdWxkIGJldHRlciBub3QgaGF2ZSBJ
T01NVSBtYXBwaW5nczoKPj4+IExBUElDLCBJTy1BUElDLCBNTUNGRyBqdXN0IHRvIG5hbWUgdGhp
bmdzIEkgY2FuIGltbWVkaWF0ZWx5Cj4+PiB0aGluayBvZi4KPj4gUmlnaHQsIGJ1dCB0aGF0J3Mg
bm90IHdoYXQgSSBzYWlkLgo+Pgo+PiBGb3IgYW55IENQVSBtYXBwaW5nLCB3ZSBzaG91bGQgaGF2
ZSBhIG1hdGNoaW5nIElPTU1VIG1hcHBpbmcuICBUaGlzIGlzCj4+IGhvdyBoYXJkd2FyZSBiZWhh
dmVzIGluIGEgbmF0aXZlIHN5c3RlbSwgYW5kIGlzIGhvdyBhbGwgb3BlcmF0aW5nCj4+IHN5c3Rl
bXMgYXJlIHdyaXR0ZW4gdG8gYmVoYXZlLiAgQnJlYWtpbmcgdGhpcyBleHBlY3RhdGlvbiB3aWxs
IGJyZWFrCj4+IHNvZnR3YXJlIGluIHVuZXhwZWN0ZWQgd2F5cy4KPiBXZWxsLCBMQVBJQyBpcyBh
IGNsZWFyIGV4Y2VwdGlvbiB0byB0aGlzIHJ1bGUsIGFzIGZyb20gZGV2aWNlcycgcG9pbnQKPiBv
ZiB2aWV3IHRoZSAweEZFRXh4eHh4IHJhbmdlIGhhcyBhIGNvbXBsZXRlbHkgZGlmZmVyZW50IG1l
YW5pbmcuCgpBbmQgZnVydGhlcm1vcmUgaXMgbWFnaWMgYW55d2F5IHdoZW4gaXQgY29tZXMgdG8g
RE1BJ3MgaGl0dGluZyB0aGF0IHJlZ2lvbi4KCj4KPj4gRm9yIHRoZSBpdGVtcyB5b3UgbGlzdCB0
aGVyZSwgd2UgZG9uJ3QgZ2l2ZSBkb20wIENQVSBtYXBwaW5ncyAoYmVjYXVzZQo+PiByZXN0cmlj
dGluZyB0aGVtIGlzIGluZGVlZCBhIHNlbnNpYmxlIHRoaW5nKSwgYW5kIHRoZSAibWF0Y2hpbmci
IG1hcHBpbmcKPj4gaW4gdGhlIElPTU1VIGlzIGFsc28gbm90IHByZXNlbnQuCj4gTm90IGV4YWN0
bHk6IFdlIHN0aWxsIGVtdWxhdGUgdGhvc2UgcmFuZ2VzIGZvciBDUFUgc2lkZSBhY2Nlc3NlcywK
PiB3aGlsZSB3ZSBkb24ndCBlbXVsYXRlIElPTU1VIC8gZGV2aWNlIHNpZGUgb25lcy4gU28gdGhl
cmUncyBhCj4gZGlmZmVyZW5jZSB0byBuYXRpdmUgaGFyZHdhcmUgYW55d2F5LgoKV2UgY2FuJ3Qg
ZW11bGF0ZSB0aGUgSU9NTVUgc2lkZSBhdCBhbGwsIG5vciB3b3VsZCB3ZSB3YW50IHRvIGluIHRo
ZQpjb250ZXh0IG9mIGRpc2FsbG93aW5nIGRvbTAgYWNjZXNzIHRvIHRob3NlIGJpdHMgb2YgcmVh
bCBoYXJkd2FyZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
