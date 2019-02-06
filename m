From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.12 4/8] x86/shadow: alloc enough pages
 so initialization doesn't fail
Date: Wed, 6 Feb 2019 10:10:46 +0100
Message-ID: <20190206091046.dzafcjpkkwoiibda@mac>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-5-roger.pau@citrix.com>
 <5C5971D00200007800213E92@prv1-mh.provo.novell.com>
 <20190205114739.r4zceltrrv6ovuq3@mac>
 <5C5987D60200007800213F14@prv1-mh.provo.novell.com>
 <20190205135237.54gjkm2ac7q3pnuz@mac>
 <5C59A88F0200007800214009@prv1-mh.provo.novell.com>
 <20190205155309.qkx4jos6qtfwdo6z@mac>
 <5C59C89802000078002140C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eoF8=QN=citrix.com=prvs=93319c3d4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1grJEv-0003DB-Jm
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 09:11:29 +0000
Content-Disposition: inline
In-Reply-To: <5C59C89802000078002140C7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBGZWIgMDUsIDIwMTkgYXQgMTA6MzI6MDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjAyLjE5IGF0IDE2OjUzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBGZWIgMDUsIDIwMTkgYXQgMDg6MTU6MjdBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA1LjAyLjE5IGF0IDE0OjUyLCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gSSBkb24ndCB0aGluayB0aGUgYW1vdW50IG9mIGd1ZXN0
IG1lbW9yeSBtYXR0ZXJzIGhlcmUsIHRoZSBmb2xsb3dpbmcKPiA+PiA+IGV4YW1wbGUgd2l0aCA4
RyBvZiBSQU0gYW5kIDggdkNQVXMgZmFpbHMgaW4gdGhlIHNhbWUgd2F5Ogo+ID4+ID4gCj4gPj4g
PiAjIGNhdCB0ZXN0LmMKPiA+PiA+IHRlc3QuYyAgICAgICB0ZXN0LmMuZ2NvdiAgdGVzdC5jZmcg
ICAgIHRlc3QuY29yZQo+ID4+ID4gcm9vdEA6fiAjIGNhdCB0ZXN0LmNmZwo+ID4+ID4gbmFtZSA9
ICJ0ZXN0Igo+ID4+ID4gdHlwZSA9ICJodm0iCj4gPj4gPiAKPiA+PiA+IG1lbW9yeSA9IDgxOTIK
PiA+PiA+IHZjcHVzID0gOAo+ID4+ID4gaGFwID0gMAo+ID4+ID4gIyB4bCBjcmVhdGUgdGVzdC5j
ZmcKPiA+PiA+IFBhcnNpbmcgY29uZmlnIGZyb20gdGVzdC5jZmcKPiA+PiA+IGxpYnhsOiBlcnJv
cjogbGlieGxfY3JlYXRlLmM6NTc4OmxpYnhsX19kb21haW5fbWFrZTogZG9tYWluIGNyZWF0aW9u
IGZhaWw6IAo+ID4+ID4gQ2Fubm90IGFsbG9jYXRlIG1lbW9yeQo+ID4+ID4gbGlieGw6IGVycm9y
OiBsaWJ4bF9jcmVhdGUuYzo5NzU6aW5pdGlhdGVfZG9tYWluX2NyZWF0ZTogY2Fubm90IG1ha2Ug
ZG9tYWluOiAKPiA+PiA+IC0zCj4gPj4gPiAKPiA+PiA+IEFuZCBJIHRoaW5rIHRoYXQncyBhIHBl
cmZlY3RseSBzdWl0YWJsZSBndWVzdCBjb25maWcuCj4gPj4gCj4gPj4gSW5kZWVkLiBBbmQgaXQg
ZG9lc24ndCBzZWVtIHRvIHdvcmsgZm9yIG1lIGFueW1vcmUgZWl0aGVyLiBNdXN0IGJlCj4gPj4g
YSByZWdyZXNzaW9uLCBhcyBJJ20gcHJldHR5IHN1cmUgaXQgZGlkIHN0aWxsIHdvcmsgbm90IGFs
bCB0aGF0IGxvbmcgYWdvLgo+ID4+IE5vdCBldmVuICJzaGFkb3dfbWVtb3J5PTI1NiIgaGVscHMu
Cj4gPiAKPiA+IE5vLCBiZWNhdXNlIHNoYWRvd19pbml0IGlzIGNhbGxlZCBmcm9tIGRvbWFpbl9j
cmVhdGUsIGFuZCBpdCdzCj4gPiBpbXBvc3NpYmxlIHRvIGluY3JlYXNlIHRoZSBzaGFkb3cgbWVt
b3J5IHBvb2wgYmVmb3JlIHRoZSBkb21haW4gaXMKPiA+IGFjdHVhbGx5IGNyZWF0ZWQuCj4gCj4g
T2theSwgSSBtaXN1bmRlcnN0b29kIHRoZSBwcm9ibGVtIGluaXRpYWxseS4gQWl1aSB0aGlzIGlz
IGEKPiByZWdyZXNzaW9uIGZyb20gdGhlIGVhcmx5IHNldHRpbmcgb2YgLT5tYXhfdmNwdXMsIGFz
IHRoYXQgbm93CgpBaGgsIEkgd2Fzbid0IGFibGUgdG8gZmlndXJlIG91dCB3aGF0IGNhdXNlZCB0
aGlzIHJlZ3Jlc3Npb24sIGl0J3MKaW5kZWVkIGNhdXNlZCBieSBtYXhfdmNwdXMgYmVpbmcgc2V0
IGF0IGRvbWFpbl9jcmVhdGUuCgo+IGNhdXNlcyBzaGFkb3dfbWluX2FjY2VwdGFibGVfcGFnZXMo
KSB0byBibG9jayBmYXIgbW9yZSBwYWdlcwo+IHRoYW4gaXQgZGlkIGJlZm9yZSBmcm9tIHVzZSBm
b3IgcDJtIGFsbG9jcyBkdXJpbmcgZG9tYWluIGNyZWF0aW9uLgo+IEkgdGhpbmsgSSBzZWUgYW4g
YWx0ZXJuYXRpdmUgd2F5IG9mIGZpeGluZyB0aGlzIGZvciB0aGUgbW9tZW50Cj4gKHdpdGhvdXQg
YWRkaW5nIHJlLXNpemUgbG9naWMgeWV0IHdoZW4gZC0+dG90X3BhZ2VzIGdyb3dzKSwgYnV0Cj4g
dGhpcyB3aWxsIGhhdmUgdG8gd2FpdCB1bnRpbCB0b21vcnJvdy4KCkFjaywgSSdtIGhhcHB5IHRv
IGltcGxlbWVudCBpdCBpZiB5b3UgdGVsbCBtZSB0aGUgcGxhbiA6KS4KCk1heWJlIGFzIGFuIGFs
dGVybmF0aXZlIHRoZSBjaGVja3MgaW4gc2hhZG93X2FsbG9jX3AybV9wYWdlIGNhbiBiZQpyZWxh
eGVkIGR1cmluZyBkb21haW4gY3JlYXRpb24sIG9yIHRoZSBwMm0gYWxsb2NhdGVkIHdoZW4gdGhl
IGZpcnN0Cm1lbW9yeSBwYWdlIGdldHMgYWRkZWQgdG8gdGhlIGRvbWFpbj8KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
