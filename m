From: Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH RFC 1/7] xen: Introduce
 XEN_COMPILE_POSIX_TIME
Date: Mon, 14 May 2018 18:25:21 +0200
Message-ID: <20180514162521.GN12135@olila.local.net-space.pl>
References: <1499550803-25664-1-git-send-email-daniel.kiper@oracle.com>
 <1499550803-25664-2-git-send-email-daniel.kiper@oracle.com>
 <5AE73CB602000078001BFB0A@prv1-mh.provo.novell.com>
 <20180508121856.GG8391@olila.local.net-space.pl>
 <5AF9652A02000078001C26BF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lfwv=ib=oracle.com=daniel.kiper@srs-us1.protection.inumbo.net>)
 id 1fIGI0-0007A9-1t
 for xen-devel@lists.xenproject.org; Mon, 14 May 2018 16:25:32 +0000
Content-Disposition: inline
In-Reply-To: <5AF9652A02000078001C26BF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTQsIDIwMTggYXQgMDQ6MzA6MDJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA4LjA1LjE4IGF0IDE0OjE4LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+
IHdyb3RlOgo+ID4gT24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDk6NTY6MzhBTSAtMDYwMCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDA4LjA3LjE3IGF0IDIzOjUzLCA8ZGFuaWVsLmtp
cGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+ID4+ID4gQEAgLTE2NCw2ICsxNjUsNyBAQCBkZWxldGUt
dW5mcmVzaC1maWxlczoKPiA+PiA+ICBpbmNsdWRlL3hlbi9jb21waWxlLmg6IGluY2x1ZGUveGVu
L2NvbXBpbGUuaC5pbiAuYmFubmVyCj4gPj4gPiAgCUBzZWQgLWUgJ3MvQEBkYXRlQEAvJChYRU5f
QlVJTERfREFURSkvZycgXAo+ID4+ID4gIAkgICAgLWUgJ3MvQEB0aW1lQEAvJChYRU5fQlVJTERf
VElNRSkvZycgXAo+ID4+ID4gKwkgICAgLWUgJ3MvQEBwb3NpeF90aW1lQEAvJChYRU5fQlVJTERf
UE9TSVhfVElNRSkvZycgXAo+ID4+Cj4gPj4gSW4gb3JkZXIgdG8gZmlsbCBhIFBFIGhlYWRlciwg
ZG8geW91IHJlYWxseSBuZWVkIHRvIG1ha2UgdGhpcyBhdmFpbGFibGUgaW4KPiA+PiBjb21waWxl
Lmg/Cj4gPgo+ID4gV2h5IG5vdD8gSSB0aGluayB0aGF0IHdlIHNob3VsZCBoYXZlIGFsbCB0aW1l
IHJlbGF0ZWQgY29uc3RhbnRzIGRlZmluZWQKPiA+IGluIG9uZSBwbGFjZS4gRXZlbiBpZiBvbmUg
b2YgdGhlbSBpcyB1c2VkIGp1c3Qgb25seSBvbmNlLgo+Cj4gSSBkb24ndCB0aGluayBzbywgZndp
dywgaS5lLiBJJ2QgcHJlZmVyIHlvdSB0byBjb25zdW1lIFhFTl9CVUlMRF97REFURSxUSU1FfQo+
IGF0IHRoZSBwb2ludC9wbGFjZSB5b3Ugd2FudC9uZWVkIHRoZSB0aW1lIGluIFBPU0lYIGZvcm0u
CgpUaGF0IHdvdWxkIGJlIHBlcmZlY3QgYnV0IFRpbWVEYXRlU3RhbXAgaW4gUEUgaGVhZGVyIHJl
cXVpcmVzIHRoZSBudW1iZXIgb2YKc2Vjb25kcyBzaW5jZSB0aGUgZXBvY2guIEFuZCBYRU5fQlVJ
TERfe0RBVEUsVElNRX0gYXJlIGluIGRpZmZlcmVudCBmb3JtYXRzLgpIZW5jZSwgd2hhdCBzaG91
bGQgSSBkbyB0aGVuPwoKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
