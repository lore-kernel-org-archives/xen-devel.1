From: Mirela Simonovic <mirela.simonovic@aggios.com>
Subject: Re: [PATCH v2 07/10] xen/arm: Release maintenance
 interrupt when CPU is hot-unplugged
Date: Wed, 9 May 2018 13:14:45 +0200
Message-ID: <CAKPH-NhGzza4b4wcG8Tf3FgcjOyprAa89+zhJHQ0Xh=n46aRWg@mail.gmail.com>
References: <20180420122513.27292-1-mirela.simonovic@aggios.com>
 <20180420122513.27292-8-mirela.simonovic@aggios.com>
 <a41aff24-17f1-3d63-9811-198da6a8b31f@arm.com>
 <CAKPH-Ni8ydJBwdWdDRZWKSC4dd9Ymw=U4jy6_tFejfSZEWVR5Q@mail.gmail.com>
 <59700476-d077-2d59-9738-89afe02225bc@arm.com>
 <CAKPH-NgPkLRazeMJj6Z3ubyxF=_Q8yOo+3Lp_wF_ULjeiqVvxQ@mail.gmail.com>
 <c369f9a7-e820-2dde-4d09-2668a2b80c6f@arm.com>
 <20180426142348.GB12602@deinos.phlegethon.org>
 <f819d889-cc7e-8aca-c3a9-c3679d14d9ad@arm.com>
 <20180427141526.GA9362@deinos.phlegethon.org>
 <CAKPH-NiXrL-0Fmq8Vyer0WsOuRxUA8Bk94nVYRM7RaKm9oeKnQ@mail.gmail.com>
 <1ba76bcc-f84e-51b2-f325-747900b705c0@arm.com>
 <CAKPH-NiN6BT3RYLt55fHGNBEMLCX08UnvQNpaK5J0U1A_E-RXQ@mail.gmail.com>
 <9c07b486-96ed-8867-e6ea-8ba77e3dda41@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9c07b486-96ed-8867-e6ea-8ba77e3dda41@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgSnVsaWVuLAoKT24gV2VkLCBNYXkgOSwgMjAxOCBhdCAxOjAxIFBNLCBKdWxpZW4gR3JhbGwg
PGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPgo+Cj4gT24gMDkvMDUvMTggMTE6MTAsIE1p
cmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4+Cj4+IE9uIEZyaSwgQXByIDI3LCAyMDE4IGF0IDU6MTIg
UE0sIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IHdyb3RlOgo+Pj4KPj4+
IE9uIDI3LzA0LzE4IDE1OjM4LCBNaXJlbGEgU2ltb25vdmljIHdyb3RlOgo+Pj4+Cj4+Pj4gT24g
RnJpLCBBcHIgMjcsIDIwMTggYXQgNDoxNSBQTSwgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+IHdy
b3RlOgo+Pj4+Pgo+Pj4+PiBBdCAxMDoyOCArMDEwMCBvbiAyNyBBcHIgKDE1MjQ4MjQ5MDYpLCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24gMjYvMDQvMTggMTU6MjMsIFRpbSBE
ZWVnYW4gd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+PiBBdCAxMTowOCArMDEwMCBvbiAyNiBBcHIgKDE1
MjQ3NDA5MjEpLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4g
T24gMjAvMDQvMTggMTM6MjUsIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4+Pgo+Pj4gV2hpbGUg
SSBndWVzcyB0aGlzIGNvZGUgbWFrZXMgbm8gaGFybSwgaXQgZG9lcyBub3QgZG8gd2hhdCBpcyBl
eHBlY3RlZAo+Pj4gKGkuZQo+Pj4gZHJhaW5pbmcgdGhlIGludGVycnVwdCkuIEkgY2FuJ3Qgc2Vl
IGFueSByZWFzb24gdG8ga2VlcCB3cm9uZyBjb2RlLCB3ZQo+Pj4gc2hvdWxkIHJlYWxseSBhaW0g
dG8gaGF2ZSBjb2RlIHRoYXQgbWF0Y2ggdGhlIGFyY2hpdGVjdHVyZS4gQW5kIGJldHRlciB0bwo+
Pj4gZml4IGl0IHdoZW4gd2UgZGlzY292ZXIgdGhlIHByb2JsZW0gcmF0aGVyIHRoYW4gd2FpdGlu
ZyB1bnRpbCB3ZQo+Pj4gcmVkaXNjb3ZlcmVkIGl0IGxhdGVyLgo+Pj4KPj4+IFNvIGF0IGxlYXN0
IGEgcGF0Y2ggdG8gdXBkYXRlIHRoZSBjb2RlL2NvbW1lbnQgc2hvdWxkIGJlIGRvbmUuCj4+Pgo+
Pgo+PiBJIGRvbid0IGZlZWwgY29tZm9ydGFibGUgcmVtb3ZpbmcgdGhlc2UgMyBsaW5lcyBiZWNh
dXNlIEkgaGF2ZSBubyB3YXkKPj4gdG8gdGVzdCBhbmQgZ3VhcmFudGVlIHRoYXQgdGhlIGNoYW5n
ZSB3aWxsIG5vdCBpbnRyb2R1Y2UgYW55IGlzc3Vlcy4KPgo+Cj4gVGhlIHdvcmsgeW91IGFyZSBk
b2luZyAoc3VzcGVuZC9yZXN1bWUsIGhvdHBsdWcpIGlzIG5vdCBlYXN5IHRvIHRlc3QgYW5kCj4g
dmVyeSBzdWJ0bGUgdG8gZ2V0IGl0IHJpZ2h0LiBUZXN0aW5nIGNhbiBvbmx5IHVuY292ZXIgb2J2
aW91cyBidWcgb24geW91cgo+IHBsYXRmb3JtLiBJTUhPLCB3ZSBjYW4gb25seSByZWx5IG9uIHRo
ZSBzcGVjaWZpY2F0aW9ucyAoQVJNIEFSTSwgUFNDSS4uLikKPiBhbmQgZXh0ZW5zaXZlIHJldmll
dyBvZiB0aGUgc2VyaWVzIChhbmQgdGhlIGNvZGUgYXJvdW5kKS4KPgo+PiBIb3dldmVyLCBpZiBk
ZXNwaXRlIGFsbCB5b3UgcmVhbGx5IHdhbnQgbWUgdG8gcmVtb3ZlIHRoZXNlIGxpbmVzCj4+IHdp
dGhpbiB0aGlzIHNlcmllcyBJIGRvbid0IGhhdmUgYSBwcm9ibGVtIGRvaW5nIHRoYXQgaW4gYSBz
ZXBhcmF0ZQo+PiBwYXRjaC4gUGxlYXNlIGp1c3QgY29uZmlybSB0aGUgcGxhbi4KPgo+Cj4gSSBh
bSBxdWl0ZSBjb25maWRlbnQgdGhhdCB0aGlzIGNvZGUgc2hvdWxkIG5vdCBiZSB0aGVyZSBvciBh
dCBsZWFzdCBub3QgaW4KPiBpdHMgY3VycmVudCBmb3JtLgo+CgpEbyB5b3Ugd2FudCBtZSB0byBp
bmNsdWRlIHRoZSByZW1vdmFsIG9mIHRoYXQgY29kZSBpbiB0aGlzIHNlcmllcyBvciBub3Q/CgpU
aGFua3MsCk1pcmVsYQoKPiBDaGVlcnMsCj4KPiAtLQo+IEp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
