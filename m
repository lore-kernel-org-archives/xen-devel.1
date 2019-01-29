From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Tue, 29 Jan 2019 16:02:05 +0100
Message-ID: <20190129150205.sz2eal7umcxx5kc2@mac>
References: <5C120E030200007800205B30@prv1-mh.provo.novell.com>
 <12305AED020000300063616D@prv1-mh.provo.novell.com>
 <5C1231A10200007800205C65@prv1-mh.provo.novell.com>
 <20181213142042.cjaeavrhze2p4fpm@mac>
 <3F7E1F6E020000A10063616D@prv1-mh.provo.novell.com>
 <5C120E030200007800205B30@prv1-mh.provo.novell.com>
 <12305AED020000300063616D@prv1-mh.provo.novell.com>
 <5C1231A10200007800205C65@prv1-mh.provo.novell.com>
 <7320EEF8020000C00063616D@prv1-mh.provo.novell.com>
 <5C12711F0200007800205E5D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cRBG=QF=citrix.com=prvs=925bc6214=roger.pau@srs-us1.protection.inumbo.net>)
 id 1goUuM-0004on-5i
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 15:02:38 +0000
Content-Disposition: inline
In-Reply-To: <5C12711F0200007800205E5D@prv1-mh.provo.novell.com>
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

T24gVGh1LCBEZWMgMTMsIDIwMTggYXQgMDc6NDc6NTlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjEyLjE4IGF0IDE1OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVGh1LCBEZWMgMTMsIDIwMTggYXQgMDM6MTc6MDVBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDEzLjEyLjE4IGF0IDEwOjE0LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gT24gVGh1LCBEZWMgMTMsIDIwMTggYXQgMTI6NDU6MDdB
TSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4gPj4+IE9uIDEyLjEyLjE4IGF0IDE4
OjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+ID4gT24gV2VkLCBEZWMg
MTIsIDIwMTggYXQgMDk6MTU6MDlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4g
Pj4gVGhlIE1NSU8gc2lkZSBvZiB0aGluZ3Mgb2YgY291cnNlIHN0aWxsIHJlbWFpbnMgdW5jbGVh
ci4KPiA+PiA+PiA+IAo+ID4+ID4+ID4gUmlnaHQsIGZvciB0aGUgTU1JTyBhbmQgdGhlIGhhbmRs
aW5nIG9mIGdyYW50IGFuZCBmb3JlaWduIG1hcHBpbmdzIGl0J3MKPiA+PiA+PiA+IG5vdCBjbGVh
ciBob3cgd2Ugd2FudCB0byBwcm9jZWVkLgo+ID4+ID4+ID4gCj4gPj4gPj4gPiBNYXliZSBhY2Nv
dW50IGZvciBhbGwgaG9zdCBSQU0gKHRvdGFsX3BhZ2VzKSBwbHVzIE1NSU8gQkFScz8KPiA+PiA+
PiAKPiA+PiA+PiBXZWxsLCBJIHRob3VnaHQgd2UndmUgYWxyZWFkeSBzZXR0bGVkIG9uIGl0IGJl
aW5nIGltcG9zc2libGUgdG8KPiA+PiA+PiBhY2NvdW50IGZvciBhbGwgTU1JTyBCQVJzIGF0IHRo
aXMgcG9pbnQuCj4gPj4gPiAKPiA+PiA+IFdlbGwsIEkgY291bGQgaXRlcmF0ZSBvdmVyIGFsbCB0
aGUgcmVnaXN0ZXJlZCBQQ0kgZGV2aWNlcyBhbmQgc2l6ZQo+ID4+ID4gdGhlIEJBUnMgKHdpdGhv
dXQgVkYgQkFScyBhdCBsZWFzdCBpbml0aWFsbHkpLiBUaGlzIGlzIHF1aXRlCj4gPj4gPiBjdW1i
ZXJzb21lLCBteSBvdGhlciBvcHRpb24gd291bGQgYmUgdXNpbmcgbWF4X3BhZ2UgYW5kIGhvcGUg
dGhhdAo+ID4+ID4gdGhlcmUgYXJlIGVub3VnaCBob2xlcyB0byBtYWtlIHVwIGZvciBCQVIgTU1J
TyByZWdpb25zLgo+ID4+IAo+ID4+IFdlbGwsIG1heWJlIHdlIGNvdWxkIGxpdmUgd2l0aCB0aGlz
IGZvciBub3cuIEkgY2VydGFpbmx5IHdvdWxkCj4gPj4gcHJlZmVyIHRvIGhhdmUgYSAzcmQgb3Bp
bmlvbiB0aG91Z2gsIGFzIEkgY29udGludWUgdG8gZmVlbCB1bmVhc3kKPiA+PiB3aXRoIHRoaXMg
cmF0aGVyIGltcHJlY2lzZSBlc3RpbWF0aW9uIChpLmUuIEknZCBtdWNoIHByZWZlciBhIG1vcmUK
PiA+PiBkeW5hbWljIC8gb24tZGVtYW5kIGFwcHJvYWNoKS4KPiA+IAo+ID4gSSBhZ3JlZSBpdCdz
IG5vdCBhIHBlcmZlY3Qgc29sdXRpb24sIGJ1dCBJIHRoaW5rIHdoYXQncyBjdXJyZW50bHkgZG9u
ZQo+ID4gaXMgZXZlbiB3b3JzZSwgYW5kIHdlIGFscmVhZHkgaGFkIGJ1ZyByZXBvcnRzIG9mIHVz
ZXJzIHNlZWluZyBYZW4KPiA+IHBhbmljIGF0IFBWSCBEb20wIGJ1aWxkIHRpbWUgaWYgbm8gZG9t
MF9tZW0gcGFyYW1ldGVyIGlzIHNwZWNpZmllZC4KPiA+IAo+ID4gV291bGQgeW91IGJlIE9LIHdp
dGggdXNpbmcgbWF4X3BhZ2UgdGhlbj8KPiAKPiBJJ20gbm90IGdvaW5nIHRvIHNheSB5ZXMgb3Ig
bm8gaGVyZSB3aXRob3V0IGhhdmluZyBzZWVuIGEgKHF1YWxpZmllZCkKPiAzcmQgb3Bpbmlvbi4K
Ckkgd291bGQgbGlrZSB0byBnZXQgdGhpcyBmaXhlZC4gVGhlIGN1cnJlbnQgY29kZSBmb3IgYWNj
b3VudGluZyB0aGUKbWVtb3J5IHJlcXVpcmVkIGZvciB0aGUgcGFnaW5nIHN0cnVjdHVyZXMgaXMg
d3JvbmcsIEkndmUgcmVjZWl2ZWQKc2V2ZXJhbCByZXBvcnRzIChtb3N0IG9mIHRoZW0gcHJpdmF0
ZWx5KSBvZiB0aGUgZG9tMCBidWlsZGVyIHJ1bm5pbmcKb3V0IG9mIG1lbW9yeSwgdGh1cyBsZWFk
aW5nIHRvIGEgcGFuaWMuCgpJJ20gb3BlbiB0byBzdWdnZXN0aW9ucy4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
