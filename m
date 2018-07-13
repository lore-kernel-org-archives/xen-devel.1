From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v11 01/11] x86/cpu: Introduce
 vmce_save_vcpu_ctxt_one() func
Date: Fri, 13 Jul 2018 11:19:32 +0000
Message-ID: <1531480771.5063.14.camel@bitdefender.com>
References: <1531472650-6718-1-git-send-email-aisaila@bitdefender.com>
 <1531472650-6718-2-git-send-email-aisaila@bitdefender.com>
 <5B487F1802000078001D3C13@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B487F1802000078001D3C13@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <7697732AB62A644087557732013E9406@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "JBeulich@suse.com" <JBeulich@suse.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "paul.durrant@citrix.com" <paul.durrant@citrix.com>, "Ian.Jackson@eu.citrix.com" <Ian.Jackson@eu.citrix.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVmksIDIwMTgtMDctMTMgYXQgMDQ6MjkgLTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiA+
IA0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBPbiAxMy4wNy4xOCBhdCAxMTowNCwgPGFpc2Fp
bGFAYml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4gPiBDaGFuZ2VzIHNpbmNlIFYxMDoNCj4gPiAJ
LSBBZGQgbWVtc2V0IHRvIDAgZm9yIGN0eHQuDQo+IFdoeT8gV2hhdCdzIHdyb25nIHdpdGggLi4u
DQo+IA0KPiA+IA0KPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL3ZtY2UuYw0KPiA+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbWNoZWNrL3ZtY2UuYw0KPiA+IEBAIC0zNDksNiArMzQ5
LDIwIEBAIGludCB2bWNlX3dybXNyKHVpbnQzMl90IG1zciwgdWludDY0X3QgdmFsKQ0KPiA+IMKg
wqDCoMKgwqByZXR1cm4gcmV0Ow0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gK3N0YXRpYyBpbnQgdm1j
ZV9zYXZlX3ZjcHVfY3R4dF9vbmUoc3RydWN0IHZjcHUgKnYsDQo+ID4gaHZtX2RvbWFpbl9jb250
ZXh0X3QgKmgpDQo+ID4gKyB7DQo+ID4gK8KgwqDCoMKgc3RydWN0IGh2bV92bWNlX3ZjcHUgY3R4
dDsNCj4gPiArDQo+ID4gK8KgwqDCoMKgbWVtc2V0KCZjdHh0LCAwLCBzaXplb2YoY3R4dCkpOw0K
PiDCoMKgwqDCoHN0cnVjdCBodm1fdm1jZV92Y3B1IGN0eHQgPSB7fTsNCj4gDQo+IGluc3RlYWQ/
IE9yIGV2ZW4gcHVsbGluZyBhbGwgb2YgdGhpcyAuLi4NCj4gDQo+ID4gDQo+ID4gK8KgwqDCoMKg
Y3R4dC5jYXBzID0gdi0+YXJjaC52bWNlLm1jZ19jYXA7DQo+ID4gK8KgwqDCoMKgY3R4dC5tY2lf
Y3RsMl9iYW5rMCA9IHYtPmFyY2gudm1jZS5iYW5rWzBdLm1jaV9jdGwyOw0KPiA+ICvCoMKgwqDC
oGN0eHQubWNpX2N0bDJfYmFuazEgPSB2LT5hcmNoLnZtY2UuYmFua1sxXS5tY2lfY3RsMjsNCj4g
PiArwqDCoMKgwqBjdHh0Lm1jZ19leHRfY3RsID0gdi0+YXJjaC52bWNlLm1jZ19leHRfY3RsOw0K
PiAuLi4gaW50byB0aGUgaW5pdGlhbGl6ZXIsIHdoaWNoIHdpbGwgbWFrZSBzdXJlIHBhZGRpbmcg
ZmllbGRzIGFyZQ0KPiB6ZXJvLg0KPiBJIGNhbiBzZWUgdGhhdCBhIG1lbXNldCgpIGlzIHdhcnJh
bnRlZCBpbiBfc29tZV8gY2FzZXMsIGJ1dCBub3QNCj4gdW5pZm9ybWx5Lg0KDQpUaGUgbWVtc2V0
IHNvbHV0aW9uIHdhcyBpbnRyb2R1Y2VkIHRvIGhhdmUgY29uc2lzdGVuY3kgd2l0aCBvdGhlcg0K
c2F2ZV9vbmUgZnVuY3MgbGlrZSBodm1fc2F2ZV9jcHVfY3R4dF9vbmUoKSzCoGh2bV9zYXZlX210
cnJfbXNyX29uZSgpLA0KYW5kIHZpcmlkaWFuX3NhdmVfdmNwdV9jdHh0X29uZSgpLiBUaGV5IGFs
bCBoYXZlIG1lbXNldCB0byAwIGZvdCB0aGUNCmN0eHQgdmFyaWFibGVzLiBTaG91bGQgSSBrZWVw
IGl0IHdpdGggbWVtc2V0IG9yIGNoYW5nZSB0aGVtIGFsbCB0byA9e30/DQoNCkFsZXgKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
