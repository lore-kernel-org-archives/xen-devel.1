From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 07/11] vpci/bars: add handlers to map the
	BARs
Date: Tue, 27 Feb 2018 07:10:51 -0700
Message-ID: <5A9574FB02000078001AC436@prv-mh.provo.novell.com>
References: <5A6750020200009C0431366C@prv-mh.provo.novell.com>
 <5A905C0902000078001AB15D@prv-mh.provo.novell.com>
 <5A93FB8202000078001ABAE7@prv-mh.provo.novell.com>
 <20180226180018.tqpxlkdjsamr5c3g@MacBook-Pro-de-Roger.local>
 <5A9525A802000078001AC0B0@prv-mh.provo.novell.com>
 <20180227092133.fynrrw7327kxh7nr@MacBook-Pro-de-Roger.local>
 <5A953A9802000078001AC158@prv-mh.provo.novell.com>
 <20180227115707.ckah2etzzr3ia56p@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=8ygc=fv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqfy9-0006i7-AJ
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 14:11:01 +0000
In-Reply-To: <20180227115707.ckah2etzzr3ia56p@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAyLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgRmViIDI3LCAyMDE4IGF0IDAzOjAxOjQ0QU0gLTA3MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMjcuMDIuMTggYXQgMTA6MjEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gV2l0aCB0aGUgY3VycmVudCBhcHByb2FjaCBpbiB0aGUgdW5tYXAgY2FzZSB0
aGVyZSB3aWxsIGJlIHN0YWxlCj4+ID4gbWFwcGluZ3MgbGVmdCBiZWhpbmQuCj4+ID4gCj4+ID4g
SSBndWVzcyBpdCdzIGJldHRlciB0aGVuIHRvIG5vdCBtb2RpZnkgdGhlIG1lbW9yeSBkZWNvZGlu
ZyBiaXQgYXQgYWxsCj4+ID4gdW50aWwgdGhlIG9wZXJhdGlvbiBmaW5pc2hlcy4gVGhhdCBhbHNv
IHJpc2VzIHRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyCj4+ID4gdGhlIG1lbW9yeSBkZWNvZGluZyBi
aXQgc2hvdWxkIGJlIG1vZGlmaWVkIGlmIHAybSBtYXBwaW5nL3VubWFwcGluZwo+PiA+IHJlcG9y
dHMgYW4gZXJyb3IuCj4+ID4gCj4+ID4gU2hvdWxkIHdlIGFsc28gYXR0ZW1wdCB0byByb2xsYmFj
ayBmYWlsZWQgbWFwL3VubWFwIG9wZXJhdGlvbnM/IFdoYXQKPj4gPiBoYXBwZW5zIGlmIHRoZSBy
b2xsYmFjayBhbHNvIGZhaWxzPwo+PiAKPj4gSXQgaXMgaW4gcGFydGljdWxhciB0aGlzIGxhc3Qg
cXVlc3Rpb24gd2h5IEkgZG9uJ3QgdGhpbmsgcm9sbGJhY2sgbWFrZXMKPj4gc2Vuc2UuIElmIHRo
ZXJlJ3MgYW55IGZhaWx1cmUsIEkgdGhpbmsgdGhlIGRlY29kZSBiaXQgc2hvdWxkIGJlIHN0aWNr
eQo+PiBjbGVhcjsgd2UgbWF5IHdhbnQgKG5lZWQ/KSB0byBpbnZlbnQgc29tZSBtYWdpY2FsIG1l
Y2hhbmlzbSB0bwo+PiBnZXQgYSBkZXZpY2UgYmFjayBvdXQgb2YgdGhpcyBzdGF0ZSBsYXRlciBv
bi4gQnV0IHRoYXQgd2F5IHN0YWxlCj4+IG1hcHBpbmdzIGFyZSBub3QgYW4gaW1tZWRpYXRlIHBy
b2JsZW0gKEkgdGhpbmspLgo+IAo+IFRoZSBvbmx5IHByb2JsZW0gSSBzZWUgd2l0aCB0aGlzIGFw
cHJvYWNoIGlzIHRoYXQgaWYgYW4gZXJyb3IgaGFwcGVucwo+IGluIHRoZSB1bm1hcCBjYXNlIHdl
IHdpbGwgZGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgYW5kIGxlYXZlIHNvbWUgc3RhbGUKPiBwMm0g
bWFwcGluZ3MuIFRoZW4gdGhlIGd1ZXN0IG1pZ2h0IGNoYW5nZSB0aGUgcG9zaXRpb24gb2YgdGhl
IEJBUnMsCj4gYW5kIHRob3NlIHN0YWxlIG1hcHBpbmdzIHdvdWxkIGJlIGNvbXBsZXRlbHkgZm9y
Z290dGVuLgoKV2VsbCwgdGhlIGltcGxpY2F0aW9uIHdhcyB0aGF0IHRvZ2V0aGVyIHdpdGggdGhl
IGRlY29kZSBlbmFibGUgYml0Cm5vdCBiZWluZyBhbGxvd2VkIHRvIGJlIHR1cm5lZCBvZmYgd291
bGQgYmUgdGhhdCBzb21lIHJlY29yZGluZwp3b3VsZCBwZXJoYXBzIGJlIG5lZWRlZCBvZiB0aGUg
c3RhbGUgbWFwcGluZ3MuIEFsbG93aW5nIHRoZQpkZWNvZGUgZW5hYmxlIGJpdCB0byBiZSBzZXQg
YWdhaW4gd291bGQgdGhlbiBkZXBlbmQgb24gdGhlIHN0YWxlCm1hcHBpbmdzIGZpcnN0IGJlaW5n
IGRlYWx0IHdpdGguIEFzIGxvbmcgYXMgdGhlIGRlY29kZSBlbmFibGUgYml0CmNhbid0IGJlIHNl
dCwgdGhlIG93bmluZyBkb21haW4gcGxheWluZyB3aXRoIHRoZSBCQVJzIGlzIG9mIG5vCmludGVy
ZXN0LgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
