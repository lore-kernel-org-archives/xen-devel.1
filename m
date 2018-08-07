From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v5 11/15] mm / iommu: split need_iommu()
 into has_iommu_pt() and sync_iommu_pt()
Date: Tue, 7 Aug 2018 08:24:57 +0000
Message-ID: <0e204f98ae49468bbda62bf46f5f216b@AMSPEX02CL03.citrite.net>
References: <20180803172220.1657-1-paul.durrant@citrix.com>
 <20180803172220.1657-12-paul.durrant@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D1912AC21F@SHSMSX101.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ay9j=kw=citrix.com=prvs=750b60ad6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fmxIZ-0001ky-TK
 for xen-devel@lists.xenproject.org; Tue, 07 Aug 2018 08:24:59 +0000
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D1912AC21F@SHSMSX101.ccr.corp.intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Kevin Tian <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFRpYW4sIEtldmluIFttYWlsdG86
a2V2aW4udGlhbkBpbnRlbC5jb21dCj4gU2VudDogMDcgQXVndXN0IDIwMTggMDQ6NDEKPiBUbzog
UGF1bCBEdXJyYW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwo+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+OyBKdWxpZW4gR3JhbGwKPiA8anVsaWVuLmdyYWxsQGFybS5jb20+OyBBbmRyZXcgQ29v
cGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsKPiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3Nvbgo+IDxJYW4uSmFja3NvbkBjaXRyaXguY29t
PjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgS29ucmFkCj4gUnplc3p1dGVrIFdp
bGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9yZz47
Cj4gV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNA
dGtsZW5neWVsLmNvbT47Cj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29t
PjsgTmFrYWppbWEsIEp1bgo+IDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPjsgUmF6dmFuIENvam9j
YXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPjsKPiBTdXJhdmVlIFN1dGhpa3VscGFuaXQg
PHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsgQnJpYW4gV29vZHMKPiA8YnJpYW4ud29v
ZHNAYW1kLmNvbT4KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY1IDExLzE1XSBtbSAvIGlvbW11OiBz
cGxpdCBuZWVkX2lvbW11KCkgaW50bwo+IGhhc19pb21tdV9wdCgpIGFuZCBzeW5jX2lvbW11X3B0
KCkKPiAKPiA+IEZyb206IFBhdWwgRHVycmFudCBbbWFpbHRvOnBhdWwuZHVycmFudEBjaXRyaXgu
Y29tXQo+ID4gU2VudDogU2F0dXJkYXksIEF1Z3VzdCA0LCAyMDE4IDE6MjIgQU0KPiA+Cj4gPiBU
aGUgbmFtZSAnbmVlZF9pb21tdScgaXMgYSBsaXR0bGUgY29uZnVzaW5nIGFzIGl0IHN1Z2dlc3Rz
IGEgZG9tYWluIG5lZWRzCj4gPiB0byB1c2UgdGhlIElPTU1VIGJ1dCBzb21ldGhpbmcgbWlnaHQg
bm90IGJlIHNldCB1cCB5ZXQsIHdoZW4gaW4gZmFjdCBpdAo+ID4gZG9lc24ndCBiZWNvbWUgdHJ1
ZSB1bnRpbCBJT01NVSBtYXBwaW5ncyBmb3IgdGhlIGRvbWFpbiBoYXZlIGJlZW4KPiA+IGNyZWF0
ZWQuCj4gPgo+ID4gVHdvIGRpZmZlcmVudCBtZWFuaW5ncyBhcmUgYWxzbyBpbmZlcnJlZCBmcm9t
IGl0IGluIHZhcmlvdXMgcGxhY2VzIGluIHRoZQo+ID4gY29kZToKPiA+Cj4gPiAtIFNvbWUgY2Fs
bGVycyB3YW50IHRvIHRlc3Qgd2hldGhlciBhIGRvbWFpbiBoYXMgSU9NTVUgbWFwcGluZ3MKPiA+
IC0gU29tZSBjYWxsZXJzIHdhbnQgdG8gdGVzdCB3aGV0aGVyIHRoZXkgbmVlZCB0byBzeW5jaHJv
bml6ZSB0aGUgZG9tYWluJ3MKPiA+ICAgUDJNIGFuZCBJT01NVSBtYXBwaW5ncwo+ID4KPiA+IFRo
aXMgcGF0Y2ggdGhlcmVmb3JlIGNyZWF0ZXMgdHdvIG5ldyBib29sZWFuIGZsYWdzLCAnaGFzX2lv
bW11X3B0JyBhbmQKPiA+ICdzeW5jX2lvbW11X3B0JyB0byBjb252ZXkgdGhvc2UgbWVhbmluZ3Mg
c2VwYXJhdGVseSBhbmQgY3JlYXRlcyB0aGUKPiA+IGNvcnJlc3BvbmRpbmcgbWFjcm9zLiBBbGwg
Y2FsbGVycyBvZiBuZWVkX2lvbW11KCkgYXJlIHRoZW4gbW9kaWZpZWQgdG8KPiA+IHVzZSB0aGUg
bWFjcm8gYXBwcm9wcmlhdGUgdG8gd2hhdCB0aGV5IGFyZSB0cnlpbmcgdG8gdGVzdC4KPiAKPiBz
eW5jX2lvbW11X3B0IHNvdW5kcyBsaWtlIGFuIG9wZXJhdGlvbi4gd2hhdCBhYm91dCBuZWVkX3N5
bmNfaW9tbXU/Cj4gCj4gYW5kIGZvciBoYXNfaW9tbXVfcHQsIHdoYXQgYWJvdXQgaW9tbXVfZW5h
YmxlZCB3aGVyZSAnZW5hYmxlZCcKPiBpbXBsaWVzIHBhZ2UgdGFibGUgY3JlYXRlZD8KCkkgY291
bGQgZG8gJ25lZWRfaW9tbXVfcHRfc3luYycsIHBlcmhhcHMsIGJ1dCAnaW9tbXVfZW5hYmxlZCcg
d2lsbCBjbGFzaCB3aXRoIHRoZSBnbG9iYWwgaG9zdCBmbGFnIHdoaWNoIGlzIHdoeSBJIHdlbnQg
d2l0aCAnaGFzX2lvbW11X3B0Jy4KCiAgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
