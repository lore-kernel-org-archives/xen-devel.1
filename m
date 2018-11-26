From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3] tools: set Dom0 UUID if requested
Date: Mon, 26 Nov 2018 10:25:27 +0000
Message-ID: <20181126102527.jhgmfbevvyoroabd@zion.uk.xensource.com>
References: <20181120180941.1005-1-wei.liu2@citrix.com>
 <20181123152849.GA6902@perard.uk.xensource.com>
 <20181123161841.pt4mms26yenh64vc@zion.uk.xensource.com>
 <20181123162500.7rpd23uttffdr5iq@zion.uk.xensource.com>
 <20181123173518.pwxdiwitefsafknj@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v668=of=citrix.com=prvs=861c38f28=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gRE55-0003BA-7p
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 10:25:31 +0000
Content-Disposition: inline
In-Reply-To: <20181123173518.pwxdiwitefsafknj@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Edwin =?iso-8859-1?B?VPZy9ms=?= <edvin.torok@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDY6MzU6MThQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIE5vdiAyMywgMjAxOCBhdCAwNDoyNTowMFBNICswMDAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDQ6MTg6NDFQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gT24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDM6Mjg6NDlQTSAr
MDAwMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
aG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hlbi1pbml0LWRvbTAuc2VydmljZS5pbiBiL3Rvb2xzL2hv
dHBsdWcvTGludXgvc3lzdGVtZC94ZW4taW5pdC1kb20wLnNlcnZpY2UuaW4KPiA+ID4gPiA+IGlu
ZGV4IDNiZWZhZGNlYTMuLmJlZWQzMTI2YzYgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS90b29scy9o
b3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuLWluaXQtZG9tMC5zZXJ2aWNlLmluCj4gPiA+ID4gPiAr
KysgYi90b29scy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuLWluaXQtZG9tMC5zZXJ2aWNlLmlu
Cj4gPiA+ID4gPiBAQCAtNyw4ICs3LDkgQEAgQ29uZGl0aW9uUGF0aEV4aXN0cz0vcHJvYy94ZW4v
Y2FwYWJpbGl0aWVzCj4gPiA+ID4gPiAgW1NlcnZpY2VdCj4gPiA+ID4gPiAgVHlwZT1vbmVzaG90
Cj4gPiA+ID4gPiAgUmVtYWluQWZ0ZXJFeGl0PXRydWUKPiA+ID4gPiA+ICtFbnZpcm9ubWVudEZp
bGU9QENPTkZJR19ESVJAL0BDT05GSUdfTEVBRl9ESVJAL3hlbmNvbW1vbnMKPiA+ID4gPiA+ICBF
eGVjU3RhcnRQcmU9L2Jpbi9ncmVwIC1xIGNvbnRyb2xfZCAvcHJvYy94ZW4vY2FwYWJpbGl0aWVz
Cj4gPiA+ID4gPiAtRXhlY1N0YXJ0PUBMSUJFWEVDX0JJTkAveGVuLWluaXQtZG9tMAo+ID4gPiA+
ID4gK0V4ZWNTdGFydD1ATElCRVhFQ19CSU5AL3hlbi1pbml0LWRvbTAgJFhFTl9ET00wX1VVSUQK
PiA+ID4gPiA+ICAKPiA+ID4gPiA+ICBbSW5zdGFsbF0KPiA+ID4gPiA+ICBXYW50ZWRCeT1tdWx0
aS11c2VyLnRhcmdldAo+ID4gPiA+IAo+ID4gPiA+IERvbid0IHlvdSBuZWVkIHRvIG1vZGlmeSBG
cmVlQlNEL3JjLmQveGVuY29tbW9ucy5pbiBhbmQKPiA+ID4gPiBOZXRCU0QvcmMuZC94ZW5jb21t
b25zLmluIGFzIHdlbGw/Cj4gPiA+IAo+ID4gPiBJIGRpZG4ndCB3YW50IHRvIG1vZGlmeSB0aGVt
IHdpdGhvdXQgaGF2aW5nIGEgdGVzdCBzZXR1cCBmaXJzdC4gIFRoZQo+ID4gPiB4ZW4taW5pdC1k
b20wIHByb2dyYW0gYWxyZWFkeSB0YWtlcyBpbnRvIGNvbnNpZGVyYXRpb24gdGhhdCB0aGV5IGRv
bid0Cj4gPiA+IHByb3ZpZGUgVVVJRC4KPiA+ID4gCj4gPiA+IEkgY2FuIGRvIGl0IGluIHRoZSBu
ZXh0IHZlcnNpb24uCj4gPiAKPiA+IEFjdHVhbGx5LCBub3cgSSByZW1lbWJlci4gVGhleSBkb24n
dCBoYXZlIHRoZSBzYW1lIG1lY2hhbmlzbSBhcyBMaW51eCB0bwo+ID4gc291cmNlIGEgc3lzdGVt
IHdpZGUgY29uZmlnIGZpbGUsIHNvIG1vZGlmeWluZyB0aGUgc2NyaXB0IHdpdGhvdXQgZml4aW5n
Cj4gPiB0aGF0IGlzc3VlIG1hZGUgbm8gc2Vuc2UgdG8gbWUuCj4gPiAKPiA+IFJvZ2VyLCB3aGF0
J3MgeW91ciBvcGluaW9uPwo+IAo+IEkgdGhpbmsgaXQncyBmaW5lIHRvIGxlYXZlIHRoZW0gYXMt
aXMuIFNpbmNlIHRoZXJlJ3Mgbm8gY29uZmlndXJhdGlvbgo+IGZpbGUgZm9yIEJTRHMgaW5pdCBz
Y3JpcHRzIG1vZGlmeWluZyB0aGVtIHRvIGFkZCBzdWNoIHBhcmFtZXRlciBpcwo+IHBvaW50bGVz
cy4KPiAKPiBJZiB5b3UgZmVlbCBsaWtlIEkgZ3Vlc3MgeW91IGNvdWxkIGFkZCBhIHBsYWNlaG9s
ZGVyIHRvIHNldCB0aGUgVVVJRAo+IGluIHRoZSBpbml0IHNjcmlwdCBpdHNlbGYsIGJ1dCB0aGF0
J3MgbW9yZSBsaWtlIGEgaGFjayBzaW5jZSB1c2VycyBhcmUKPiBub3Qgc3VwcG9zZWQgdG8gbW9k
aWZ5IHN1Y2ggc2NyaXB0cy4KCk9LLiBJIHRoaW5rIEkgd2lsbCBrZWVwIHRoaXMgcGFydCBhcy1p
cy4KCldlaS4KCj4gCj4gUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
