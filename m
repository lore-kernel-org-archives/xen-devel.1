From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Thu, 8 Nov 2018 15:49:52 +0000
Message-ID: <20181108154952.5mlscy5q4bvdypzq@zion.uk.xensource.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
 <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
 <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
 <5BE458B802000078001F9C0E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8d4c=nt=citrix.com=prvs=843a4775a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gKmZA-0008CR-3t
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:49:56 +0000
Content-Disposition: inline
In-Reply-To: <5BE458B802000078001F9C0E@prv1-mh.provo.novell.com>
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

T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDg6Mzk6MzZBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjExLjE4IGF0IDE2OjMzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBNb24sIE5vdiAwNSwgMjAxOCBhdCAwOToxMTo0NEFNIC0wNzAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMDUuMTEuMTggYXQgMTY6NDksIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPiA+PiA+IE9uIDA1LzExLzE4IDE1OjQ4LCBXZWkgTGl1IHdy
b3RlOgo+ID4+ID4+IE9uIE1vbiwgTm92IDA1LCAyMDE4IGF0IDA4OjA0OjM3QU0gLTA3MDAsIEph
biBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+Pj4+PiBPbiAwMi4xMS4xOCBhdCAxNjo1NSwgPHdlaS5s
aXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82
NC90cmFwcy5jCj4gPj4gPj4+PiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L3RyYXBzLmMKPiA+
PiA+Pj4+IEBAIC0yOTgsOCArMjk4LDIxIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgd3JpdGVfc3R1
Yl90cmFtcG9saW5lKAo+ID4+ID4+Pj4gIH0KPiA+PiA+Pj4+ICAKPiA+PiA+Pj4+ICBERUZJTkVf
UEVSX0NQVShzdHJ1Y3Qgc3R1YnMsIHN0dWJzKTsKPiA+PiA+Pj4+ICsKPiA+PiA+Pj4+ICsjaWZk
ZWYgQ09ORklHX1BWCj4gPj4gPj4+PiAgdm9pZCBsc3Rhcl9lbnRlcih2b2lkKTsKPiA+PiA+Pj4+
ICB2b2lkIGNzdGFyX2VudGVyKHZvaWQpOwo+ID4+ID4+Pj4gKyNlbHNlCj4gPj4gPj4+PiArc3Rh
dGljIGlubGluZSB2b2lkIGxzdGFyX2VudGVyKHZvaWQpCj4gPj4gPj4+PiArewo+ID4+ID4+Pj4g
KyAgICBwYW5pYygiJXMgY2FsbGVkIiwgX19mdW5jX18pOwo+ID4+ID4+Pj4gK30KPiA+PiA+Pj4+
ICsKPiA+PiA+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgY3N0YXJfZW50ZXIodm9pZCkKPiA+PiA+
Pj4+ICt7Cj4gPj4gPj4+PiArICAgIHBhbmljKCIlcyBjYWxsZWQiLCBfX2Z1bmNfXyk7Cj4gPj4g
Pj4+PiArfQo+ID4+ID4+Pj4gKyNlbmRpZiAvKiBDT05GSUdfUFYgKi8KPiA+PiA+Pj4gRG8gd2Ug
cmVhbGx5IG5lZWQgdHdvIHNlcGFyYXRlIHN0dWJzIChhbmQgdHdvIHNlcGFyYXRlIHN0cmluZyBs
aXRlcmFscykKPiA+PiA+Pj4gaGVyZT8KPiA+PiA+PiBJIHRoaW5rIGl0IGlzIGNsZWFyZXIgaWYg
d2UgaGF2ZSB0d28gZGlzdGluY3QgbWVzc2FnZXMuIEJ1dCBJJ20gbm90IHRvbwo+ID4+ID4+IGZ1
c3NlZCBlaXRoZXIgd2F5IHJlYWxseS4gSWYgeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgdGhpcywg
SSdtIGhhcHB5IHRvCj4gPj4gPj4gY2hhbmdlIGl0IHRvIG9ubHkgb25lIGZ1bmN0aW9uLgo+ID4+
ID4gCj4gPj4gPiBUaGlzIGlzIHRoZSBjb3JyZWN0IHdheSB0byBkbyBpdC4gIF9fZnVuY19fIHdp
bGwgYWxyZWFkeSBiZSBpbiB0aGUKPiA+PiA+IHN0cmluZyB0YWJsZSwgYW5kIHRoZSBmb3JtYXQg
c3RyaW5nIChiZWluZyBpZGVudGljYWwpIHdpbGwgYmUgbWVyZ2VkLgo+ID4+IAo+ID4+IFdoeSB3
b3VsZCBfX2Z1bmNfXyBiZSBpbiB0aGUgc3RyaW5nIHRhYmxlIGFscmVhZHksIGZvciBmdW5jdGlv
bnMKPiA+PiBjb250YWluaW5nIG5vIG90aGVyIHJlZmVyZW5jZXMgdG8gaXQ/Cj4gPiAKPiA+IFdo
YXQgaXMgdGhlIHdheSBmb3J3YXJkPyBEbyB3ZSByZWFsbHkgY2FyZSBpZiB0aGVyZSBpcyBvbmUg
bW9yZSBzdHJpbmcKPiA+IGxpdGVyYWwgaW4gdGhlIGJpbmFyeT8KPiAKPiBXZWxsLCBpZiBJIHVu
ZGVyc3Rvb2Qgd2hhdCBBbmRyZXcgbWVhbnMsIEkgY291bGQgZGVjaWRlIHdoZXRoZXIgdG8KPiBn
aXZlIHVwIG15IG9iamVjdGlvbi4gWWVzLCBhIHNpbmdsZSBzdHJpbmcgbGl0ZXJhbCBhbmQgYSBm
ZXcgaW5zbiBieXRlcwo+IGRvbid0IG1hdHRlciBhbGwgdGhhdCBtdWNoLiBCdXQgbm93YWRheXMg
ZXZlcnlvbmUgdGhpbmtzIHRoaXMgd2F5Cj4gZXZlcnl3aGVyZSwgYW5kIG9uZSBoYXMgdG8gbG9h
ZCBkb3plbnMgaWYgbm90IGh1bmRyZWRzIG9mIG1lZ2FieXRlcwo+IG9mIGRhdGEganVzdCB0byBn
ZXQgYSBiYXNpYyBPUyBib290ZWQuCgpDYW4gd2UgcGxlYXNlIGRvIHRoaXMgc29ydCBvZiB0aGlu
Z3Mgc3lzdGVtYXRpY2FsbHk/IExpa2UsIGhhdmUgYSBsaXN0Cm9mIGNyaXRlcmlhIHRoYXQgc3Rh
dGUgd2hpY2ggd2hlbiBhbmQgd2hlcmUgc2hvdWxkIHdlIHBheSBhdHRlbnRpb24gZm9yCmFkZGlu
ZyBzdHJpbmcgbGl0ZXJhbHMuIEFyZ3Vpbmcgb3ZlciB0aGlzIG9uIGEgY2FzZSBieSBjYXNlIGJh
c2lzIGlzIG5vdAp2ZXJ5IHByb2R1Y3RpdmUuCgpCVFcgSSBkb24ndCB0aGluayBYZW4gaXMgdG9v
IGJhZCBpbiB0aGF0IHJlZ2FyZCAtLSBpdCBjZXJ0YWlubHkgZG9lc24ndApuZWVkIGh1bmRyZWRz
IG9mIG1lZ2FieXRlcyBvZiBkYXRhIHRvIGJvb3QuCgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
