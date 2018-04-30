From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH 2/4] block/xen_disk: remove use of grant
 map/unmap
Date: Mon, 30 Apr 2018 16:28:26 +0100
Message-ID: <20180430152826.puhl4lzvbdpdmomj@MacBook-Pro-de-Roger.local>
References: <1525089699-13411-1-git-send-email-paul.durrant@citrix.com>
 <1525089699-13411-3-git-send-email-paul.durrant@citrix.com>
 <20180430151145.iyou5pisaclvvn3v@MacBook-Pro-de-Roger.local>
 <dfeffd8d0d9f46fbbed1abb2bdaccd27@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dhgf=ht=citrix.com=prvs=6518dd5c5=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fDAjE-0005k6-Hh
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 15:28:36 +0000
Content-Disposition: inline
In-Reply-To: <dfeffd8d0d9f46fbbed1abb2bdaccd27@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDQ6MTY6NTJQTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+IEZyb206IFJvZ2VyIFBhdSBN
b25uZQo+ID4gU2VudDogMzAgQXByaWwgMjAxOCAxNjoxMgo+ID4gVG86IFBhdWwgRHVycmFudCA8
UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBxZW11LWJsb2NrQG5vbmdudS5vcmc7IHFlbXUtCj4gPiBkZXZlbEBub25nbnUub3Jn
OyBBbnRob255IFBlcmFyZCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IEtldmluCj4gPiBX
b2xmIDxrd29sZkByZWRoYXQuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgTWF4Cj4gPiBSZWl0eiA8bXJlaXR6QHJlZGhhdC5jb20+Cj4gPiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIDIvNF0gYmxvY2sveGVuX2Rpc2s6IHJlbW92ZSB1c2Ug
b2YgZ3JhbnQKPiA+IG1hcC91bm1hcAo+ID4gCj4gPiBPbiBNb24sIEFwciAzMCwgMjAxOCBhdCAw
MTowMTozN1BNICswMTAwLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4gPiA+IFRoZSBncmFudCBjb3B5
IG9wZXJhdGlvbiB3YXMgYWRkZWQgdG8gbGlieGVuZ250dGFiIGluIFhlbiA0LjguMC4gSWYgZ3Jh
bnQKPiA+ID4gY29weSBpcyBhdmFpbGFibGUgdGhlbiBkYXRhIGZyb20gdGhlIGd1ZXN0IHdpbGwg
YmUgY29waWVkIHJhdGhlciB0aGFuCj4gPiA+IG1hcHBlZC4KPiA+ID4gVGhlIHhlbl9kaXNrIHNv
dXJjZSBjYW4gYmUgc2lnbmlmaWNhbnRseSBzaW1wbGlmaWVkIGJ5IHJlbW92aW5nIHRoaXMgbm93
Cj4gPiA+IHJlZHVuZGFudCBjb2RlLgo+ID4gCj4gPiBIbSwgSSBrbm93IHRoaXMgaXMgYSBQSVRB
LCBidXQgRnJlZUJTRCBnbnRkZXYgaGFzbid0IGltcGxlbWVudGVkIHRoZQo+ID4gZ3JhbnQtY29w
eSBvcGVyYXRpb24geWV0Lgo+ID4gCj4gPiBJIGNvdWxkIHRyeSB0byBpbXBsZW1lbnQgaXQsIGJ1
dCBJIGNhbid0IG1ha2UgYW55IHByb21pc2VzIG9uIHRoZSB0aW1lCj4gPiBBVE0sIHNpbmNlIEkn
bSBxdWl0ZSBidXN5Lgo+ID4gCj4gCj4gSSBndWVzcyB3ZSBjb3VsZCBjYXJyeSBhIGNvbXBhdCBw
YXRjaCBpbiBRRU1VIHRoYXQgaW1wbGVtZW50cyBncmFudCBjb3B5IGJ5IGRvaW5nIGEgbWFwL21l
bWNweS91bm1hcCAsIGJ1dCBRRU1VIGZlZWxzIGxpa2UgdGhlIHdyb25nIHBsYWNlIGZvciB0aGF0
LiBJIGNvdWxkIHRyeSBwdXR0aW5nIHRvZ2V0aGVyIGEgc2ltaWxhciBwYXRjaCBmb3IgdGhlIGZy
ZWVic2QuYyBjb21wb25lbnQgb2YgbGlieGVuZ250dGFiIGluIHRoZSB4ZW4gc291cmNlIHJhdGhl
ciB0aGFuIGl0IHNpbXBseSBmYWlsaW5nIHdpdGggRU5PU1lTIGFzIGl0IGRvZXMgbm93LiBXb3Vs
ZCBlaXRoZXIgb2YgdGhvc2UgaGVscD8KCk1heWJlIHRoaXMgY291bGQgYmUgaW1wbGVtZW50ZWQg
aW4gZ250dGFiX2NvcmUuYywgc28gaXQgY2FuIGFsc28gYmUKdXNlZCBieSBNaW5pT1MgYW5kIExp
bnV4IHZlcnNpb25zIG5vdCBzdXBwb3J0aW5nIHRoZSBjb3B5IGlvY3RsIGFzIGEKZmFsbGJhY2s/
CgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
