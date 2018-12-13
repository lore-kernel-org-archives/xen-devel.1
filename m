From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Thu, 13 Dec 2018 07:47:59 -0700
Message-ID: <5C12711F0200007800205E5D@prv1-mh.provo.novell.com>
References: <20181212155608.nujhjevz2yyqfjdw@mac>
 <5C11340D02000078002058FA@prv1-mh.provo.novell.com>
 <20181212170519.remicvdevdl6r65n@mac>
 <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
 <5C120E030200007800205B30@prv1-mh.provo.novell.com>
 <20181213091456.7wocasd422zs5u6y@mac>
 <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
 <5C120E030200007800205B30@prv1-mh.provo.novell.com>
 <12305AED020000300063616D@prv1-mh.provo.novell.com>
 <5C1231A10200007800205C65@prv1-mh.provo.novell.com>
 <20181213142042.cjaeavrhze2p4fpm@mac>
 <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
 <5C120E030200007800205B30@prv1-mh.provo.novell.com>
 <12305AED020000300063616D@prv1-mh.provo.novell.com>
 <5C1231A10200007800205C65@prv1-mh.provo.novell.com>
 <7320EEF8020000C00063616D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gXSHV-0006aE-Kg
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:48:05 +0000
In-Reply-To: <7320EEF8020000C00063616D@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjEyLjE4IGF0IDE1OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgRGVjIDEzLCAyMDE4IGF0IDAzOjE3OjA1QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMTMuMTIuMTggYXQgMTA6MTQsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gVGh1LCBEZWMgMTMsIDIwMTggYXQgMTI6NDU6MDdBTSAtMDcwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAxMi4xMi4xOCBhdCAxODowNSwgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPiB3cm90ZToKPj4gPj4gPiBPbiBXZWQsIERlYyAxMiwgMjAxOCBhdCAwOTox
NTowOUFNIC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4gPj4gVGhlIE1NSU8gc2lkZSBv
ZiB0aGluZ3Mgb2YgY291cnNlIHN0aWxsIHJlbWFpbnMgdW5jbGVhci4KPj4gPj4gPiAKPj4gPj4g
PiBSaWdodCwgZm9yIHRoZSBNTUlPIGFuZCB0aGUgaGFuZGxpbmcgb2YgZ3JhbnQgYW5kIGZvcmVp
Z24gbWFwcGluZ3MgaXQncwo+PiA+PiA+IG5vdCBjbGVhciBob3cgd2Ugd2FudCB0byBwcm9jZWVk
Lgo+PiA+PiA+IAo+PiA+PiA+IE1heWJlIGFjY291bnQgZm9yIGFsbCBob3N0IFJBTSAodG90YWxf
cGFnZXMpIHBsdXMgTU1JTyBCQVJzPwo+PiA+PiAKPj4gPj4gV2VsbCwgSSB0aG91Z2h0IHdlJ3Zl
IGFscmVhZHkgc2V0dGxlZCBvbiBpdCBiZWluZyBpbXBvc3NpYmxlIHRvCj4+ID4+IGFjY291bnQg
Zm9yIGFsbCBNTUlPIEJBUnMgYXQgdGhpcyBwb2ludC4KPj4gPiAKPj4gPiBXZWxsLCBJIGNvdWxk
IGl0ZXJhdGUgb3ZlciBhbGwgdGhlIHJlZ2lzdGVyZWQgUENJIGRldmljZXMgYW5kIHNpemUKPj4g
PiB0aGUgQkFScyAod2l0aG91dCBWRiBCQVJzIGF0IGxlYXN0IGluaXRpYWxseSkuIFRoaXMgaXMg
cXVpdGUKPj4gPiBjdW1iZXJzb21lLCBteSBvdGhlciBvcHRpb24gd291bGQgYmUgdXNpbmcgbWF4
X3BhZ2UgYW5kIGhvcGUgdGhhdAo+PiA+IHRoZXJlIGFyZSBlbm91Z2ggaG9sZXMgdG8gbWFrZSB1
cCBmb3IgQkFSIE1NSU8gcmVnaW9ucy4KPj4gCj4+IFdlbGwsIG1heWJlIHdlIGNvdWxkIGxpdmUg
d2l0aCB0aGlzIGZvciBub3cuIEkgY2VydGFpbmx5IHdvdWxkCj4+IHByZWZlciB0byBoYXZlIGEg
M3JkIG9waW5pb24gdGhvdWdoLCBhcyBJIGNvbnRpbnVlIHRvIGZlZWwgdW5lYXN5Cj4+IHdpdGgg
dGhpcyByYXRoZXIgaW1wcmVjaXNlIGVzdGltYXRpb24gKGkuZS4gSSdkIG11Y2ggcHJlZmVyIGEg
bW9yZQo+PiBkeW5hbWljIC8gb24tZGVtYW5kIGFwcHJvYWNoKS4KPiAKPiBJIGFncmVlIGl0J3Mg
bm90IGEgcGVyZmVjdCBzb2x1dGlvbiwgYnV0IEkgdGhpbmsgd2hhdCdzIGN1cnJlbnRseSBkb25l
Cj4gaXMgZXZlbiB3b3JzZSwgYW5kIHdlIGFscmVhZHkgaGFkIGJ1ZyByZXBvcnRzIG9mIHVzZXJz
IHNlZWluZyBYZW4KPiBwYW5pYyBhdCBQVkggRG9tMCBidWlsZCB0aW1lIGlmIG5vIGRvbTBfbWVt
IHBhcmFtZXRlciBpcyBzcGVjaWZpZWQuCj4gCj4gV291bGQgeW91IGJlIE9LIHdpdGggdXNpbmcg
bWF4X3BhZ2UgdGhlbj8KCkknbSBub3QgZ29pbmcgdG8gc2F5IHllcyBvciBubyBoZXJlIHdpdGhv
dXQgaGF2aW5nIHNlZW4gYSAocXVhbGlmaWVkKQozcmQgb3Bpbmlvbi4KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
