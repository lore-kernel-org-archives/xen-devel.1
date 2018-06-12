From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Tue, 12 Jun 2018 18:00:22 +0200
Message-ID: <20180612160022.GA9677@mail.soc.lip6.fr>
References: <5AE71AB002000078001BF978@prv1-mh.provo.novell.com>
 <20180501202211.GA902@antioche.eu.org>
 <5AFAA8A902000078001C2CE6@prv1-mh.provo.novell.com>
 <20180522110101.GA25181@mail.soc.lip6.fr>
 <5B1CF56502000078001326FB@prv1-mh.provo.novell.com>
 <20180610105728.GA3492@antioche.eu.org>
 <5B1F7CEF02000078001CA402@prv1-mh.provo.novell.com>
 <20180612113905.GA25889@mail.soc.lip6.fr>
 <20180612153844.GB17270@mail.soc.lip6.fr>
 <233e98d0-5a4b-a55c-dd2a-e0ad196ffb09@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=28a9=i6=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fSlij-0007lr-E8
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 16:00:33 +0000
Content-Disposition: inline
In-Reply-To: <233e98d0-5a4b-a55c-dd2a-e0ad196ffb09@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMTIsIDIwMTggYXQgMDQ6NTQ6MzBQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMi8wNi8xOCAxNjozOCwgTWFudWVsIEJvdXllciB3cm90ZToKPiA+IE9uIFR1
ZSwgSnVuIDEyLCAyMDE4IGF0IDAxOjM5OjA1UE0gKzAyMDAsIE1hbnVlbCBCb3V5ZXIgd3JvdGU6
Cj4gPj4gSSBhcHBsaWVkIHRoaXMgcGF0Y2ggdG8gNC4xMXJjNCAobGV0J3Mgbm90IGNoYW5nZSB0
b28gbXVjaCB0aGluZ3MgYXQgdGhlCj4gPj4gc2FtZSB0aW1lKSBhbmQgcmVib290ZWQgbXkgdGVz
dCBob3N0LiBIb3BlZnVsbHkgSSdsbCBoYXZlIHNvbWUgZGF0YSB0byByZXBvcnQKPiA+PiBzb29u
Cj4gPiBHb3QgdGhlIGZpcnN0IHBhbmljIChzdGlsbCBmcm9tIGEgaTM4NiBkb21VKToKPiA+IGxv
Z2luOiAoWEVOKSBkNHYwIEhpdCAjREIgaW4gWGVuIGNvbnRleHQ6IGUwMDg6ZmZmZjgyZDA4MDM2
ZWIwMCBbb3ZlcmZsb3ddLCBzdGsgMDAwMDpmZmZmODMwMWJmMTE3Zjc4LCBkcjYgZmZmZjBmZjAK
PiA+IChYRU4pIGQ0djAgSGl0ICNEQiBpbiBYZW4gY29udGV4dDogZTAwODpmZmZmODJkMDgwMzZl
YjAwIFtvdmVyZmxvd10sIHN0ayAwMDAwOmZmZmY4MzAxYmYxMTdmNzgsIGRyNiBmZmZmMGZmMAo+
ID4gKFhFTikgZDR2MCBIaXQgI0RCIGluIFhlbiBjb250ZXh0OiBlMDA4OmZmZmY4MmQwODAzNmVi
MDAgW292ZXJmbG93XSwgc3RrIDAwMDA6ZmZmZjgzMDFiZjExN2Y3OCwgZHI2IGZmZmYwZmYwCj4g
PiAoWEVOKSBkNHYwIEhpdCAjREIgaW4gWGVuIGNvbnRleHQ6IGUwMDg6ZmZmZjgyZDA4MDM2ZWIw
MCBbb3ZlcmZsb3ddLCBzdGsgMDAwMDpmZmZmODMwMWJmMTE3Zjc4LCBkcjYgZmZmZjBmZjAKPiA+
IChYRU4pIGQ0djAgSGl0ICNEQiBpbiBYZW4gY29udGV4dDogZTAwODpmZmZmODJkMDgwMzZlYjAw
IFtvdmVyZmxvd10sIHN0ayAwMDAwOmZmZmY4MzAxYmYxMTdmNzgsIGRyNiBmZmZmMGZmMAo+ID4g
KFhFTikgZDR2MiBIaXQgI0RCIGluIFhlbiBjb250ZXh0OiBlMDA4OmZmZmY4MmQwODAzNmViMDAg
W292ZXJmbG93XSwgc3RrIDAwMDA6ZmZmZjgzMDFiZjA3N2Y3OCwgZHI2IGZmZmYwZmYwCj4gCj4g
SSBwcmVzdW1lIHlvdSdyZSBydW5uaW5nIGEgWFNBLTI2MyAoTW92U1MpIGV4cGxvaXQgaW4gdGVz
dGluZz8KCk5vdCBpbnRlbnRpb25hbGx5LCB0aGVzZSBhcmUgdGhlIE5ldEJTRCB0ZXN0IHN1aXRl
IGFuZCBJIGRvbid0IHRoaW5rIGFueQpzcGVjaWZpY2FsbHkgdGFyZ2V0cyB0aGlzICh0aGVyZSBh
cmUgNzU5IHRlc3RzIGF0IHRoaXMgdGltZSkuCkJ1dCB0aGVzZSBpbmNsdWRlcyBuZXR3b3JrIHRl
c3RzLCBzbyB0aGVyZSBpcyBwcm9iYWJseSBpbiBrZXJuZWwgYnBmIGNvZGUgdGVzdHMuCgotLSAK
TWFudWVsIEJvdXllciA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4KICAgICBOZXRCU0Q6IDI2IGFu
cyBkJ2V4cGVyaWVuY2UgZmVyb250IHRvdWpvdXJzIGxhIGRpZmZlcmVuY2UKLS0KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
