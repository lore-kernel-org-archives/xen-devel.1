From: Manuel Bouyer <bouyer@antioche.eu.org>
Subject: Re: 4.11.0 RC1 panic
Date: Wed, 25 Apr 2018 12:42:42 +0200
Message-ID: <20180425104242.GA24012@mail.soc.lip6.fr>
References: <20180424160631.GA7526@mail.soc.lip6.fr>
 <5AE0272702000078001BE3B3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5zwe=ho=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1fBHst-0000AM-9T
 for xen-devel@lists.xenproject.org; Wed, 25 Apr 2018 10:42:47 +0000
Content-Disposition: inline
In-Reply-To: <5AE0272702000078001BE3B3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, julien.grall@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMjUsIDIwMTggYXQgMTI6NTg6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI0LjA0LjE4IGF0IDE4OjA2LCA8Ym91eWVyQGFudGlvY2hlLmV1Lm9yZz4g
d3JvdGU6Cj4gPiBIZWxsbywKPiA+IEkgdGVzdGVkIHhlbiA0LjExLjAgcmMxIHdpdGggTmV0QlNE
IGFzIGRvbTAuCj4gPiBJIGNvdWxkIGJvb3QgYSBOZXRCU0QgUFYgZG9tVSB3aXRob3V0IHByb2Js
ZW0sIGJ1dCBhdCBzaHV0ZG93biB0aW1lIAo+ID4gKHBvd2Vyb2ZmCj4gPiBpbiB0aGUgZG9tVSks
IEkgZ290IGEgWGVuIHBhbmljOgo+ID4gKFhFTikgQXNzZXJ0aW9uICdjcHUgPCBucl9jcHVfaWRz
JyBmYWlsZWQgYXQgCj4gPiAuLi4xL3dvcmsveGVuLTQuMTEuMC1yYzEveGVuL2luY2x1ZGUveGVu
L2NwdW1hc2suaDo5Nwo+ID4gCj4gPiBBIHhsIGRlc3Ryb3kgaW5zdGVhZCBvZiBwb3dlcm9mZiBn
aXZlcyB0aGUgc2FtZSByZXN1bHQuCj4gPiAKPiA+IFRoaXMgaGFwcGVucyB3aXRoIGJvdGggMzJi
aXRzUEFFIGFuZCA2NGJpdHMgZG9tVS4gVGhpcyBkb2Vucyd0IHNlZW0gdG8KPiA+IGhhcHBlbiB3
aXRoIEhWTSBkb21Vcy4KPiA+IAo+ID4gQXR0YWNoZWQgYXJlIGEgY3V0LW4tcGFzdGUgb2YgdGhl
IHBhbmljLCBhbmQgdGhlIG91dHB1dCBvZiB4bCBkZW1zZy4KPiAKPiBXaXRob3V0IGxpbmUgbnVt
YmVycyBhc3NvY2lhdGVkIHdpdGggYXQgbGVhc3QgdGhlIHRvcCBzdGFjayB0cmFjZSBlbnRyeQo+
IEkgY2FuIG9ubHkgZ3Vlc3Mgd2hhdCBpdCBtaWdodCBiZSAtIGNvdWxkIHlvdSBnaXZlIHRoZSBw
YXRjaCBiZWxvdyBhIHRyeT8KPiAoVGhpcyBtYXkgbm90IGJlIHRoZSBmaW5hbCBwYXRjaCwgYXMg
SSdtIGFmcmFpZCB0aGVyZSBtYXkgYmUgc29tZSByYWNlCj4gaGVyZSwgYnV0IEknZCBoYXZlIHRv
IHdvcmsgdGhpcyBvdXQgbGF0ZXIuKQoKWWVzLCB0aGlzIHdvcmtzLiB0aGFua3MgIQpJJ2xsIG5v
dyBwdXQgdGhpcyB2ZXJzaW9uIG9uIHRoZSBOZXRCU0QgdGVzdGJlZCBJJ20gcnVubmluZy4KVGhp
cyBzaG91bGQgcHV0IHNvbWUgcHJlc3N1cmUgb24gaXQuCgp0aGFua3MgIQoKLS0gCk1hbnVlbCBC
b3V5ZXIgPGJvdXllckBhbnRpb2NoZS5ldS5vcmc+CiAgICAgTmV0QlNEOiAyNiBhbnMgZCdleHBl
cmllbmNlIGZlcm9udCB0b3Vqb3VycyBsYSBkaWZmZXJlbmNlCi0tCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
