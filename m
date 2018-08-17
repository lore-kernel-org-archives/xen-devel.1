From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 8/8] x86/iommu: add map-reserved
 dom0-iommu option to map reserved memory ranges
Date: Fri, 17 Aug 2018 13:17:20 +0200
Message-ID: <20180817111720.aedpnm4txojp7lfo@mac>
References: <20180814134336.75539-1-roger.pau@citrix.com>
 <20180814134336.75539-9-roger.pau@citrix.com>
 <5B76AC9802000078001DF612@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qfmz=la=citrix.com=prvs=760927a5f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fqclM-0002yJ-Ko
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 11:17:52 +0000
Content-Disposition: inline
In-Reply-To: <5B76AC9802000078001DF612@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBdWcgMTcsIDIwMTggYXQgMDU6MDg6MDhBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE0LjA4LjE4IGF0IDE1OjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gQEAgLTE4NSw3ICsyMTksMTMgQEAgdm9pZCBfX2h3ZG9tX2luaXQgYXJjaF9pb21t
dV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCj4gPiAgICAgICAgICBpZiAoICFod2RvbV9p
b21tdV9tYXAoZCwgcGZuLCBtYXhfcGZuKSApCj4gPiAgICAgICAgICAgICAgY29udGludWU7Cj4g
PiAgCj4gPiAtICAgICAgICByYyA9IGlvbW11X21hcF9wYWdlKGQsIHBmbiwgcGZuLCBJT01NVUZf
cmVhZGFibGV8SU9NTVVGX3dyaXRhYmxlKTsKPiA+ICsgICAgICAgIGlmICggaW9tbXVfdXNlX2hh
cF9wdChkKSApCj4gPiArICAgICAgICB7Cj4gPiArICAgICAgICAgICAgQVNTRVJUKGlzX2h2bV9k
b21haW4oZCkpOwo+ID4gKyAgICAgICAgICAgIHJjID0gc2V0X2lkZW50aXR5X3AybV9lbnRyeShk
LCBwZm4sIHAybV9hY2Nlc3NfcncsIDApOwo+ID4gKyAgICAgICAgfQo+ID4gKyAgICAgICAgZWxz
ZQo+ID4gKyAgICAgICAgICAgIHJjID0gaW9tbXVfbWFwX3BhZ2UoZCwgcGZuLCBwZm4sIElPTU1V
Rl9yZWFkYWJsZXxJT01NVUZfd3JpdGFibGUpOwo+IAo+IFdoeSBpb21tdV91c2VfaGFwX3B0KCk/
IFNob3VsZG4ndCBIQVAgd2l0aCBvciB3aXRob3V0IHNoYXJlZAo+IHBhZ2UgdGFibGVzIGFzIHdl
bGwgYXMgc2hhZG93IGFsbCBnZXQgdGhlIHNhbWUgaW4tc3luYyBwMm0gYW5kCj4gSU9NTVUgbWFw
cGluZ3M/Cgppb21tdV9tYXBfcGFnZSBpcyBhIG5vb3AgaWYgaW9tbXVfdXNlX2hhcF9wdCBpcyB0
cnVlIChzZWUKaW50ZWxfaW9tbXVfbWFwX3BhZ2UgZm9yIGV4YW1wbGUpLiBIZW5jZSBpbiB0aGUg
Y2FzZSB0aGUgSU9NTVUgcGFnZQp0YWJsZXMgYXJlIHNoYXJlZCB3aXRoIEhBUCB0aGUgcGFnZXMg
bXVzdCBiZSBhZGRlZCB0byB0aGUgcDJtLgoKSSBjb3VsZCBzd2l0Y2ggdGhpcyB0byB1c2Ugc2V0
X2lkZW50aXR5X3AybV9lbnRyeSBpZiB0aGUgZ3Vlc3QgaXMKYXV0by10cmFuc2xhdGVkIGFuZCBv
bmx5IHVzZSBpb21tdV9tYXBfcGFnZSBmb3Igbm9uLWF1dG90cmFuc2xhdGVkCmd1ZXN0cy4KClRo
YW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
