From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 07/10] xen/arm: Release maintenance
 interrupt when CPU is hot-unplugged
Date: Wed, 9 May 2018 12:15:12 +0100
Message-ID: <14f31734-7975-1ad9-80b4-149df61b1faf@arm.com>
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
 <CAKPH-NhGzza4b4wcG8Tf3FgcjOyprAa89+zhJHQ0Xh=n46aRWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NhGzza4b4wcG8Tf3FgcjOyprAa89+zhJHQ0Xh=n46aRWg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mirela Simonovic <mirela.simonovic@aggios.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Andre Przywara <andre.przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Tim Deegan <tim@xen.org>, Xen Devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8wNS8xOCAxMjoxNCwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPiBIaSBKdWxpZW4s
Cj4gCj4gT24gV2VkLCBNYXkgOSwgMjAxOCBhdCAxOjAxIFBNLCBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4KPj4KPj4gT24gMDkvMDUvMTggMTE6MTAsIE1pcmVs
YSBTaW1vbm92aWMgd3JvdGU6Cj4+Pgo+Pj4gT24gRnJpLCBBcHIgMjcsIDIwMTggYXQgNToxMiBQ
TSwgSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4+IHdyb3RlOgo+Pj4+Cj4+
Pj4gT24gMjcvMDQvMTggMTU6MzgsIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4+Pj4+Cj4+Pj4+
IE9uIEZyaSwgQXByIDI3LCAyMDE4IGF0IDQ6MTUgUE0sIFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3Jn
PiB3cm90ZToKPj4+Pj4+Cj4+Pj4+PiBBdCAxMDoyOCArMDEwMCBvbiAyNyBBcHIgKDE1MjQ4MjQ5
MDYpLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Pj4+Pj4KPj4+Pj4+PiBPbiAyNi8wNC8xOCAxNToy
MywgVGltIERlZWdhbiB3cm90ZToKPj4+Pj4+Pj4KPj4+Pj4+Pj4gQXQgMTE6MDggKzAxMDAgb24g
MjYgQXByICgxNTI0NzQwOTIxKSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+Pj4+Pj4+Cj4+
Pj4+Pj4+Pj4+Pj4gT24gMjAvMDQvMTggMTM6MjUsIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4+
Pj4KPj4+PiBXaGlsZSBJIGd1ZXNzIHRoaXMgY29kZSBtYWtlcyBubyBoYXJtLCBpdCBkb2VzIG5v
dCBkbyB3aGF0IGlzIGV4cGVjdGVkCj4+Pj4gKGkuZQo+Pj4+IGRyYWluaW5nIHRoZSBpbnRlcnJ1
cHQpLiBJIGNhbid0IHNlZSBhbnkgcmVhc29uIHRvIGtlZXAgd3JvbmcgY29kZSwgd2UKPj4+PiBz
aG91bGQgcmVhbGx5IGFpbSB0byBoYXZlIGNvZGUgdGhhdCBtYXRjaCB0aGUgYXJjaGl0ZWN0dXJl
LiBBbmQgYmV0dGVyIHRvCj4+Pj4gZml4IGl0IHdoZW4gd2UgZGlzY292ZXIgdGhlIHByb2JsZW0g
cmF0aGVyIHRoYW4gd2FpdGluZyB1bnRpbCB3ZQo+Pj4+IHJlZGlzY292ZXJlZCBpdCBsYXRlci4K
Pj4+Pgo+Pj4+IFNvIGF0IGxlYXN0IGEgcGF0Y2ggdG8gdXBkYXRlIHRoZSBjb2RlL2NvbW1lbnQg
c2hvdWxkIGJlIGRvbmUuCj4+Pj4KPj4+Cj4+PiBJIGRvbid0IGZlZWwgY29tZm9ydGFibGUgcmVt
b3ZpbmcgdGhlc2UgMyBsaW5lcyBiZWNhdXNlIEkgaGF2ZSBubyB3YXkKPj4+IHRvIHRlc3QgYW5k
IGd1YXJhbnRlZSB0aGF0IHRoZSBjaGFuZ2Ugd2lsbCBub3QgaW50cm9kdWNlIGFueSBpc3N1ZXMu
Cj4+Cj4+Cj4+IFRoZSB3b3JrIHlvdSBhcmUgZG9pbmcgKHN1c3BlbmQvcmVzdW1lLCBob3RwbHVn
KSBpcyBub3QgZWFzeSB0byB0ZXN0IGFuZAo+PiB2ZXJ5IHN1YnRsZSB0byBnZXQgaXQgcmlnaHQu
IFRlc3RpbmcgY2FuIG9ubHkgdW5jb3ZlciBvYnZpb3VzIGJ1ZyBvbiB5b3VyCj4+IHBsYXRmb3Jt
LiBJTUhPLCB3ZSBjYW4gb25seSByZWx5IG9uIHRoZSBzcGVjaWZpY2F0aW9ucyAoQVJNIEFSTSwg
UFNDSS4uLikKPj4gYW5kIGV4dGVuc2l2ZSByZXZpZXcgb2YgdGhlIHNlcmllcyAoYW5kIHRoZSBj
b2RlIGFyb3VuZCkuCj4+Cj4+PiBIb3dldmVyLCBpZiBkZXNwaXRlIGFsbCB5b3UgcmVhbGx5IHdh
bnQgbWUgdG8gcmVtb3ZlIHRoZXNlIGxpbmVzCj4+PiB3aXRoaW4gdGhpcyBzZXJpZXMgSSBkb24n
dCBoYXZlIGEgcHJvYmxlbSBkb2luZyB0aGF0IGluIGEgc2VwYXJhdGUKPj4+IHBhdGNoLiBQbGVh
c2UganVzdCBjb25maXJtIHRoZSBwbGFuLgo+Pgo+Pgo+PiBJIGFtIHF1aXRlIGNvbmZpZGVudCB0
aGF0IHRoaXMgY29kZSBzaG91bGQgbm90IGJlIHRoZXJlIG9yIGF0IGxlYXN0IG5vdCBpbgo+PiBp
dHMgY3VycmVudCBmb3JtLgo+Pgo+IAo+IERvIHlvdSB3YW50IG1lIHRvIGluY2x1ZGUgdGhlIHJl
bW92YWwgb2YgdGhhdCBjb2RlIGluIHRoaXMgc2VyaWVzIG9yIG5vdD8KCkl0IGlzIG5vdCBuZWNl
c3NhcnkgdG8gYmUgaW4gdGhhdCBzZXJpZXMuCgpDaGVlcnMsCgo+IAo+IFRoYW5rcywKPiBNaXJl
bGEKPiAKPj4gQ2hlZXJzLAo+Pgo+PiAtLQo+PiBKdWxpZW4gR3JhbGwKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
