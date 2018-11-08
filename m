From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Thu, 8 Nov 2018 16:09:49 +0000
Message-ID: <20181108160949.qvmcl6kw3w4d6e2s@zion.uk.xensource.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
 <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
 <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
 <cbd9fb77-110c-86e3-2e2f-da096bae83f0@citrix.com>
 <5BE45B1802000078001F9C36@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKmtj-0003Ws-0i
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 16:11:11 +0000
Content-Disposition: inline
In-Reply-To: <5BE45B1802000078001F9C36@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDg6NDk6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjExLjE4IGF0IDE2OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBPbiAwOC8xMS8xOCAxNTozMywgV2VpIExpdSB3cm90ZToKPiA+PiBPbiBN
b24sIE5vdiAwNSwgMjAxOCBhdCAwOToxMTo0NEFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+Pj4+Pj4gT24gMDUuMTEuMTggYXQgMTY6NDksIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PiB3cm90ZToKPiA+Pj4+IE9uIDA1LzExLzE4IDE1OjQ4LCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4+
IE9uIE1vbiwgTm92IDA1LCAyMDE4IGF0IDA4OjA0OjM3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4+Pj4+Pj4+PiBPbiAwMi4xMS4xOCBhdCAxNjo1NSwgPHdlaS5saXUyQGNpdHJpeC5j
b20+IHdyb3RlOgo+ID4+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCj4g
Pj4+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPiA+Pj4+Pj4+IEBAIC0y
OTgsOCArMjk4LDIxIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgd3JpdGVfc3R1Yl90cmFtcG9saW5l
KAo+ID4+Pj4+Pj4gIH0KPiA+Pj4+Pj4+ICAKPiA+Pj4+Pj4+ICBERUZJTkVfUEVSX0NQVShzdHJ1
Y3Qgc3R1YnMsIHN0dWJzKTsKPiA+Pj4+Pj4+ICsKPiA+Pj4+Pj4+ICsjaWZkZWYgQ09ORklHX1BW
Cj4gPj4+Pj4+PiAgdm9pZCBsc3Rhcl9lbnRlcih2b2lkKTsKPiA+Pj4+Pj4+ICB2b2lkIGNzdGFy
X2VudGVyKHZvaWQpOwo+ID4+Pj4+Pj4gKyNlbHNlCj4gPj4+Pj4+PiArc3RhdGljIGlubGluZSB2
b2lkIGxzdGFyX2VudGVyKHZvaWQpCj4gPj4+Pj4+PiArewo+ID4+Pj4+Pj4gKyAgICBwYW5pYygi
JXMgY2FsbGVkIiwgX19mdW5jX18pOwo+ID4+Pj4+Pj4gK30KPiA+Pj4+Pj4+ICsKPiA+Pj4+Pj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgY3N0YXJfZW50ZXIodm9pZCkKPiA+Pj4+Pj4+ICt7Cj4gPj4+
Pj4+PiArICAgIHBhbmljKCIlcyBjYWxsZWQiLCBfX2Z1bmNfXyk7Cj4gPj4+Pj4+PiArfQo+ID4+
Pj4+Pj4gKyNlbmRpZiAvKiBDT05GSUdfUFYgKi8KPiA+Pj4+Pj4gRG8gd2UgcmVhbGx5IG5lZWQg
dHdvIHNlcGFyYXRlIHN0dWJzIChhbmQgdHdvIHNlcGFyYXRlIHN0cmluZyBsaXRlcmFscykKPiA+
Pj4+Pj4gaGVyZT8KPiA+Pj4+PiBJIHRoaW5rIGl0IGlzIGNsZWFyZXIgaWYgd2UgaGF2ZSB0d28g
ZGlzdGluY3QgbWVzc2FnZXMuIEJ1dCBJJ20gbm90IHRvbwo+ID4+Pj4+IGZ1c3NlZCBlaXRoZXIg
d2F5IHJlYWxseS4gSWYgeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgdGhpcywgSSdtIGhhcHB5IHRv
Cj4gPj4+Pj4gY2hhbmdlIGl0IHRvIG9ubHkgb25lIGZ1bmN0aW9uLgo+ID4+Pj4gVGhpcyBpcyB0
aGUgY29ycmVjdCB3YXkgdG8gZG8gaXQuICBfX2Z1bmNfXyB3aWxsIGFscmVhZHkgYmUgaW4gdGhl
Cj4gPj4+PiBzdHJpbmcgdGFibGUsIGFuZCB0aGUgZm9ybWF0IHN0cmluZyAoYmVpbmcgaWRlbnRp
Y2FsKSB3aWxsIGJlIG1lcmdlZC4KPiA+Pj4gV2h5IHdvdWxkIF9fZnVuY19fIGJlIGluIHRoZSBz
dHJpbmcgdGFibGUgYWxyZWFkeSwgZm9yIGZ1bmN0aW9ucwo+ID4+PiBjb250YWluaW5nIG5vIG90
aGVyIHJlZmVyZW5jZXMgdG8gaXQ/Cj4gPj4gV2hhdCBpcyB0aGUgd2F5IGZvcndhcmQ/IERvIHdl
IHJlYWxseSBjYXJlIGlmIHRoZXJlIGlzIG9uZSBtb3JlIHN0cmluZwo+ID4+IGxpdGVyYWwgaW4g
dGhlIGJpbmFyeT8KPiA+IAo+ID4gTm8uICBPbmUgZXh0cmEgc3RyaW5nIGxpa2UgdGhpcyBpcyBu
b3Qgc29tZXRoaW5nIHdoaWNoIG5lZWRzIGNhcmluZwo+ID4gYWJvdXQgaW4gdGhlIHNsaWdodGVz
dC4KPiAKPiBTbyBqdXN0IHRvIGNsYXJpZnkgLSB0aGUgdW5uZWNlc3NhcnkgcmVkdW5kYW5jeSBp
biB0aGUgc291cmNlIGlzIG9mIG1vcmUKPiByZWxldmFuY2UgdG8gbWUgdGhhbiB0aGUgcmVzdWx0
aW5nIHNsaWdodGx5IGxhcmdlciBiaW5hcnkuCgpTbyB5b3Ugd291bGQgcmF0aGVyIGhhdmUKCiAg
ICBzdGF0aWMgaW5saW5lIHZvaWQgbGNzdGFyX2VudGVyKHZvaWQpCiAgICB7CiAgICAgICAgcGFu
aWMoImxzdGFyL2NzdGFyXG4iKTsKICAgIH0KCj8KClRCSCBJIHRoaW5rIHRoaXMgaXMgbm90IGFz
IGdvb2QgYXMgdXNpbmcgdHdvIGZ1bmN0aW9ucy4gSSdtIHVwIGZvcgpzZW5kaW5nIGEgZm9sbG93
dXAgcGF0Y2ggdG8gZG8gd2hhdGV2ZXIgaXQgaXMgYWdyZWVkIHVwb24sIGJ1dCBmb3Igbm93Ckkn
bSBpbnRlbmRpbmcgdG8gY29tbWl0IHRoaXMgcGF0Y2ggYXMtaXMuCgpXZWkuCgo+IAo+IEphbgo+
IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
