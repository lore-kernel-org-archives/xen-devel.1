From: "Shah, Amit" <aams@amazon.de>
Subject: Re: [PATCH 2/2] xen: events: free irqs in error
	condition
Date: Mon, 26 Feb 2018 18:57:03 +0000
Message-ID: <1519671423.4965.11.camel__10695.1700327501$1519671376$gmane$org@amazon.com>
References: <1519666595-41362-1-git-send-email-aams@amazon.com>
 <1519666595-41362-3-git-send-email-aams@amazon.com>
 <20180226181439.zbdtzbv7wifjst2l@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yzye=fu=amazon.de=prvs=588dd4d4c=aams@srs-us1.protection.inumbo.net>)
 id 1eqNxd-0007xY-NM
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2018 18:57:17 +0000
In-Reply-To: <20180226181439.zbdtzbv7wifjst2l@MacBook-Pro-de-Roger.local>
Content-Language: en-US
Content-ID: <69124275343F27459C35008ACEA0310B@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "roger.pau@citrix.com" <roger.pau@citrix.com>
Cc: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "anoob.soman@citrix.com" <anoob.soman@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "shuo.a.liu@intel.com" <shuo.a.liu@intel.com>, "Valentin,
 Eduardo" <eduval@lab126.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, "kys@microsoft.com" <kys@microsoft.com>, "tglx@linutronix.de" <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

DQpPbiBNbywgMjAxOC0wMi0yNiBhdCAxODoxNCArMDAwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4gT24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMDU6MzY6MzVQTSArMDAwMCwgQW1pdCBTaGFo
IHdyb3RlOg0KPiA+IA0KPiA+IEluIGNhc2Ugb2YgZXJyb3JzIGluIGlycSBzZXR1cCBmb3IgTVNJ
LCBmcmVlIHVwIHRoZSBhbGxvY2F0ZWQgaXJxcy4NCj4gPiANCj4gPiBGaXhlczogNDg5MmM5YjRh
ZGE5ZjkgKCJ4ZW46IGFkZCBzdXBwb3J0IGZvciBNU0kgbWVzc2FnZSBncm91cHMiKQ0KPiA+IFJl
cG9ydGVkLWJ5OiBIb29tYW4gTWlyaGFkaSA8bWlyaGFkaWhAYW1hem9uLmNvbT4NCj4gPiBDQzog
PHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+DQo+ID4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPg0KPiA+IENDOiBEYXZpZCBWcmFiZWwgPGRhdmlkLnZyYWJlbEBjaXRy
aXguY29tPg0KPiA+IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tPg0KPiA+IENDOiBFZHVhcmRvIFZhbGVudGluIDxlZHV2YWxAYW1hem9uLmNvbT4NCj4gPiBD
QzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiA+IENDOiBUaG9tYXMgR2xlaXhu
ZXIgPHRnbHhAbGludXRyb25peC5kZT4NCj4gPiBDQzogIksuIFkuIFNyaW5pdmFzYW4iIDxreXNA
bWljcm9zb2Z0LmNvbT4NCj4gPiBDQzogTGl1IFNodW8gPHNodW8uYS5saXVAaW50ZWwuY29tPg0K
PiA+IENDOiBBbm9vYiBTb21hbiA8YW5vb2Iuc29tYW5AY2l0cml4LmNvbT4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbWl0IFNoYWggPGFhbXNAYW1hem9uLmNvbT4NCj4gPiAtLS0NCj4gPiDCoGRyaXZl
cnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIHwgMSArDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZXZlbnRz
L2V2ZW50c19iYXNlLmMNCj4gPiBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jDQo+
ID4gaW5kZXggYjZiOGIyOS4uOTZhYTU3NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3hlbi9l
dmVudHMvZXZlbnRzX2Jhc2UuYw0KPiA+ICsrKyBiL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNf
YmFzZS5jDQo+ID4gQEAgLTc1OCw2ICs3NTgsNyBAQCBpbnQgeGVuX2JpbmRfcGlycV9tc2lfdG9f
aXJxKHN0cnVjdCBwY2lfZGV2DQo+ID4gKmRldiwgc3RydWN0IG1zaV9kZXNjICptc2lkZXNjLA0K
PiA+IMKgZXJyb3JfaXJxOg0KPiA+IMKgCWZvciAoOyBpID49IDA7IGktLSkNCj4gPiDCoAkJX191
bmJpbmRfZnJvbV9pcnEoaXJxICsgaSk7DQo+ID4gKwl4ZW5fZnJlZV9pcnEoaXJxKTsNCj4gSG0s
IHhlbl9mcmVlX2lycSBjYWxscyBpcnFfZnJlZV9kZXNjLCB3aGljaCBpcyBpcnFfZnJlZV9kZXNj
cyhpcnEsDQo+IDEpLA0KDQpFci4uLiDCoHJpZ2h0Lg0KDQo+IEkgdGhpbmsgeW91IHdpbGwgaGF2
ZSB0byBpbnRyb2R1Y2UgYSBuZXcgZnJlZSBmdW5jdGlvbjoNCj4gDQo+IHhlbl9mcmVlX2lycXMo
dW5zaWduZWQgaXJxLCB1bnNpZ25lZCBpbnQgbnIpDQo+IA0KPiBUaGF0IGNhbGxzIGlycV9mcmVl
X2Rlc2NzKGlycSwgbnIpDQoNCkFjdHVhbGx5LCB4ZW5fZnJlZV9pcnEoKSBpcyBhbHJlYWR5IGRv
bmUgaW4gX191bmJpbmRfZnJvbV9pcnEoKSwgc28NCnRoaXMgcGF0Y2ggaXMgYWN0dWFsbHkgd3Jv
bmcgYW5kIG5vdCBuZWVkZWQuDQoNCg0KCQkJCUFtaXQNCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50
ZXIgR2VybWFueSBHbWJICkJlcmxpbiAtIERyZXNkZW4gLSBBYWNoZW4KbWFpbiBvZmZpY2U6IEty
YXVzZW5zdHIuIDM4LCAxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IERyLiBSYWxmIEhl
cmJyaWNoLCBDaHJpc3RpYW4gU2NobGFlZ2VyClVzdC1JRDogREUyODkyMzc4NzkKRWluZ2V0cmFn
ZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
