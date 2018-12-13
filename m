From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Thu, 13 Dec 2018 15:20:42 +0100
Message-ID: <20181213142042.cjaeavrhze2p4fpm@mac>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cbg8=OW=citrix.com=prvs=878bab526=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gXRs3-0003u4-QU
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 14:21:47 +0000
Content-Disposition: inline
In-Reply-To: <5C1231A10200007800205C65@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBEZWMgMTMsIDIwMTggYXQgMDM6MTc6MDVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjEyLjE4IGF0IDEwOjE0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVGh1LCBEZWMgMTMsIDIwMTggYXQgMTI6NDU6MDdBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDEyLjEyLjE4IGF0IDE4OjA1LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gT24gV2VkLCBEZWMgMTIsIDIwMTggYXQgMDk6MTU6MDlB
TSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4gVGhlIE1NSU8gc2lkZSBvZiB0aGlu
Z3Mgb2YgY291cnNlIHN0aWxsIHJlbWFpbnMgdW5jbGVhci4KPiA+PiA+IAo+ID4+ID4gUmlnaHQs
IGZvciB0aGUgTU1JTyBhbmQgdGhlIGhhbmRsaW5nIG9mIGdyYW50IGFuZCBmb3JlaWduIG1hcHBp
bmdzIGl0J3MKPiA+PiA+IG5vdCBjbGVhciBob3cgd2Ugd2FudCB0byBwcm9jZWVkLgo+ID4+ID4g
Cj4gPj4gPiBNYXliZSBhY2NvdW50IGZvciBhbGwgaG9zdCBSQU0gKHRvdGFsX3BhZ2VzKSBwbHVz
IE1NSU8gQkFScz8KPiA+PiAKPiA+PiBXZWxsLCBJIHRob3VnaHQgd2UndmUgYWxyZWFkeSBzZXR0
bGVkIG9uIGl0IGJlaW5nIGltcG9zc2libGUgdG8KPiA+PiBhY2NvdW50IGZvciBhbGwgTU1JTyBC
QVJzIGF0IHRoaXMgcG9pbnQuCj4gPiAKPiA+IFdlbGwsIEkgY291bGQgaXRlcmF0ZSBvdmVyIGFs
bCB0aGUgcmVnaXN0ZXJlZCBQQ0kgZGV2aWNlcyBhbmQgc2l6ZQo+ID4gdGhlIEJBUnMgKHdpdGhv
dXQgVkYgQkFScyBhdCBsZWFzdCBpbml0aWFsbHkpLiBUaGlzIGlzIHF1aXRlCj4gPiBjdW1iZXJz
b21lLCBteSBvdGhlciBvcHRpb24gd291bGQgYmUgdXNpbmcgbWF4X3BhZ2UgYW5kIGhvcGUgdGhh
dAo+ID4gdGhlcmUgYXJlIGVub3VnaCBob2xlcyB0byBtYWtlIHVwIGZvciBCQVIgTU1JTyByZWdp
b25zLgo+IAo+IFdlbGwsIG1heWJlIHdlIGNvdWxkIGxpdmUgd2l0aCB0aGlzIGZvciBub3cuIEkg
Y2VydGFpbmx5IHdvdWxkCj4gcHJlZmVyIHRvIGhhdmUgYSAzcmQgb3BpbmlvbiB0aG91Z2gsIGFz
IEkgY29udGludWUgdG8gZmVlbCB1bmVhc3kKPiB3aXRoIHRoaXMgcmF0aGVyIGltcHJlY2lzZSBl
c3RpbWF0aW9uIChpLmUuIEknZCBtdWNoIHByZWZlciBhIG1vcmUKPiBkeW5hbWljIC8gb24tZGVt
YW5kIGFwcHJvYWNoKS4KCkkgYWdyZWUgaXQncyBub3QgYSBwZXJmZWN0IHNvbHV0aW9uLCBidXQg
SSB0aGluayB3aGF0J3MgY3VycmVudGx5IGRvbmUKaXMgZXZlbiB3b3JzZSwgYW5kIHdlIGFscmVh
ZHkgaGFkIGJ1ZyByZXBvcnRzIG9mIHVzZXJzIHNlZWluZyBYZW4KcGFuaWMgYXQgUFZIIERvbTAg
YnVpbGQgdGltZSBpZiBubyBkb20wX21lbSBwYXJhbWV0ZXIgaXMgc3BlY2lmaWVkLgoKV291bGQg
eW91IGJlIE9LIHdpdGggdXNpbmcgbWF4X3BhZ2UgdGhlbj8gVGhpcyBpcyB0aGUgbGVzcyBjb21w
bGV4Cm9wdGlvbiB0byBpbXBsZW1lbnQgQVRNLCBhbmQgQkFSIHNpemluZyBjYW4gYmUgYWRkZWQg
bGF0ZXIgdG9nZXRoZXIKd2l0aCBhIG1vcmUgZHluYW1pYyBwMm0gbWVtb3J5IG1hbmFnZW1lbnQu
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
