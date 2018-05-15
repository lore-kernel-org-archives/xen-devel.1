From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC 1/7] xen: Introduce
 XEN_COMPILE_POSIX_TIME
Date: Tue, 15 May 2018 01:47:39 -0600
Message-ID: <5AFA909B02000078001C2BC5@prv1-mh.provo.novell.com>
References: <1499550803-25664-1-git-send-email-daniel.kiper@oracle.com>
 <1499550803-25664-2-git-send-email-daniel.kiper@oracle.com>
 <5AE73CB602000078001BFB0A@prv1-mh.provo.novell.com>
 <20180508121856.GG8391@olila.local.net-space.pl>
 <5AF9652A02000078001C26BF@prv1-mh.provo.novell.com>
 <20180514162521.GN12135@olila.local.net-space.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ecih=ic=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fIUgT-0005k0-Jo
 for xen-devel@lists.xenproject.org; Tue, 15 May 2018 07:47:45 +0000
In-Reply-To: <20180514162521.GN12135@olila.local.net-space.pl>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Daniel Kiper <daniel.kiper@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjA1LjE4IGF0IDE4OjI1LCA8ZGFuaWVsLmtpcGVyQG9yYWNsZS5jb20+IHdyb3Rl
Ogo+IE9uIE1vbiwgTWF5IDE0LCAyMDE4IGF0IDA0OjMwOjAyQU0gLTA2MDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+PiA+Pj4gT24gMDguMDUuMTggYXQgMTQ6MTgsIDxkYW5pZWwua2lwZXJAb3JhY2xl
LmNvbT4gd3JvdGU6Cj4+ID4gT24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMDk6NTY6MzhBTSAtMDYw
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+ID4+ID4+PiBPbiAwOC4wNy4xNyBhdCAyMzo1MywgPGRh
bmllbC5raXBlckBvcmFjbGUuY29tPiB3cm90ZToKPj4gPj4gPiBAQCAtMTY0LDYgKzE2NSw3IEBA
IGRlbGV0ZS11bmZyZXNoLWZpbGVzOgo+PiA+PiA+ICBpbmNsdWRlL3hlbi9jb21waWxlLmg6IGlu
Y2x1ZGUveGVuL2NvbXBpbGUuaC5pbiAuYmFubmVyCj4+ID4+ID4gIAlAc2VkIC1lICdzL0BAZGF0
ZUBALyQoWEVOX0JVSUxEX0RBVEUpL2cnIFwKPj4gPj4gPiAgCSAgICAtZSAncy9AQHRpbWVAQC8k
KFhFTl9CVUlMRF9USU1FKS9nJyBcCj4+ID4+ID4gKwkgICAgLWUgJ3MvQEBwb3NpeF90aW1lQEAv
JChYRU5fQlVJTERfUE9TSVhfVElNRSkvZycgXAo+PiA+Pgo+PiA+PiBJbiBvcmRlciB0byBmaWxs
IGEgUEUgaGVhZGVyLCBkbyB5b3UgcmVhbGx5IG5lZWQgdG8gbWFrZSB0aGlzIGF2YWlsYWJsZSBp
bgo+PiA+PiBjb21waWxlLmg/Cj4+ID4KPj4gPiBXaHkgbm90PyBJIHRoaW5rIHRoYXQgd2Ugc2hv
dWxkIGhhdmUgYWxsIHRpbWUgcmVsYXRlZCBjb25zdGFudHMgZGVmaW5lZAo+PiA+IGluIG9uZSBw
bGFjZS4gRXZlbiBpZiBvbmUgb2YgdGhlbSBpcyB1c2VkIGp1c3Qgb25seSBvbmNlLgo+Pgo+PiBJ
IGRvbid0IHRoaW5rIHNvLCBmd2l3LCBpLmUuIEknZCBwcmVmZXIgeW91IHRvIGNvbnN1bWUgWEVO
X0JVSUxEX3tEQVRFLFRJTUV9Cj4+IGF0IHRoZSBwb2ludC9wbGFjZSB5b3Ugd2FudC9uZWVkIHRo
ZSB0aW1lIGluIFBPU0lYIGZvcm0uCj4gCj4gVGhhdCB3b3VsZCBiZSBwZXJmZWN0IGJ1dCBUaW1l
RGF0ZVN0YW1wIGluIFBFIGhlYWRlciByZXF1aXJlcyB0aGUgbnVtYmVyIG9mCj4gc2Vjb25kcyBz
aW5jZSB0aGUgZXBvY2guIEFuZCBYRU5fQlVJTERfe0RBVEUsVElNRX0gYXJlIGluIGRpZmZlcmVu
dCBmb3JtYXRzLgo+IEhlbmNlLCB3aGF0IHNob3VsZCBJIGRvIHRoZW4/CgpJJ20gYWZyYWlkIEkg
ZG9uJ3QgdW5kZXJzdGFuZDogQXMgbG9uZyBhcyBYRU5fQlVJTERfe0RBVEUsVElNRX0gcHJvcGVy
bHkKcmVwcmVzZW50IHRoZSB0aW1lIHlvdSdyZSBhZnRlciBpbiBfc29tZV8gZm9ybWF0LCBzdXJl
bHkgdGhlcmUncyBhIHdheSB0bwpjb252ZXJ0IHRoZSBmb3JtYXQgdG8gInNlY29uZHMgc2luY2Ug
dGhlIGVwb2NoIj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
