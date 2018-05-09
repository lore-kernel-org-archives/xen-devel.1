From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 07/10] xen/arm: Release maintenance
 interrupt when CPU is hot-unplugged
Date: Wed, 9 May 2018 12:01:14 +0100
Message-ID: <9c07b486-96ed-8867-e6ea-8ba77e3dda41@arm.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAKPH-NiN6BT3RYLt55fHGNBEMLCX08UnvQNpaK5J0U1A_E-RXQ@mail.gmail.com>
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

CgpPbiAwOS8wNS8xOCAxMToxMCwgTWlyZWxhIFNpbW9ub3ZpYyB3cm90ZToKPiBPbiBGcmksIEFw
ciAyNywgMjAxOCBhdCA1OjEyIFBNLCBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PiB3cm90ZToKPj4gT24gMjcvMDQvMTggMTU6MzgsIE1pcmVsYSBTaW1vbm92aWMgd3JvdGU6Cj4+
PiBPbiBGcmksIEFwciAyNywgMjAxOCBhdCA0OjE1IFBNLCBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9y
Zz4gd3JvdGU6Cj4+Pj4gQXQgMTA6MjggKzAxMDAgb24gMjcgQXByICgxNTI0ODI0OTA2KSwgSnVs
aWVuIEdyYWxsIHdyb3RlOgo+Pj4+PiBPbiAyNi8wNC8xOCAxNToyMywgVGltIERlZWdhbiB3cm90
ZToKPj4+Pj4+IEF0IDExOjA4ICswMTAwIG9uIDI2IEFwciAoMTUyNDc0MDkyMSksIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+Pj4+Pj4+Pj4gT24gMjAvMDQvMTggMTM6MjUsIE1pcmVsYSBTaW1vbm92
aWMgd3JvdGU6Cj4+IFdoaWxlIEkgZ3Vlc3MgdGhpcyBjb2RlIG1ha2VzIG5vIGhhcm0sIGl0IGRv
ZXMgbm90IGRvIHdoYXQgaXMgZXhwZWN0ZWQgKGkuZQo+PiBkcmFpbmluZyB0aGUgaW50ZXJydXB0
KS4gSSBjYW4ndCBzZWUgYW55IHJlYXNvbiB0byBrZWVwIHdyb25nIGNvZGUsIHdlCj4+IHNob3Vs
ZCByZWFsbHkgYWltIHRvIGhhdmUgY29kZSB0aGF0IG1hdGNoIHRoZSBhcmNoaXRlY3R1cmUuIEFu
ZCBiZXR0ZXIgdG8KPj4gZml4IGl0IHdoZW4gd2UgZGlzY292ZXIgdGhlIHByb2JsZW0gcmF0aGVy
IHRoYW4gd2FpdGluZyB1bnRpbCB3ZQo+PiByZWRpc2NvdmVyZWQgaXQgbGF0ZXIuCj4+Cj4+IFNv
IGF0IGxlYXN0IGEgcGF0Y2ggdG8gdXBkYXRlIHRoZSBjb2RlL2NvbW1lbnQgc2hvdWxkIGJlIGRv
bmUuCj4+Cj4gCj4gSSBkb24ndCBmZWVsIGNvbWZvcnRhYmxlIHJlbW92aW5nIHRoZXNlIDMgbGlu
ZXMgYmVjYXVzZSBJIGhhdmUgbm8gd2F5Cj4gdG8gdGVzdCBhbmQgZ3VhcmFudGVlIHRoYXQgdGhl
IGNoYW5nZSB3aWxsIG5vdCBpbnRyb2R1Y2UgYW55IGlzc3Vlcy4KClRoZSB3b3JrIHlvdSBhcmUg
ZG9pbmcgKHN1c3BlbmQvcmVzdW1lLCBob3RwbHVnKSBpcyBub3QgZWFzeSB0byB0ZXN0IGFuZCAK
dmVyeSBzdWJ0bGUgdG8gZ2V0IGl0IHJpZ2h0LiBUZXN0aW5nIGNhbiBvbmx5IHVuY292ZXIgb2J2
aW91cyBidWcgb24gCnlvdXIgcGxhdGZvcm0uIElNSE8sIHdlIGNhbiBvbmx5IHJlbHkgb24gdGhl
IHNwZWNpZmljYXRpb25zIChBUk0gQVJNLCAKUFNDSS4uLikgYW5kIGV4dGVuc2l2ZSByZXZpZXcg
b2YgdGhlIHNlcmllcyAoYW5kIHRoZSBjb2RlIGFyb3VuZCkuCgo+IEhvd2V2ZXIsIGlmIGRlc3Bp
dGUgYWxsIHlvdSByZWFsbHkgd2FudCBtZSB0byByZW1vdmUgdGhlc2UgbGluZXMKPiB3aXRoaW4g
dGhpcyBzZXJpZXMgSSBkb24ndCBoYXZlIGEgcHJvYmxlbSBkb2luZyB0aGF0IGluIGEgc2VwYXJh
dGUKPiBwYXRjaC4gUGxlYXNlIGp1c3QgY29uZmlybSB0aGUgcGxhbi4KCkkgYW0gcXVpdGUgY29u
ZmlkZW50IHRoYXQgdGhpcyBjb2RlIHNob3VsZCBub3QgYmUgdGhlcmUgb3IgYXQgbGVhc3Qgbm90
IAppbiBpdHMgY3VycmVudCBmb3JtLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
