From: Hans van Kranenburg <Hans.van.Kranenburg@mendix.com>
Subject: Re: Live migrate with Linux >= 4.13 domU causes kernel
 time jumps and TCP connection stalls.
Date: Mon, 7 Jan 2019 12:56:00 +0000
Message-ID: <773ad168-2749-bd92-1e5d-d6f4db28b22a@mendix.com>
References: <a997e509-2ee1-54a5-a263-9363224e0819@mendix.com>
 <e13e39ff-44c6-e734-56c2-db8c409c8987@knorrie.org>
 <3dc190b9-4f25-6f72-4fb7-94a8ea0ed784@knorrie.org>
 <33394b54-fe5c-0980-9325-f451549f4d73@suse.com>
 <6f02cbbd-9245-be5e-3ca8-ce8390ac371e@knorrie.org>
 <516b54d9-da94-a3c4-9404-4461c12ace76@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L+5s=PP=mendix.com=hans.van.kranenburg@srs-us1.protection.inumbo.net>)
 id 1ggURp-0001Ix-Me
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 12:56:05 +0000
In-Reply-To: <516b54d9-da94-a3c4-9404-4461c12ace76@suse.com>
Content-Language: en-US
Content-ID: <14FF9C7A6FDCC044B5A25D358EC0A6AD@eurprd06.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Igor Yurchenko <Igor.Yurchenko@mendix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMS83LzE5IDE6MDQgUE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDI4LzEyLzIwMTgg
MTU6NDEsIEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6DQo+PiBPbiAxMi8yOC8xOCAxMToxNSBB
TSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+DQo+PiBbLi4uXQ0KPj4gU28gdGhhdCBleHBsYWlu
cyB0aGUgMTg0NDY3NDI4OTEuODc0MTQwIG51bWJlciwgd2hpY2gganVzdCBjb3JyZXNwb25kcw0K
Pj4gdG8gc29tZXRoaW5nIG5lYXIgdG8gJ21pbnVzIDIzIG1pbnV0ZXMnLg0KPiANCj4gSSBoYXZl
IGEgbG9jYWwgcmVwcm9kdWNlciBmb3IgdGhlIGlzc3VlIG5vdzogaW5zdGVhZCBvZiB1c2luZyBs
aXZlDQo+IG1pZ3JhdGlvbiBJJ20ganVzdCBkb2luZyBhICJ4bCBzYXZlIiBhZnRlciB0aGUgZ3Vl
c3QgcnVubmluZyBmb3Igc29tZQ0KPiBtaW51dGVzLiBUaGUgSSByZWJvb3QgdGhlIGhvc3QgYW5k
IGRvIGEgInhsIHJlc3RvcmUiIGFzIHNvb24gYXMNCj4gcG9zc2libGUuDQo+IA0KPiBBbm90aGVy
IG5vdGU6IEhWTSBkb21haW5zIChhbmQgcHJvYmFibHkgUFZILCB0b28pIHNob3cgdGhlIGh1Z2Ug
dGltZQ0KPiBpbmZvICgiWzE4NDQ2NzQyOTM3LjU4MzUzN10gLi4uIiksIHdoaWxlIFBWIGRvbWFp
bnMgc2VlbSB0byBzaG93IGp1c3QNCj4gYSBzbWFsbCBqdW1wIGJhY2t3YXJkcyBpbiB0aW1lOg0K
PiANCj4gWyAgMjI0LjcxOTMxNl0gRnJlZXppbmcgdXNlciBzcGFjZSBwcm9jZXNzZXMgLi4uIChl
bGFwc2VkIDAuMDAxIHNlY29uZHMpDQo+IGRvbmUuDQo+IFsgIDIyNC43MjA0NDNdIE9PTSBraWxs
ZXIgZGlzYWJsZWQuDQo+IFsgIDIyNC43MjA0NDhdIEZyZWV6aW5nIHJlbWFpbmluZyBmcmVlemFi
bGUgdGFza3MgLi4uIChlbGFwc2VkIDAuMDAxDQo+IHNlY29uZHMpIGRvbmUuDQo+IFsgIDIyNC43
MjE2NzhdIFBNOiBmcmVlemUgb2YgZGV2aWNlcyBjb21wbGV0ZSBhZnRlciAwLjEwNyBtc2Vjcw0K
PiBbICAyMjQuNzIxNjg3XSBzdXNwZW5kaW5nIHhlbnN0b3JlLi4uDQo+IFsgIDIyNC43MjE3MjZd
IFBNOiBsYXRlIGZyZWV6ZSBvZiBkZXZpY2VzIGNvbXBsZXRlIGFmdGVyIDAuMDM3IG1zZWNzDQo+
IFsgIDIyNC43MzYwNjJdIFBNOiBub2lycSBmcmVlemUgb2YgZGV2aWNlcyBjb21wbGV0ZSBhZnRl
ciAxNC4zMjUgbXNlY3MNCj4gWyAgMjI0LjczNjE1NV0geGVuOmdyYW50X3RhYmxlOiBHcmFudCB0
YWJsZXMgdXNpbmcgdmVyc2lvbiAxIGxheW91dA0KPiBbICAgIDQuNDA0MDI2XSBTdXNwZW5kZWQg
Zm9yIDE4Ny4yMTkgc2Vjb25kcw0KDQpBbmQgaWYgeW91IGNhdXNlIGEgdGltZSBkaWZmZXJlbmNl
IHRoYXQgbGV0cyBpdCBnbyBkb3duIGJlbG93IHplcm8/DQoNCkkgY2FuIGp1c3QgYXMgZWFzaWx5
IHJlcHJvZHVjZSB3aXRoIFBWLCBhbmQgZG9uJ3Qgc2VlIG11Y2ggZGlmZmVyZW5jZSBpbg0KYmVo
YXZpb3Igd2l0aCBQVkguIEFjdHVhbGx5LCBhbGwgdGhlIGJpc2VjdCBzdGVwcyB0byBmaW5kIGl0
IHdlcmUgZG9uZQ0KdXNpbmcgUFYuDQoNCkkgaGF2ZW4ndCB0cmllZCBIVk0sIHNpbmNlIEknbSBu
b3QgdXNpbmcgdGhhdCBhdCBhbGwuDQoNCkhhbnMNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
