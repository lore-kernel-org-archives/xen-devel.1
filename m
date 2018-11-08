From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Thu, 08 Nov 2018 08:39:36 -0700
Message-ID: <5BE458B802000078001F9C0E@prv1-mh.provo.novell.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
 <5BE06BC002000078001F823D@prv1-mh.provo.novell.com>
 <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=e9yk=nt=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gKmPF-0006kK-8M
 for xen-devel@lists.xenproject.org; Thu, 08 Nov 2018 15:39:41 +0000
In-Reply-To: <20181108153330.sm6vil2pdkgabegh@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjExLjE4IGF0IDE2OjMzLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDk6MTE6NDRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwNS4xMS4xOCBhdCAxNjo0OSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiA+IE9uIDA1LzExLzE4IDE1OjQ4LCBXZWkgTGl1IHdyb3RlOgo+PiA+PiBP
biBNb24sIE5vdiAwNSwgMjAxOCBhdCAwODowNDozN0FNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4gPj4+Pj4+IE9uIDAyLjExLjE4IGF0IDE2OjU1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCj4+ID4+Pj4g
KysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC90cmFwcy5jCj4+ID4+Pj4gQEAgLTI5OCw4ICsyOTgs
MjEgQEAgc3RhdGljIHVuc2lnbmVkIGludCB3cml0ZV9zdHViX3RyYW1wb2xpbmUoCj4+ID4+Pj4g
IH0KPj4gPj4+PiAgCj4+ID4+Pj4gIERFRklORV9QRVJfQ1BVKHN0cnVjdCBzdHVicywgc3R1YnMp
Owo+PiA+Pj4+ICsKPj4gPj4+PiArI2lmZGVmIENPTkZJR19QVgo+PiA+Pj4+ICB2b2lkIGxzdGFy
X2VudGVyKHZvaWQpOwo+PiA+Pj4+ICB2b2lkIGNzdGFyX2VudGVyKHZvaWQpOwo+PiA+Pj4+ICsj
ZWxzZQo+PiA+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgbHN0YXJfZW50ZXIodm9pZCkKPj4gPj4+
PiArewo+PiA+Pj4+ICsgICAgcGFuaWMoIiVzIGNhbGxlZCIsIF9fZnVuY19fKTsKPj4gPj4+PiAr
fQo+PiA+Pj4+ICsKPj4gPj4+PiArc3RhdGljIGlubGluZSB2b2lkIGNzdGFyX2VudGVyKHZvaWQp
Cj4+ID4+Pj4gK3sKPj4gPj4+PiArICAgIHBhbmljKCIlcyBjYWxsZWQiLCBfX2Z1bmNfXyk7Cj4+
ID4+Pj4gK30KPj4gPj4+PiArI2VuZGlmIC8qIENPTkZJR19QViAqLwo+PiA+Pj4gRG8gd2UgcmVh
bGx5IG5lZWQgdHdvIHNlcGFyYXRlIHN0dWJzIChhbmQgdHdvIHNlcGFyYXRlIHN0cmluZyBsaXRl
cmFscykKPj4gPj4+IGhlcmU/Cj4+ID4+IEkgdGhpbmsgaXQgaXMgY2xlYXJlciBpZiB3ZSBoYXZl
IHR3byBkaXN0aW5jdCBtZXNzYWdlcy4gQnV0IEknbSBub3QgdG9vCj4+ID4+IGZ1c3NlZCBlaXRo
ZXIgd2F5IHJlYWxseS4gSWYgeW91IGZlZWwgc3Ryb25nbHkgYWJvdXQgdGhpcywgSSdtIGhhcHB5
IHRvCj4+ID4+IGNoYW5nZSBpdCB0byBvbmx5IG9uZSBmdW5jdGlvbi4KPj4gPiAKPj4gPiBUaGlz
IGlzIHRoZSBjb3JyZWN0IHdheSB0byBkbyBpdC4gIF9fZnVuY19fIHdpbGwgYWxyZWFkeSBiZSBp
biB0aGUKPj4gPiBzdHJpbmcgdGFibGUsIGFuZCB0aGUgZm9ybWF0IHN0cmluZyAoYmVpbmcgaWRl
bnRpY2FsKSB3aWxsIGJlIG1lcmdlZC4KPj4gCj4+IFdoeSB3b3VsZCBfX2Z1bmNfXyBiZSBpbiB0
aGUgc3RyaW5nIHRhYmxlIGFscmVhZHksIGZvciBmdW5jdGlvbnMKPj4gY29udGFpbmluZyBubyBv
dGhlciByZWZlcmVuY2VzIHRvIGl0Pwo+IAo+IFdoYXQgaXMgdGhlIHdheSBmb3J3YXJkPyBEbyB3
ZSByZWFsbHkgY2FyZSBpZiB0aGVyZSBpcyBvbmUgbW9yZSBzdHJpbmcKPiBsaXRlcmFsIGluIHRo
ZSBiaW5hcnk/CgpXZWxsLCBpZiBJIHVuZGVyc3Rvb2Qgd2hhdCBBbmRyZXcgbWVhbnMsIEkgY291
bGQgZGVjaWRlIHdoZXRoZXIgdG8KZ2l2ZSB1cCBteSBvYmplY3Rpb24uIFllcywgYSBzaW5nbGUg
c3RyaW5nIGxpdGVyYWwgYW5kIGEgZmV3IGluc24gYnl0ZXMKZG9uJ3QgbWF0dGVyIGFsbCB0aGF0
IG11Y2guIEJ1dCBub3dhZGF5cyBldmVyeW9uZSB0aGlua3MgdGhpcyB3YXkKZXZlcnl3aGVyZSwg
YW5kIG9uZSBoYXMgdG8gbG9hZCBkb3plbnMgaWYgbm90IGh1bmRyZWRzIG9mIG1lZ2FieXRlcwpv
ZiBkYXRhIGp1c3QgdG8gZ2V0IGEgYmFzaWMgT1MgYm9vdGVkLgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
