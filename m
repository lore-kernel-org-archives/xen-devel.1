From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Wed, 16 Jan 2019 03:25:57 -0700
Message-ID: <5C3F06B5020000780020E322@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <CAF3u54A-1_cum6u-nXm4m+60=7tFF=Y1vnR-0+fEKg2y6_68rw@mail.gmail.com>
 <alpine.DEB.2.10.1901101311110.27759@sstabellini-ThinkPad-X260>
 <CAF3u54Cfx3fGXY-bg2fYb+i_5kOA8qjrzOtK3sFF8j9bHQve8A@mail.gmail.com>
 <alpine.DEB.2.10.1901101745560.27759@sstabellini-ThinkPad-X260>
 <5C387472020000780020C9A7@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901110911310.27759@sstabellini-ThinkPad-X260>
 <a3743bd4b2d54188890945322e92fc1b@dornerworks.com>
 <CAF3u54AAmx0rBVPscfvqcx5f0ezYNCkrsagJgZb3v2GqfB9TEw@mail.gmail.com>
 <0e731cbd10b64a2faac309c04c2030e2@dornerworks.com>
 <alpine.DEB.2.10.1901111331490.27759@sstabellini-ThinkPad-X260>
 <3cc0862e5f0442d49c33c08f21b423ab@dornerworks.com>
 <5C3C63E0020000780020D22C@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901141030300.27759@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901151043440.18561@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <2EA6D6FD0200001F00417A66@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mr/O=PY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gjiQS-0005Dy-H7
 for xen-devel@lists.xenproject.org; Wed, 16 Jan 2019 10:28:00 +0000
In-Reply-To: <2EA6D6FD0200001F00417A66@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAxLjE5IGF0IDAwOjM2LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gVHVlLCAxNSBKYW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZpcnN0IG9mIGFs
bCB3ZSBzaG91bGQgZXhwbG9yZSB3aGV0aGVyIHRoZSB2YXJpYWJsZXMgY291bGQgYWxzbyBiZQo+
PiBsaW5rZXIgZ2VuZXJhdGVkLCBpbiBwYXJ0aWN1bGFyIHRvIGF2b2lkIHRoZSBjdXJyZW50IHN5
bWJvbHMgdG8gYmUKPj4gZ2xvYmFsICh0aHVzIG1ha2luZyBpdCBpbXBvc3NpYmxlIHRvIGFjY2Vz
cyB0aGVtIGZyb20gQyBmaWxlcyBpbiB0aGUKPj4gZmlyc3QgcGxhY2UpLgo+IAo+IFRoYXQgd291
bGQgYmUgZmFudGFzdGljLiBJIGxvb2tlZCBhcm91bmQsIEkgZm91bmQgaW50ZXJlc3RpbmcgdGhp
bmdzCj4gbGlrZSBQUk9WSURFLCBidXQgSSBkb24ndCB0aGluayB3aGF0IHlvdSBkZXNjcmliZSBp
cyBwb3NzaWJsZS4gVGhlCj4gbGlua2VyIHNjcmlwdHMgb25seSBkZWZpbmUgc3ltYm9scywgdGhl
eSBjYW5ub3Qgc2V0IG9yIGRlZmluZSB2YXJpYWJsZXMuCgpZZWFoLCBpdCBkaWRuJ3Qgc2VlbSB2
ZXJ5IGxpa2VseS4gVGhlbiBhZ2FpbiBJIHRoaW5rIHRoZSBuZXh0IGJlc3QKYXBwcm9hY2ggd291
bGQgc3RpbGwgYmUgdG8gdXNlIC5zdGFydG9mLiAvIC5zaXplb2YuLCBqdXN0IG5vdCB0aGUKd2F5
IG15IG9yaWdpbmFsIHBhdGNoIGRpZCwgYnV0IGluIHlvdXIgdmFyLlMgZmlsZShzKS4gVGhlCmZ1
bmRhbWVudGFsIGdvYWwgc3RpbGwgYmVpbmcgdG8gYXZvaWQgZXhwb3N1cmUgb2YgdGhlIHN5bWJv
bHMKd2UgZG9uJ3Qgd2FudCB0byBiZSB1c2VkIGluIEMgYWx0b2dldGhlci4gKEFsbCBvZiB0aGlz
IHByb3ZpZGVkCndlIG5lZWQgdG8gZ28gdGhpcyBpbnRlcm1lZGlhdGUgdmFyaWFibGUgcm91dGUg
aW4gdGhlIGZpcnN0IHBsYWNlLAp3aGljaCBJIGNvbnRpbnVlIHRvIGJlIHVuY29udmluY2VkIG9m
LCBkZXNwaXRlIHlvdSBoYXZpbmcKcG9zdGVkIGEgcmVzcGVjdGl2ZSB2OCBvZiB5b3VyIHNlcmll
cy4pCgo+PiBGYWlsaW5nIHRoYXQsIEkgZG9uJ3QgdGhpbmsgaXQgbWF0dGVycyBtdWNoIHdoZXJl
IHRoZXNlCj4+IGhlbHBlciBzeW1ib2xzIGxpdmUsIGFuZCBoZW5jZSB5b3VyIGNob2ljZSBpcyBw
cm9iYWJseSBmaW5lIChJJ2QKPj4gcHJlZmVyIHRob3VnaCBpZiwganVzdCBsaWtlIG9uIEFybSwg
dGhlIHg4NiBmaWxlIGRpZG4ndCBsaXZlIGluIHRoZQo+PiBib290LyBzdWJkaXJlY3Rvcnk7IGlu
IHRoZSBlbmQgaXQgbWlnaHQgZXZlbiBiZSBwb3NzaWJsZSB0byBoYXZlCj4+IHNvbWUgb2YgdGhl
bSBpbiB4ZW4vY29tbW9uL3Zhci5TKS4KPiAKPiBPSywgSSdsbCBtb3ZlIHRoZSB4ODYgdmFyLlMg
dG8geGVuL2FyY2gveDg2L3g4Nl82NC4gSSBjYW5ub3Qgc2hhcmUgdmFyLlMKPiBiZWNhdXNlIGFy
bTMyIGlzIHVzaW5nIGxvbmcgaW5zdGVhZCBvZiBxdWFkLgoKRXhjdXNlIG1lLCBidXQgbm8uIFRo
aXMgaXMgZXh0cmVtZWx5IGVhc3kgdG8gYWJzdHJhY3QgYXdheSAtIHNlZQp4ODYgTGludXgnZXMg
X0FTTV9QVFIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
