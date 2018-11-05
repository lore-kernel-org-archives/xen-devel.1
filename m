From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 3/7] x86: make PV hypercall entry points
 work with !CONFIG_PV
Date: Mon, 5 Nov 2018 15:51:30 +0000
Message-ID: <20181105155130.3gugvufubnladgnc@zion.uk.xensource.com>
References: <cover.39d7afa1de7ac30224aa95827f791db8d5650fde.1541174103.git-series.wei.liu2@citrix.com>
 <578d1dfbfc76230034b81fc79175a2181a62eac2.1541174103.git-series.wei.liu2@citrix.com>
 <5BE05C0502000078001F8186@prv1-mh.provo.novell.com>
 <20181105154842.ka44hltutou2fdia@zion.uk.xensource.com>
 <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mtqo=nq=citrix.com=prvs=8406a2984=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gJhA7-0003t4-CO
 for xen-devel@lists.xenproject.org; Mon, 05 Nov 2018 15:51:35 +0000
Content-Disposition: inline
In-Reply-To: <e7474869-6ea1-691c-4eae-c2131b1527db@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMDUsIDIwMTggYXQgMDM6NDk6NDBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwNS8xMS8xOCAxNTo0OCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIE1vbiwgTm92
IDA1LCAyMDE4IGF0IDA4OjA0OjM3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+
IE9uIDAyLjExLjE4IGF0IDE2OjU1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYwo+ID4+PiArKysgYi94ZW4vYXJjaC94
ODYveDg2XzY0L3RyYXBzLmMKPiA+Pj4gQEAgLTI5OCw4ICsyOTgsMjEgQEAgc3RhdGljIHVuc2ln
bmVkIGludCB3cml0ZV9zdHViX3RyYW1wb2xpbmUoCj4gPj4+ICB9Cj4gPj4+ICAKPiA+Pj4gIERF
RklORV9QRVJfQ1BVKHN0cnVjdCBzdHVicywgc3R1YnMpOwo+ID4+PiArCj4gPj4+ICsjaWZkZWYg
Q09ORklHX1BWCj4gPj4+ICB2b2lkIGxzdGFyX2VudGVyKHZvaWQpOwo+ID4+PiAgdm9pZCBjc3Rh
cl9lbnRlcih2b2lkKTsKPiA+Pj4gKyNlbHNlCj4gPj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgbHN0
YXJfZW50ZXIodm9pZCkKPiA+Pj4gK3sKPiA+Pj4gKyAgICBwYW5pYygiJXMgY2FsbGVkIiwgX19m
dW5jX18pOwo+ID4+PiArfQo+ID4+PiArCj4gPj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgY3N0YXJf
ZW50ZXIodm9pZCkKPiA+Pj4gK3sKPiA+Pj4gKyAgICBwYW5pYygiJXMgY2FsbGVkIiwgX19mdW5j
X18pOwo+ID4+PiArfQo+ID4+PiArI2VuZGlmIC8qIENPTkZJR19QViAqLwo+ID4+IERvIHdlIHJl
YWxseSBuZWVkIHR3byBzZXBhcmF0ZSBzdHVicyAoYW5kIHR3byBzZXBhcmF0ZSBzdHJpbmcgbGl0
ZXJhbHMpCj4gPj4gaGVyZT8KPiA+IEkgdGhpbmsgaXQgaXMgY2xlYXJlciBpZiB3ZSBoYXZlIHR3
byBkaXN0aW5jdCBtZXNzYWdlcy4gQnV0IEknbSBub3QgdG9vCj4gPiBmdXNzZWQgZWl0aGVyIHdh
eSByZWFsbHkuIElmIHlvdSBmZWVsIHN0cm9uZ2x5IGFib3V0IHRoaXMsIEknbSBoYXBweSB0bwo+
ID4gY2hhbmdlIGl0IHRvIG9ubHkgb25lIGZ1bmN0aW9uLgo+IAo+IFRoaXMgaXMgdGhlIGNvcnJl
Y3Qgd2F5IHRvIGRvIGl0LsKgIF9fZnVuY19fIHdpbGwgYWxyZWFkeSBiZSBpbiB0aGUKPiBzdHJp
bmcgdGFibGUsIGFuZCB0aGUgZm9ybWF0IHN0cmluZyAoYmVpbmcgaWRlbnRpY2FsKSB3aWxsIGJl
IG1lcmdlZC4KCkkgdGhpbmsgSmFuIHdhcyBjb21wbGFpbmluZyB0d28gX19mdW5jX18ncyAodHdv
IHN0cmluZyBsaXRlcmFscykuCgpXZWkuCgo+IAo+IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
