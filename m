From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 2/4] firmware/shim: better filtering of
 dependency files during Xen tree setup
Date: Thu, 8 Feb 2018 11:40:30 +0000
Message-ID: <20180208114030.exqgt4oqrpcif4se@citrix.com>
References: <5A7B21F202000078001A6124@prv-mh.provo.novell.com>
 <5A7B244C02000078001A6145@prv-mh.provo.novell.com>
 <20180207160518.lhp4xibwcncje2c2@MacBook-Pro-de-Roger.local>
 <5A7B371502000078001A6285@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rjog=fc=citrix.com=prvs=57087f223=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ejkZC-0004Bq-PV
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 11:40:38 +0000
Content-Disposition: inline
In-Reply-To: <5A7B371502000078001A6285@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMDcsIDIwMTggYXQgMDk6Mjc6NDlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAyLjE4IGF0IDE3OjA1LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gV2VkLCBGZWIgMDcsIDIwMTggYXQgMDg6MDc6NDBBTSAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gSSBoYXZlIG5vIGlkZWEgd2hhdCAqLmQxIGlzIHN1cHBvc2VkIHRv
IHJlZmVyIHRvIC0gd2Ugb25seSBoYXZlIC4qLmQKPiA+PiBhbmQgLiouZDIgZmlsZXMgKG5vdGUg
YWxzbyB0aGUgbGVhZGluZyBkb3QpLgo+ID4+IAo+ID4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiAKPiA+PiAtLS0gYS90b29scy9maXJtd2FyZS94
ZW4tZGlyL01ha2VmaWxlCj4gPj4gKysrIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmls
ZQo+ID4+IEBAIC0yNiw3ICsyNiw3IEBAIGxpbmtmYXJtLnN0YW1wOiAkKERFUF9ESVJTKSAkKERF
UF9GSUxFUykKPiA+PiAgCSQoZm9yZWFjaCBkLCAkKExJTktfRElSUyksIFwKPiA+PiAgCQkoY2Qg
JChYRU5fUk9PVCk7IFwKPiA+PiAgCQkgZmluZCAkKGQpICEgLXR5cGUgbCAtdHlwZSBmIFwKPiA+
PiAtCQkgJChhZGRwcmVmaXggISAtcGF0aCAsICcqLltvZGExXScgJyouZFsxMl0nKSkgXAo+ID4+
ICsJCSAkKGFkZHByZWZpeCAhIC1wYXRoICwgJyouW29hMV0nICcuKi5kJyAnLiouZDInKSkgXAo+
ID4gCj4gPiBEb24ndCB5b3Ugd2FudCAtbmFtZSBoZXJlIGluc3RlYWQgb2YgLXBhdGg/Cj4gPiAK
PiA+IEFGQUlDVCB1c2luZyAnLiouZCcgaXMgbm90IGdvaW5nIHRvIHdvcmsgd2l0aCBwYXRoLCBi
ZWNhdXNlIHRoYXQncyB0aGUKPiA+IGZ1bGwgcGF0aCwgbm90IHRoZSBuYW1lIG9mIHRoZSBmaWxl
LiBUaGlzIHVzZWQgdG8gd29yayBiZWZvcmUgYmVjYXVzZQo+ID4gdGhlIHBhdHRlcm5zIHN0YXJ0
ZWQgd2l0aCAnKicuCj4gCj4gT2gsIGdvb2QgcG9pbnQuIE9uY2UgYWdhaW4gSSBoYXZlIG5vIGlk
ZWEgd2h5IC1wYXRoIHdhcyB1c2VkIGluCj4gdGhlIGZpcnN0IHBsYWNlLgo+IAoKJy1uYW1lJyBp
cyBpbmRlZWQgYmV0dGVyIGhlcmUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
