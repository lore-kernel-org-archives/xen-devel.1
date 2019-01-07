From: Juergen Gross <jgross@suse.com>
Subject: Re: Live migrate with Linux >= 4.13 domU causes kernel
 time jumps and TCP connection stalls.
Date: Mon, 7 Jan 2019 14:05:09 +0100
Message-ID: <8b2880be-760e-73ae-0e48-14d1054f8836@suse.com>
References: <a997e509-2ee1-54a5-a263-9363224e0819@mendix.com>
 <e13e39ff-44c6-e734-56c2-db8c409c8987@knorrie.org>
 <3dc190b9-4f25-6f72-4fb7-94a8ea0ed784@knorrie.org>
 <33394b54-fe5c-0980-9325-f451549f4d73@suse.com>
 <6f02cbbd-9245-be5e-3ca8-ce8390ac371e@knorrie.org>
 <516b54d9-da94-a3c4-9404-4461c12ace76@suse.com>
 <773ad168-2749-bd92-1e5d-d6f4db28b22a@mendix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=AFjD=PP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ggUaf-0002Al-9P
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 13:05:13 +0000
In-Reply-To: <773ad168-2749-bd92-1e5d-d6f4db28b22a@mendix.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Hans van Kranenburg <Hans.van.Kranenburg@mendix.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Igor Yurchenko <Igor.Yurchenko@mendix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOSAxMzo1NiwgSGFucyB2YW4gS3JhbmVuYnVyZyB3cm90ZToKPiBPbiAxLzcv
MTkgMTowNCBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMjgvMTIvMjAxOCAxNTo0MSwg
SGFucyB2YW4gS3JhbmVuYnVyZyB3cm90ZToKPj4+IE9uIDEyLzI4LzE4IDExOjE1IEFNLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4KPj4+IFsuLi5dCj4+PiBTbyB0aGF0IGV4cGxhaW5zIHRoZSAx
ODQ0Njc0Mjg5MS44NzQxNDAgbnVtYmVyLCB3aGljaCBqdXN0IGNvcnJlc3BvbmRzCj4+PiB0byBz
b21ldGhpbmcgbmVhciB0byAnbWludXMgMjMgbWludXRlcycuCj4+Cj4+IEkgaGF2ZSBhIGxvY2Fs
IHJlcHJvZHVjZXIgZm9yIHRoZSBpc3N1ZSBub3c6IGluc3RlYWQgb2YgdXNpbmcgbGl2ZQo+PiBt
aWdyYXRpb24gSSdtIGp1c3QgZG9pbmcgYSAieGwgc2F2ZSIgYWZ0ZXIgdGhlIGd1ZXN0IHJ1bm5p
bmcgZm9yIHNvbWUKPj4gbWludXRlcy4gVGhlIEkgcmVib290IHRoZSBob3N0IGFuZCBkbyBhICJ4
bCByZXN0b3JlIiBhcyBzb29uIGFzCj4+IHBvc3NpYmxlLgo+Pgo+PiBBbm90aGVyIG5vdGU6IEhW
TSBkb21haW5zIChhbmQgcHJvYmFibHkgUFZILCB0b28pIHNob3cgdGhlIGh1Z2UgdGltZQo+PiBp
bmZvICgiWzE4NDQ2NzQyOTM3LjU4MzUzN10gLi4uIiksIHdoaWxlIFBWIGRvbWFpbnMgc2VlbSB0
byBzaG93IGp1c3QKPj4gYSBzbWFsbCBqdW1wIGJhY2t3YXJkcyBpbiB0aW1lOgo+Pgo+PiBbICAy
MjQuNzE5MzE2XSBGcmVlemluZyB1c2VyIHNwYWNlIHByb2Nlc3NlcyAuLi4gKGVsYXBzZWQgMC4w
MDEgc2Vjb25kcykKPj4gZG9uZS4KPj4gWyAgMjI0LjcyMDQ0M10gT09NIGtpbGxlciBkaXNhYmxl
ZC4KPj4gWyAgMjI0LjcyMDQ0OF0gRnJlZXppbmcgcmVtYWluaW5nIGZyZWV6YWJsZSB0YXNrcyAu
Li4gKGVsYXBzZWQgMC4wMDEKPj4gc2Vjb25kcykgZG9uZS4KPj4gWyAgMjI0LjcyMTY3OF0gUE06
IGZyZWV6ZSBvZiBkZXZpY2VzIGNvbXBsZXRlIGFmdGVyIDAuMTA3IG1zZWNzCj4+IFsgIDIyNC43
MjE2ODddIHN1c3BlbmRpbmcgeGVuc3RvcmUuLi4KPj4gWyAgMjI0LjcyMTcyNl0gUE06IGxhdGUg
ZnJlZXplIG9mIGRldmljZXMgY29tcGxldGUgYWZ0ZXIgMC4wMzcgbXNlY3MKPj4gWyAgMjI0Ljcz
NjA2Ml0gUE06IG5vaXJxIGZyZWV6ZSBvZiBkZXZpY2VzIGNvbXBsZXRlIGFmdGVyIDE0LjMyNSBt
c2Vjcwo+PiBbICAyMjQuNzM2MTU1XSB4ZW46Z3JhbnRfdGFibGU6IEdyYW50IHRhYmxlcyB1c2lu
ZyB2ZXJzaW9uIDEgbGF5b3V0Cj4+IFsgICAgNC40MDQwMjZdIFN1c3BlbmRlZCBmb3IgMTg3LjIx
OSBzZWNvbmRzCj4gCj4gQW5kIGlmIHlvdSBjYXVzZSBhIHRpbWUgZGlmZmVyZW5jZSB0aGF0IGxl
dHMgaXQgZ28gZG93biBiZWxvdyB6ZXJvPwoKT2ggeWVzLCBvZiBjb3Vyc2UgaXQgd2lsbCBzaG93
IHRoZSBzYW1lIHN5bXB0b21zLiBTaWxseSBtZSEKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
