From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 4/4] x86/iommu: add PVH support to the
 inclusive options
Date: Tue, 31 Jul 2018 17:27:10 +0200
Message-ID: <20180731152710.nlqlv5axgsyrtd7g@mac>
References: <20180727153149.25094-1-roger.pau@citrix.com>
 <20180727153149.25094-5-roger.pau@citrix.com>
 <5B60779E02000078001D9898@prv1-mh.provo.novell.com>
 <20180731151522.gnhoydkm42vloldi@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sjk/=kp=citrix.com=prvs=743ddc6a1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fkWYV-0007gW-1L
 for xen-devel@lists.xenproject.org; Tue, 31 Jul 2018 15:27:23 +0000
Content-Disposition: inline
In-Reply-To: <20180731151522.gnhoydkm42vloldi@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdWwgMzEsIDIwMTggYXQgMDU6MTU6MjJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIEp1bCAzMSwgMjAxOCBhdCAwODo1MjoxNEFNIC0wNjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAyNy4wNy4xOCBhdCAxNzozMSwgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPiB3cm90ZToKPiA+ID4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2
L2lvbW11LmMKPiA+ID4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMK
PiA+ID4gQEAgLTIwLDYgKzIwLDggQEAKPiA+ID4gICNpbmNsdWRlIDx4ZW4vc29mdGlycS5oPgo+
ID4gPiAgI2luY2x1ZGUgPHhzbS94c20uaD4KPiA+ID4gIAo+ID4gPiArI2luY2x1ZGUgPGFzbS9h
cGljZGVmLmg+Cj4gPiA+ICsjaW5jbHVkZSA8YXNtL2lvX2FwaWMuaD4KPiA+IAo+ID4gV2h5PyBZ
b3UncmUgbG9va2luZyBmb3IgdGhlIGd1ZXN0IHZpZXcgb2YgdGhpbmdzLCB3aGljaCBJIGRvbid0
Cj4gPiB0aGluayB5b3UgY2FuIGRlcml2ZSBmcm9tIGRlZmluaXRpb25zIGluIHRoZXNlIHR3byBo
ZWFkZXJzLgo+IAo+IEkgY2FuIHVzZSB0aGUgZG9tYWluIHN0YXRlIGZvciB0aGUgbGFwaWMgYW5k
IHRoZSBpb2FwaWMuLi4KPiAKPiA+ID4gKyAgICAvKiAuLi4gb3IgdGhlIFBDSWUgTUNGRyByZWdp
b25zLiAqLwo+ID4gPiArICAgIGZvciAoIGkgPSAwOyBpIDwgcGNpX21tY2ZnX2NvbmZpZ19udW07
IGkrKyApCj4gPiA+ICsgICAgewo+ID4gPiArICAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIgPSBQ
Rk5fRE9XTihwY2lfbW1jZmdfY29uZmlnW2ldLmFkZHJlc3MpOwo+ID4gPiArCj4gPiA+ICsgICAg
ICAgIGlmICggcGZuID49IGFkZHIgKyAocGNpX21tY2ZnX2NvbmZpZ1tpXS5zdGFydF9idXNfbnVt
YmVyIDw8IDgpICYmCj4gPiA+ICsgICAgICAgICAgICAgcGZuIDwgYWRkciArIChwY2lfbW1jZmdf
Y29uZmlnW2ldLmVuZF9idXNfbnVtYmVyIDw8IDgpICkKPiA+ID4gKyAgICAgICAgICAgIHJldHVy
biBmYWxzZTsKPiA+ID4gKyAgICB9Cj4gPiAKPiA+IFNhbWUgaGVyZSAtIHRoaXMgd291bGQgYmV0
dGVyIHVzZSBkb21haW4gc3RhdGUuCj4gCj4gLi4uIGJ1dCBwY2kgbWNmZyByZWdpb25zIGFyZSBj
dXJyZW50bHkgYWRkZWQgYWZ0ZXIgdGhlIGlvbW11Cj4gaW5pdGlhbGl6YXRpb24gaW4gdGhlIEhW
TSBkb20wIGJ1aWxkZXIuIEkgY2FuIHNodWZmbGUgdGhhdCBjYWxsIHNvCj4gdGhhdCBpb21tdSBp
bml0aWFsaXphdGlvbiBpcyBwZXJmb3JtZWQgYWZ0ZXIgdGhlIG1jZmcgcmVnaW9ucyBhcmUKPiBh
ZGRlZC4KClNvIHRoYXQncyBub3Qgc28gZWFzeS4gVGhlIGN1cnJlbnQgaHZtX21tY2ZnIHVzZWQg
dG8gc3RvcmUgdGhlIE1NQ0ZHCmRhdGEgaW4gdGhlIGRvbWFpbiBzdHJ1Y3QgaXMgcHJpdmF0ZSB0
byBpby5jLCBJIGNvdWxkIG1vdmUgaXQncwpkZWNsYXJhdGlvbiB0byBhIGhlYWRlciBmaWxlLCBi
dXQgbWF5YmUgaXQncyBiZXR0ZXIgdG8ganVzdCB1c2UKcGNpX21tY2ZnX2NvbmZpZyBkaXJlY3Rs
eT8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
