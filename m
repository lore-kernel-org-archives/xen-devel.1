From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 12/23] x86: monitor.o is currently HVM
 only
Date: Wed, 29 Aug 2018 11:43:05 -0600
Message-ID: <CABfawhmG6Bg=kVNy1zdPGyRvD3yTRyFJA+n2x=bZGz=-FtE5rw@mail.gmail.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <9a48f409a1c77ec9e0a5742fc36de3e0b825b1fe.1535285866.git-series.wei.liu2@citrix.com>
 <5B84164502000078001E24B9@prv1-mh.provo.novell.com>
 <20180829164223.6tkiobnyn3b5pwd2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dg2z=lm=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1fv4VO-0002ch-67
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 17:43:46 +0000
Received: by mail-ed1-f66.google.com with SMTP id f4-v6so4563648edq.3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Aug 2018 10:43:45 -0700 (PDT)
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com.
 [74.125.82.54])
 by smtp.gmail.com with ESMTPSA id f16-v6sm1981967edq.36.2018.08.29.10.43.43
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 Aug 2018 10:43:43 -0700 (PDT)
Received: by mail-wm0-f54.google.com with SMTP id i134-v6so5069014wmf.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Aug 2018 10:43:43 -0700 (PDT)
In-Reply-To: <20180829164223.6tkiobnyn3b5pwd2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBdWcgMjksIDIwMTggYXQgMTA6NDIgQU0gV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAyNywgMjAxOCBhdCAwOToxODoyOUFNIC0wNjAw
LCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4+PiBPbiAyNi4wOC4xOCBhdCAxNDoxOSwgPHdlaS5s
aXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4gPiBUaGVyZSBoYXMgYmVlbiBwbGFuIHRvIG1ha2Ug
UFYgd29yaywgYnV0IGl0IGlzIG5vdCB5ZXQgdGhlcmUuICBQcm92aWRlCj4gPiA+IHN0dWJzIHRv
IG1ha2UgaXQgYnVpbGQgd2l0aCAhQ09ORklHX0hWTS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+ID4gLS0tCj4gPiA+ICB4ZW4vYXJj
aC94ODYvTWFrZWZpbGUgICAgICAgICB8ICAyICstCj4gPiA+ICB4ZW4vaW5jbHVkZS9hc20teDg2
L21vbml0b3IuaCB8IDE0ICsrKysrKysrKysrKysrCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE1
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQo+ID4gPiBpbmRleCA5
YjliNjNhLi40M2Y5MTg5IDEwMDY0NAo+ID4gPiAtLS0gYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUK
PiA+ID4gKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gPiA+IEBAIC00NSw3ICs0NSw3IEBA
IG9iai15ICs9IG1pY3JvY29kZV9hbWQubwo+ID4gPiAgb2JqLXkgKz0gbWljcm9jb2RlX2ludGVs
Lm8KPiA+ID4gIG9iai15ICs9IG1pY3JvY29kZS5vCj4gPiA+ICBvYmoteSArPSBtbS5vIHg4Nl82
NC9tbS5vCj4gPiA+IC1vYmoteSArPSBtb25pdG9yLm8KPiA+ID4gK29iai0kKENPTkZJR19IVk0p
ICs9IG1vbml0b3Iubwo+ID4gPiAgb2JqLXkgKz0gbXBwYXJzZS5vCj4gPiA+ICBvYmoteSArPSBu
bWkubwo+ID4gPiAgb2JqLXkgKz0gbnVtYS5vCj4gPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20teDg2L21vbml0b3IuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW9uaXRvci5oCj4gPiA+
IGluZGV4IDQ5ODg5MDMuLjA5ZjdmOGEgMTAwNjQ0Cj4gPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbW9uaXRvci5oCj4gPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbW9uaXRvci5o
Cj4gPiA+IEBAIC05OSwxMCArOTksMjQgQEAgc3RhdGljIGlubGluZSB1aW50MzJfdAo+ID4gPiBh
cmNoX21vbml0b3JfZ2V0X2NhcGFiaWxpdGllcyhzdHJ1Y3QgZG9tYWluICpkKQo+ID4gPiAgaW50
IGFyY2hfbW9uaXRvcl9kb21jdGxfZXZlbnQoc3RydWN0IGRvbWFpbiAqZCwKPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5fZG9tY3RsX21vbml0b3Jfb3AgKm1v
cCk7Cj4gPiA+Cj4gPiA+ICsjaWZkZWYgQ09ORklHX0hWTQo+ID4gPiArCj4gPiA+ICBpbnQgYXJj
aF9tb25pdG9yX2luaXRfZG9tYWluKHN0cnVjdCBkb21haW4gKmQpOwo+ID4gPgo+ID4gPiAgdm9p
ZCBhcmNoX21vbml0b3JfY2xlYW51cF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCk7Cj4gPiA+Cj4g
PiA+ICsjZWxzZQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgaW5saW5lIGludCBhcmNoX21vbml0b3Jf
aW5pdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCkKPiA+ID4gK3sKPiA+ID4gKyAgICByZXR1cm4g
MDsKPiA+ID4gK30KPiA+ID4gKwo+ID4gPiArc3RhdGljIGlubGluZSB2b2lkIGFyY2hfbW9uaXRv
cl9jbGVhbnVwX2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkKQo+ID4gPiAre30KPiA+ID4gKwo+ID4g
PiArI2VuZGlmCj4gPgo+ID4gV291bGRuJ3QgdGhlIGVudGlyZSBYRU5fRE9NQ1RMX1ZNX0VWRU5U
X09QX01PTklUT1IgY2FzZQo+ID4gaW4gdm1fZXZlbnRfZG9tY3RsKCkgdGhlbiBiZXR0ZXIgYmUg
cHV0IGluIGFuICNpZmRlZiBpbnN0ZWFkPwo+Cj4gSSBkaWRuJ3QgZG8gdGhhdCBiZWNhdXNlIHRo
YXQgd2FzIGNvbW1vbiB0byBib3RoIEFSTSBhbmQgeDg2Lgo+Cj4gQnV0IG5vdyBsb29raW5nIGF0
IHRoZSBBUk0gY291bnRlcnBhcnQsIGl0IGlzIG5vdCBzdXBwb3J0ZWQgZWl0aGVyLiBXaGVuCj4g
aXQgaXMgZXZlbnR1YWxseSBzdXBwb3J0ZWQgb24gQVJNLCBpdCB3aWxsIGJlIGxpa2VseSB0byBi
ZSBkZXBlbmRlbnQgb24KPiBDT05GSUdfSFZNIGFueXdheS4gU28gSSB0aGluayBJIGNhbiBwdXQg
WEVOX0RPTUNUTF9WTV9FVkVOVF9PUF9NT05JVE9SCj4gdW5kZXIgQ09ORklHX0hWTS4KPgoKSXQg
aXMgbm90IHRoYXQgaXQgaXMgbm90IHN1cHBvcnRlZCwgaXQgaXMgdGhhdCBpdCdzIG5vdCAoeWV0
KSBuZWVkZWQuCkkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgaWZkZWYgQ09ORklH
X0hWTSBvbmx5IGluIGNvZGUKdGhhdCdzIHJlYWNoZWQgb24geDg2IGFuZCBub3QgY29tbW9uIG9u
ZXMuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
