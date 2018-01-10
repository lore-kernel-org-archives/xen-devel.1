From: Sergey Dyasli <sergey.dyasli@citrix.com>
Subject: Re: [PATCH RFC v1 57/74] x86/pv-shim: shadow PV
 console's page for L2 DomU
Date: Wed, 10 Jan 2018 16:56:10 +0000
Message-ID: <1515603370.3383.1.camel@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-58-wei.liu2@citrix.com>
 <5A5495BD020000780019C96B@prv-mh.provo.novell.com>
 <1515512623.4118.3.camel@citrix.com>
 <5A54FBA4020000780019CD44@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=w9vf=ef=citrix.com=prvs=541333253=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1eZJfv-000278-91
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 16:56:27 +0000
In-Reply-To: <5A54FBA4020000780019CD44@prv-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <215EBB7B2E092B469E8EC598D88C68DB@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "JBeulich@suse.com" <JBeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMDE4LTAxLTA5IGF0IDA5OjI4IC0wNzAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
PiA+ID4gT24gMDkuMDEuMTggYXQgMTY6NDMsIDxzZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+IHdy
b3RlOg0KPiA+IA0KPiA+IE9uIFR1ZSwgMjAxOC0wMS0wOSBhdCAwMjoxMyAtMDcwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6DQo+ID4gPiA+ID4gPiBPbiAwNC4wMS4xOCBhdCAxNDowNiwgPHdlaS5saXUy
QGNpdHJpeC5jb20+IHdyb3RlOg0KPiA+ID4gPiANCj4gPiA+ID4gK3NpemVfdCBjb25zb2xlZF9n
dWVzdF9yeCh2b2lkKQ0KPiA+ID4gPiArew0KPiA+ID4gPiArICAgIHNpemVfdCByZWN2ID0gMCwg
aWR4ID0gMDsNCj4gPiA+ID4gKyAgICBYRU5DT05TX1JJTkdfSURYIGNvbnMsIHByb2Q7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKyAgICBpZiAoICFjb25zX3JpbmcgKQ0KPiA+ID4gPiArICAgICAgICBy
ZXR1cm4gMDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgIHNwaW5fbG9jaygmcnhfbG9jayk7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKyAgICBjb25zID0gY29uc19yaW5nLT5vdXRfY29uczsNCj4gPiA+
ID4gKyAgICBwcm9kID0gQUNDRVNTX09OQ0UoY29uc19yaW5nLT5vdXRfcHJvZCk7DQo+ID4gPiA+
ICsgICAgQVNTRVJUKChwcm9kIC0gY29ucykgPD0gc2l6ZW9mKGNvbnNfcmluZy0+b3V0KSk7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKyAgICAvKiBJcyB0aGUgcmluZyBlbXB0eT8gKi8NCj4gPiA+ID4g
KyAgICBpZiAoIGNvbnMgPT0gcHJvZCApDQo+ID4gPiA+ICsgICAgICAgIGdvdG8gb3V0Ow0KPiA+
ID4gPiArDQo+ID4gPiA+ICsgICAgLyogVXBkYXRlIHBvaW50ZXJzIGJlZm9yZSBhY2Nlc3Npbmcg
dGhlIHJpbmcgKi8NCj4gPiA+ID4gKyAgICBzbXBfcm1iKCk7DQo+ID4gPiANCj4gPiA+IEkgdGhp
bmsgdGhpcyBuZWVkIHRvIG1vdmUgdXAgYWhlYWQgb2YgdGhlIGlmKCkuIEluIHRoZSBjb21tZW50
DQo+ID4gPiBwZXJoYXBzIHMvVXBkYXRlL0xhdGNoLz8NCj4gPiANCj4gPiBUaGUgcmVhZC93cml0
ZSBtZW1vcnkgYmFycmllcnMgaGVyZSBhcmUgYmV0d2VlbiByZWFkL3dyaXRlIGFjY2Vzc2VzIHRv
DQo+ID4gcmluZy0+b3V0X3Byb2QgYW5kIHJpbmctPm91dCBhcnJheS4gU28gdGhlcmUgaXMgbm8g
bmVlZCB0byBtb3ZlIHRoZW0uDQo+ID4gKHRoZSBzYW1lIGdvZXMgZm9yIHRoZSBpbnB1dCByaW5n
KQ0KPiANCj4gQW5kIHRoZXJlIGlzIG5vIG11bHRpcGxlLXJlYWQgaXNzdWUgaGVyZT8NCg0KQXMg
QW5kcmV3IGhhcyBraW5kbHkgZXhwbGFpbmVkIHRvIG1lLCB0aGVyZSBpcyBhbiBpc3N1ZSBpbmRl
ZWQuDQpTbyBJIG1vdmVkIHNtcF9ybWIoKSB0byBiZSByaWdodCBhZnRlciBjb25zIGFuZCBwcm9k
IHJlYWQsIGFuZCB1cGRhdGVkDQp0aGUgY29tbWVudCB0byBzYXk6DQoNCiJMYXRjaCBwb2ludGVy
cyBiZWZvcmUgYWNjZXNzaW5nIHRoZSByaW5nLiBJbmNsdWRlZCBjb21waWxlciBiYXJyaWVyIGFs
c28NCmVuc3VyZXMgdGhhdCBwb2ludGVycyBhcmUgcmVhbGx5IHJlYWQgb25seSBvbmNlIGludG8g
bG9jYWwgdmFyaWFibGVzLiINCg0KLS0gDQpUaGFua3MsDQpTZXJnZXkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
