From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 2/4] xen/arm: initialize access
Date: Wed, 17 Oct 2018 21:53:25 +0800 (CST)
Message-ID: <alpine.DEB.2.10.1810171929090.3835@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1810142125100.4859@sstabellini-ThinkPad-X260>
 <1539597367-25807-2-git-send-email-sstabellini@kernel.org>
 <CABfawhmtLksbC6pyp2SuH=sPR5E6mndwbMMpucBca3nUpDUbqQ@mail.gmail.com>
 <alpine.DEB.2.10.1810160911160.4859@sstabellini-ThinkPad-X260>
 <CABfawhng=F=kxn8OAx1Ns8_Lmb0rTxRPVuRToACueYkSPwzyUA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ehpq=m5=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gCmHY-0001d3-4l
 for xen-devel@lists.xenproject.org; Wed, 17 Oct 2018 13:54:40 +0000
In-Reply-To: <CABfawhng=F=kxn8OAx1Ns8_Lmb0rTxRPVuRToACueYkSPwzyUA@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, stefanos@xilinx.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAxNiBPY3QgMjAxOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIE1vbiwgT2N0
IDE1LCAyMDE4IGF0IDc6MTQgUE0gU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgMTUgT2N0IDIwMTgsIFRhbWFzIEsgTGVu
Z3llbCB3cm90ZToKPiA+ID4gT24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMzo1NyBBTSBTdGVmYW5v
IFN0YWJlbGxpbmkKPiA+ID4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+
Cj4gPiA+ID4gSW5pdGlhbGl6ZSB2YXJpYWJsZSAqYWNjZXNzIGJlZm9yZSByZXR1cm5pbmcgaXQg
YmFjayB0byB0aGUgY2FsbGVyLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU3RlZmFu
byBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICB4
ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jIHwgMSArCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9t
ZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vzcy5jCj4gPiA+ID4gaW5kZXggYmE0
ZWM3OC4uMTBhYjMwOCAxMDA2NDQKPiA+ID4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vbWVtX2FjY2Vz
cy5jCj4gPiA+ID4gKysrIGIveGVuL2FyY2gvYXJtL21lbV9hY2Nlc3MuYwo+ID4gPiA+IEBAIC00
Nyw2ICs0Nyw3IEBAIHN0YXRpYyBpbnQgX19wMm1fZ2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFp
biAqZCwgZ2ZuX3QgZ2ZuLAo+ID4gPiA+ICAgICAgfTsKPiA+ID4gPgo+ID4gPiA+ICAgICAgQVNT
RVJUKHAybV9pc19sb2NrZWQocDJtKSk7Cj4gPiA+ID4gKyAgICAqYWNjZXNzID0gWEVOTUVNX2Fj
Y2Vzc19uOwo+ID4gPgo+ID4gPiAgV2h5IFhFTk1FTV9hY2Nlc3NfbiBhbmQgd2h5IHNldCB0aGlz
IGF0IGFsbCBoZXJlPwo+ID4KPiA+IEhpIFRhbWFzLAo+ID4KPiA+IFllcywgSSBtaXNzZWQgYW4g
ZXhwbGFuYXRpb24uIEluaXRpYWxpemluZyB2YXJpYWJsZXMgYmVmb3JlIHBhc3NpbmcgdGhlbQo+
ID4gYXMgcGFyYW1ldGVyIG9yIGFzIGEgcmV0dXJuIHZhbHVlIHRvIGEgZnVuY3Rpb24gaXMgYSBz
YWZldHkKPiA+IGNlcnRpZmljYXRpb24gcmVxdWlyZW1lbnQuIEFsc28sIGl0IG1ha2VzIHRoZSBj
b2RlIGEgYml0IG5pY2VyLgo+ID4KPiA+IEluIHRoZSBzcGVjaWZpYyBjYXNlIG9mIHRoaXMgZnVu
Y3Rpb24sICphY2Nlc3MgaXMgaW5pdGlhbGl6ZWQgYmVmb3JlCj4gPiByZXR1cm5pbmcgaW4gYWxs
IGNhc2VzIGJ1dCB0aGUgcmV0dXJuIC1FU1JDSCBjYXNlLiBJIHRob3VnaHQgdGhlIG5pY2VyCj4g
PiB3YXkgdG8gbWFrZSBzdXJlICphY2Nlc3MgaXMgYWx3YXlzIGluaXRpYWxpemVkLCBtYWtpbmcg
dGhlIGNvZGUgbW9yZQo+ID4gcm9idXN0LCB3b3VsZCBiZSB0byBpbml0aWFsaXplICphY2Nlc3Mg
YXQgdGhlIGJlZ2lubmluZyBvZiB0aGUgZnVuY3Rpb24KPiA+IHdpdGggYSByZXN0cmljdGl2ZSB2
YWx1ZS4KPiAKPiBHb3QgaXQsIHRoYW5rcywgUGxlYXNlIHVzZSBwMm0tPmRlZmF1bHRfYWNjZXNz
IGZvciB0aGlzIGluc3RlYWQgdG8gYmUKPiBjb25zaXN0ZW50IHdpdGggc2ltaWxhciBjb2RlIGF0
IG90aGVyIHNwb3RzLgoKT0ssIG5vIHByb2IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
