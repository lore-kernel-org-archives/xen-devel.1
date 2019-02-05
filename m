From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 4/8] x86/shadow: alloc enough pages
 so initialization doesn't fail
Date: Tue, 05 Feb 2019 10:32:08 -0700
Message-ID: <5C59C89802000078002140C7@prv1-mh.provo.novell.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-5-roger.pau@citrix.com>
 <5C5971D00200007800213E92@prv1-mh.provo.novell.com>
 <20190205114739.r4zceltrrv6ovuq3@mac>
 <5C5987D60200007800213F14@prv1-mh.provo.novell.com>
 <20190205135237.54gjkm2ac7q3pnuz@mac>
 <5C59A88F0200007800214009@prv1-mh.provo.novell.com>
 <20190205155309.qkx4jos6qtfwdo6z@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tSsM=QM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gr4a2-00062B-Ay
 for xen-devel@lists.xenproject.org; Tue, 05 Feb 2019 17:32:18 +0000
In-Reply-To: <20190205155309.qkx4jos6qtfwdo6z@mac>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAyLjE5IGF0IDE2OjUzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDA1LCAyMDE5IGF0IDA4OjE1OjI3QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDUuMDIuMTkgYXQgMTQ6NTIsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gSSBkb24ndCB0aGluayB0aGUgYW1vdW50IG9mIGd1ZXN0IG1lbW9yeSBtYXR0
ZXJzIGhlcmUsIHRoZSBmb2xsb3dpbmcKPj4gPiBleGFtcGxlIHdpdGggOEcgb2YgUkFNIGFuZCA4
IHZDUFVzIGZhaWxzIGluIHRoZSBzYW1lIHdheToKPj4gPiAKPj4gPiAjIGNhdCB0ZXN0LmMKPj4g
PiB0ZXN0LmMgICAgICAgdGVzdC5jLmdjb3YgIHRlc3QuY2ZnICAgICB0ZXN0LmNvcmUKPj4gPiBy
b290QDp+ICMgY2F0IHRlc3QuY2ZnCj4+ID4gbmFtZSA9ICJ0ZXN0Igo+PiA+IHR5cGUgPSAiaHZt
Igo+PiA+IAo+PiA+IG1lbW9yeSA9IDgxOTIKPj4gPiB2Y3B1cyA9IDgKPj4gPiBoYXAgPSAwCj4+
ID4gIyB4bCBjcmVhdGUgdGVzdC5jZmcKPj4gPiBQYXJzaW5nIGNvbmZpZyBmcm9tIHRlc3QuY2Zn
Cj4+ID4gbGlieGw6IGVycm9yOiBsaWJ4bF9jcmVhdGUuYzo1Nzg6bGlieGxfX2RvbWFpbl9tYWtl
OiBkb21haW4gY3JlYXRpb24gZmFpbDogCj4+ID4gQ2Fubm90IGFsbG9jYXRlIG1lbW9yeQo+PiA+
IGxpYnhsOiBlcnJvcjogbGlieGxfY3JlYXRlLmM6OTc1OmluaXRpYXRlX2RvbWFpbl9jcmVhdGU6
IGNhbm5vdCBtYWtlIGRvbWFpbjogCj4+ID4gLTMKPj4gPiAKPj4gPiBBbmQgSSB0aGluayB0aGF0
J3MgYSBwZXJmZWN0bHkgc3VpdGFibGUgZ3Vlc3QgY29uZmlnLgo+PiAKPj4gSW5kZWVkLiBBbmQg
aXQgZG9lc24ndCBzZWVtIHRvIHdvcmsgZm9yIG1lIGFueW1vcmUgZWl0aGVyLiBNdXN0IGJlCj4+
IGEgcmVncmVzc2lvbiwgYXMgSSdtIHByZXR0eSBzdXJlIGl0IGRpZCBzdGlsbCB3b3JrIG5vdCBh
bGwgdGhhdCBsb25nIGFnby4KPj4gTm90IGV2ZW4gInNoYWRvd19tZW1vcnk9MjU2IiBoZWxwcy4K
PiAKPiBObywgYmVjYXVzZSBzaGFkb3dfaW5pdCBpcyBjYWxsZWQgZnJvbSBkb21haW5fY3JlYXRl
LCBhbmQgaXQncwo+IGltcG9zc2libGUgdG8gaW5jcmVhc2UgdGhlIHNoYWRvdyBtZW1vcnkgcG9v
bCBiZWZvcmUgdGhlIGRvbWFpbiBpcwo+IGFjdHVhbGx5IGNyZWF0ZWQuCgpPa2F5LCBJIG1pc3Vu
ZGVyc3Rvb2QgdGhlIHByb2JsZW0gaW5pdGlhbGx5LiBBaXVpIHRoaXMgaXMgYQpyZWdyZXNzaW9u
IGZyb20gdGhlIGVhcmx5IHNldHRpbmcgb2YgLT5tYXhfdmNwdXMsIGFzIHRoYXQgbm93CmNhdXNl
cyBzaGFkb3dfbWluX2FjY2VwdGFibGVfcGFnZXMoKSB0byBibG9jayBmYXIgbW9yZSBwYWdlcwp0
aGFuIGl0IGRpZCBiZWZvcmUgZnJvbSB1c2UgZm9yIHAybSBhbGxvY3MgZHVyaW5nIGRvbWFpbiBj
cmVhdGlvbi4KSSB0aGluayBJIHNlZSBhbiBhbHRlcm5hdGl2ZSB3YXkgb2YgZml4aW5nIHRoaXMg
Zm9yIHRoZSBtb21lbnQKKHdpdGhvdXQgYWRkaW5nIHJlLXNpemUgbG9naWMgeWV0IHdoZW4gZC0+
dG90X3BhZ2VzIGdyb3dzKSwgYnV0CnRoaXMgd2lsbCBoYXZlIHRvIHdhaXQgdW50aWwgdG9tb3Jy
b3cuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
