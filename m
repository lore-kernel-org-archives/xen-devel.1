From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Wed, 13 Jun 2018 12:07:35 +0200
Message-ID: <20180613100735.GA8452@mail.soc.lip6.fr>
References: <5B1FE90D020000F804A5F2B5@prv1-mh.provo.novell.com>
 <5B20335B0200008603B30F33@prv1-mh.provo.novell.com>
 <5B20D0C102000078001CABB9@prv1-mh.provo.novell.com>
 <20180613085736.GA8026@mail.soc.lip6.fr>
 <5B1FB0E5020000F903B0F0C2@prv1-mh.provo.novell.com>
 <5B1FE90D020000F804A5F2B5@prv1-mh.provo.novell.com>
 <5B20335B0200008603B30F33@prv1-mh.provo.novell.com>
 <5B20D0C102000078001CABB9@prv1-mh.provo.novell.com>
 <5B20DC910200000204A693B0@prv1-mh.provo.novell.com>
 <5B20EAF702000078001CACA3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=otbb=i7=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fT2gm-0000mZ-Lu
 for xen-devel@lists.xenproject.org; Wed, 13 Jun 2018 10:07:40 +0000
Content-Disposition: inline
In-Reply-To: <5B20EAF702000078001CACA3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdW4gMTMsIDIwMTggYXQgMDM6NTk6MTlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA2LjE4IGF0IDEwOjU3LCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4g
d3JvdGU6Cj4gPiBPbiBXZWQsIEp1biAxMywgMjAxOCBhdCAwMjowNzoyOUFNIC0wNjAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+PiAKPiA+PiAoWEVOKSBBc3NlcnRpb24gJyFwYWdlLT5saW5lYXJf
cHRfY291bnQnIGZhaWxlZCBhdCBtbS5jOjU5Ngo+ID4+IAo+ID4+IEluIGZhY3QsIHRoZXJlJ3Mg
bm8gYXNzZXJ0aW9uIHdpdGggdGhhdCBleHByZXNzaW9uIGFueXdoZXJlIEkgY291bGQKPiA+PiBz
ZWUuIERvIHlvdSBoYXZlIGFueSBsb2NhbCBwYXRjaGVzIGluIHBsYWNlPwo+ID4gCj4gPiBZZXMs
IDIgb2YgdGhlbSBmcm9tIHlvdSAodGhlIGZpcnN0IG9uZSBpcyB3aGVyZSB0aGUgYXNzZXJ0IGlz
KS4gU2VlIAo+ID4gYXR0YWNoZWQuCj4gCj4gT2gsIEkgaGFkIGxvbmcgZHJvcHBlZCB0aGF0IGZp
cnN0IG9uZSwgYWZ0ZXIgeW91IGhhZCBzYWlkIHRoYXQgaXQgZGlkbid0Cj4gdHJpZ2dlciBpbiBh
IGxvbmcgdGltZS4gSXQgdHJpZ2dlcmluZyB3aXRoIHRoZSBvdGhlciBkZWJ1Z2dpbmcgcGF0Y2gg
aXMKPiBub3QgdW5leHBlY3RlZC4gU28gcGxlYXNlIGRyb3AgdGhhdCBwYXRjaCBhdCBsZWFzdCBm
b3IgdGhlIHRpbWUgYmVpbmcuCgpPSywgcmVidWlsZGluZyBYZW4gcmlnaHQgbm93CgotLSAKTWFu
dWVsIEJvdXllciA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4KICAgICBOZXRCU0Q6IDI2IGFucyBk
J2V4cGVyaWVuY2UgZmVyb250IHRvdWpvdXJzIGxhIGRpZmZlcmVuY2UKLS0KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
