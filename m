From: "Shah, Amit" <aams@amazon.de>
Subject: Re: [PATCH 2/2] xen: events: free irqs in error
	condition
Date: Tue, 27 Feb 2018 15:46:00 +0000
Message-ID: <1519746360.4965.21.camel__29254.5204087675$1519746318$gmane$org@amazon.com>
References: <1519666595-41362-1-git-send-email-aams@amazon.com>
 <1519666595-41362-3-git-send-email-aams@amazon.com>
 <20180226181439.zbdtzbv7wifjst2l@MacBook-Pro-de-Roger.local>
 <1519671423.4965.11.camel@amazon.com>
 <20180227081421.i2x3vcw6imrreshv@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gitk=fv=amazon.de=prvs=58946e527=aams@srs-us1.protection.inumbo.net>)
 id 1eqhSH-0007xn-9t
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 15:46:13 +0000
In-Reply-To: <20180227081421.i2x3vcw6imrreshv@MacBook-Pro-de-Roger.local>
Content-Language: en-US
Content-ID: <A9B6C1F184DC7B4DAFB477ECDA389351@amazon.com>
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

DQoNCk9uIERpLCAyMDE4LTAyLTI3IGF0IDA4OjE0ICswMDAwLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOg0KPiBPbiBNb24sIEZlYiAyNiwgMjAxOCBhdCAwNjo1NzowM1BNICswMDAwLCBTaGFoLCBB
bWl0IHdyb3RlOg0KPiA+IA0KPiA+IA0KPiA+IE9uIE1vLCAyMDE4LTAyLTI2IGF0IDE4OjE0ICsw
MDAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBPbiBNb24sIEZlYiAy
NiwgMjAxOCBhdCAwNTozNjozNVBNICswMDAwLCBBbWl0IFNoYWggd3JvdGU6DQo+ID4gPiA+IA0K
PiA+ID4gPiANCj4gPiA+ID4gSW4gY2FzZSBvZiBlcnJvcnMgaW4gaXJxIHNldHVwIGZvciBNU0ks
IGZyZWUgdXAgdGhlIGFsbG9jYXRlZA0KPiA+ID4gPiBpcnFzLg0KPiA+ID4gPiANCj4gPiA+ID4g
Rml4ZXM6IDQ4OTJjOWI0YWRhOWY5ICgieGVuOiBhZGQgc3VwcG9ydCBmb3IgTVNJIG1lc3NhZ2UN
Cj4gPiA+ID4gZ3JvdXBzIikNCj4gPiA+ID4gUmVwb3J0ZWQtYnk6IEhvb21hbiBNaXJoYWRpIDxt
aXJoYWRpaEBhbWF6b24uY29tPg0KPiA+ID4gPiBDQzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+
DQo+ID4gPiA+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4g
PiA+ID4gQ0M6IERhdmlkIFZyYWJlbCA8ZGF2aWQudnJhYmVsQGNpdHJpeC5jb20+DQo+ID4gPiA+
IENDOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPg0KPiA+ID4g
PiBDQzogRWR1YXJkbyBWYWxlbnRpbiA8ZWR1dmFsQGFtYXpvbi5jb20+DQo+ID4gPiA+IENDOiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+ID4gPiA+IENDOiBUaG9tYXMgR2xlaXhu
ZXIgPHRnbHhAbGludXRyb25peC5kZT4NCj4gPiA+ID4gQ0M6ICJLLiBZLiBTcmluaXZhc2FuIiA8
a3lzQG1pY3Jvc29mdC5jb20+DQo+ID4gPiA+IENDOiBMaXUgU2h1byA8c2h1by5hLmxpdUBpbnRl
bC5jb20+DQo+ID4gPiA+IENDOiBBbm9vYiBTb21hbiA8YW5vb2Iuc29tYW5AY2l0cml4LmNvbT4N
Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW1pdCBTaGFoIDxhYW1zQGFtYXpvbi5jb20+DQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIHwgMSAr
DQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4gPiA+IA0KPiA+
ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMNCj4gPiA+
ID4gYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2UuYw0KPiA+ID4gPiBpbmRleCBiNmI4
YjI5Li45NmFhNTc1IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL3hlbi9ldmVudHMvZXZl
bnRzX2Jhc2UuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL3hlbi9ldmVudHMvZXZlbnRzX2Jhc2Uu
Yw0KPiA+ID4gPiBAQCAtNzU4LDYgKzc1OCw3IEBAIGludCB4ZW5fYmluZF9waXJxX21zaV90b19p
cnEoc3RydWN0IHBjaV9kZXYNCj4gPiA+ID4gKmRldiwgc3RydWN0IG1zaV9kZXNjICptc2lkZXNj
LA0KPiA+ID4gPiDCoGVycm9yX2lycToNCj4gPiA+ID4gwqAJZm9yICg7IGkgPj0gMDsgaS0tKQ0K
PiA+ID4gPiDCoAkJX191bmJpbmRfZnJvbV9pcnEoaXJxICsgaSk7DQo+ID4gPiA+ICsJeGVuX2Zy
ZWVfaXJxKGlycSk7DQo+ID4gPiBIbSwgeGVuX2ZyZWVfaXJxIGNhbGxzIGlycV9mcmVlX2Rlc2Ms
IHdoaWNoIGlzDQo+ID4gPiBpcnFfZnJlZV9kZXNjcyhpcnEsDQo+ID4gPiAxKSwNCj4gPiBFci4u
LiDCoHJpZ2h0Lg0KPiA+IA0KPiA+ID4gDQo+ID4gPiBJIHRoaW5rIHlvdSB3aWxsIGhhdmUgdG8g
aW50cm9kdWNlIGEgbmV3IGZyZWUgZnVuY3Rpb246DQo+ID4gPiANCj4gPiA+IHhlbl9mcmVlX2ly
cXModW5zaWduZWQgaXJxLCB1bnNpZ25lZCBpbnQgbnIpDQo+ID4gPiANCj4gPiA+IFRoYXQgY2Fs
bHMgaXJxX2ZyZWVfZGVzY3MoaXJxLCBucikNCj4gPiBBY3R1YWxseSwgeGVuX2ZyZWVfaXJxKCkg
aXMgYWxyZWFkeSBkb25lIGluIF9fdW5iaW5kX2Zyb21faXJxKCksIHNvDQo+ID4gdGhpcyBwYXRj
aCBpcyBhY3R1YWxseSB3cm9uZyBhbmQgbm90IG5lZWRlZC4NCj4gWW91IHN0aWxsIG5lZWQgdG8g
ZnJlZSB1bmJvdW5kIElSUXMsIEFGQUlDVCB5b3UgY291bGQgZml4IHRoZSBpc3N1ZQ0KPiB3aXRo
IGEgc2luZ2xlIHBhdGNoLCBsaWtlOg0KPiANCj4gd2hpbGUgKG52ZWMtLSkgew0KPiAJaWYgKG52
ZWMgPj0gaSkNCj4gCQl4ZW5fZnJlZV9pcnEoaXJxICsgaSk7DQo+IAllbHNlDQo+IAkJX191bmJp
bmRfZnJvbV9pcnEoaXJxICsgaSk7DQo+IH0NCg0KQWdyZWVkLg0KDQpIb3dldmVyLCBzaW5jZSB0
aGVzZSBhcmUgdHdvIGRpZmZlcmVudCB0aGluZ3MsIEknZCBzdGlsbCBsaWtlIHRvDQpzZXBhcmF0
ZSBvdXQgaW50byB0d28gcGF0Y2hlcywgYW5kIHR3byBwYXRocyBzbyBpdCdzIGVhc2llciB0byBz
ZWUNCndoYXQncyBiZWluZyBkb25lLg0KDQpTZW5kaW5nIHYyIGluIGEgYml0Lg0KDQrCoCDCoCBB
bWl0DQoNCg0KQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKQmVybGluIC0g
RHJlc2RlbiAtIEFhY2hlbgptYWluIG9mZmljZTogS3JhdXNlbnN0ci4gMzgsIDEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJlcjogRHIuIFJhbGYgSGVyYnJpY2gsIENocmlzdGlhbiBTY2hsYWVn
ZXIKVXN0LUlEOiBERTI4OTIzNzg3OQpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90
dGVuYnVyZyBIUkIgMTQ5MTczIEIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
