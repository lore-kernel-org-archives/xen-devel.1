From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/4] x86/PV: remove unnecessary
 toggle_guest_pt() overhead
Date: Thu, 04 Apr 2019 03:42:08 -0600
Message-ID: <5CA5D170020000780022470E@prv1-mh.provo.novell.com>
References: <5C88F524020000780021E12C@prv1-mh.provo.novell.com>
 <5C88F9F3020000780021E180@prv1-mh.provo.novell.com>
 <3282377e-f615-bd7b-bb6b-6e0a43a79e7c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hByst-00021J-Oa
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2019 09:42:11 +0000
In-Reply-To: <3282377e-f615-bd7b-bb6b-6e0a43a79e7c@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA0LjE5IGF0IDIwOjMyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDMvMjAxOSAxMjozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoaWxlIHRo
ZSBtZXJlIHVwZGF0aW5nIG9mIC0+cHZfY3IzIGFuZCAtPnJvb3RfcGd0X2NoYW5nZWQgYXJlbid0
IG92ZXJseQo+PiBleHBlbnNpdmUgKGJ1dCBzdGlsbCBuZWVkZWQgb25seSBmb3IgdGhlIHRvZ2ds
ZV9ndWVzdF9tb2RlKCkgcGF0aCksIHRoZQo+PiBlZmZlY3Qgb2YgdGhlIGxhdHRlciBvbiB0aGUg
ZXhpdC10by1ndWVzdCBwYXRoIGlzIG5vdCBpbnNpZ25pZmljYW50Lgo+PiBNb3ZlIHRoZSBsb2dp
YyBpbnRvIHRvZ2dsZV9ndWVzdF9tb2RlKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBXaGF0IGNhc2UgZG9lcyB0aGlzIG1ha2UgZmFz
dGVyPyAgSSdtIHJlYWxseSBzdHJ1Z2dsaW5nIHRvIHNlZSBob3cgdGhpcwo+IGlzIHNhZmUuCgpU
aGUgdHdvIGNhc2VzIHdoZXJlIHRvZ2dsZV9ndWVzdF9wdCgpIGdldHMgY2FsbGVkIChhbmQgdGhl
bgppbiBwYWlycyk6IFNpbmNlIHdlIGtub3cgd2UncmUgZ29pbmcgdG8gc3dpdGNoIGJhY2sgdG8g
dGhlCm9yaWdpbmFsIHBhZ2UgdGFibGVzIChvdGhlciB0aGFuIHdoZW4gY29taW5nIHRocm91Z2gK
dG9nZ2xlX2d1ZXN0X21vZGUoKSksIHRoZXJlJ3Mgbm8gbmVlZCB0byByZXF1ZXN0IGFueSBzcGVj
aWFsCmV4aXQtdG8tZ3Vlc3QgcHJvY2Vzc2luZyBieSBzZXR0aW5nIHJvb3RfcGd0X2NoYW5nZWQu
IEltbyBpdAp3YXMgd3JvbmcgaW4gdGhlIGZpcnN0IHBsYWNlIHRvIGhhdmUgdGhpcyBjb2RlIGFk
ZGVkIHRvCl90b2dnbGVfZ3Vlc3RfcHQoKS4gVGhlIHNlcGFyYXRpb24gb2YgdGhlIHR3byBmdW5j
dGlvbnMgd2FzCnNwZWNpZmljYWxseSBkb25lIHNvIHRoYXQgdGhpbmdzIG9ubHkgYWZmZWN0aW5n
IGEgbW9kZSBzd2l0Y2gKd291bGQgZ28gaW50byB0b2dnbGVfZ3Vlc3RfbW9kZSgpLCBub3QgdGhl
IGNvbW1vbiBoZWxwZXIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
