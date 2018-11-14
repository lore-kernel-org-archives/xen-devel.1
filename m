From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH 10/18] xen/arm: Implement GIC suspend/resume
 functions (gicv2 only)
Date: Wed, 14 Nov 2018 23:50:22 +0000
Message-ID: <384421bf-3ce7-28b5-a360-a31f6e059c08@arm.com>
References: <1542022244-22977-1-git-send-email-mirela.simonovic@aggios.com>
 <1542022244-22977-11-git-send-email-mirela.simonovic@aggios.com>
 <746b0ad8-4ce1-dfaf-eadc-939657426900@arm.com>
 <ed9f3dc5-7f91-6d49-ee09-b362afcee5b0@aggios.com>
 <64d1c6ba-de67-4757-5be6-2390286eb60e@arm.com>
 <alpine.DEB.2.10.1811141410250.302@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=aca3=nz=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gN4vV-0001Vv-7f
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 23:50:29 +0000
In-Reply-To: <alpine.DEB.2.10.1811141410250.302@sstabellini-ThinkPad-X260>
Content-Language: en-US
Content-ID: <ABE439ED8A44A242A95E714ABB441473@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "dm@aggios.com" <dm@aggios.com>, "saeed.nowshadi@xilinx.com" <saeed.nowshadi@xilinx.com>, "stefano.stabellini@xilinx.com" <stefano.stabellini@xilinx.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Mirela Simonovic <mirela.simonovic@aggios.com>
List-Id: xen-devel@lists.xenproject.org

SGksDQoNCk9uIDE0LzExLzIwMTggMjI6MTgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4g
T24gV2VkLCAxNCBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gIMKgIEBAIC0x
MzE5LDYgKzEzNDEsMTI5IEBAIHN0YXRpYyB2b2lkIGdpY3YyX2RvX0xQSSh1bnNpZ25lZCBpbnQg
bHBpKQ0KPj4+Pj4gIMKgwqDCoMKgwqAgQlVHKCk7DQo+Pj4+PiAgwqAgfQ0KPj4+Pj4gIMKgICtz
dGF0aWMgdm9pZCBnaWN2Ml9hbGxvY19jb250ZXh0KHN0cnVjdCBnaWN2Ml9jb250ZXh0ICpnYykN
Cj4+Pj4+ICt7DQo+Pj4+DQo+Pj4+IElzIGl0IG5lY2Vzc2FyeSB0byBhbGxvY2F0ZSB0aGVtIGF0
IGJvb3Q/IENhbiB3ZSBtYWtlIHRoZW0gc3RhdGljIG9yDQo+Pj4+IGFsbG9jYXRlIHRoZW0gd2hl
biB3ZSBzdXNwZW5kPw0KPj4+Pg0KPj4+DQo+Pj4gV2UgbmVlZCB0byBhbGxvY2F0ZSBkeW5hbWlj
YWxseSBiZWNhdXNlIHRoZSBzaXplIG9mIGFsbG9jYXRlZCBkYXRhIGRlcGVuZHMNCj4+PiBvbiB0
aGUgbnVtYmVyIG9mIGlycSBsaW5lcywgd2hpY2ggaXMgbm90IGtub3duIGF0IHRoZSBjb21waWxl
IHRpbWUuDQo+Pg0KPj4gV2VsbCB5b3Uga25vdyB0aGUgdXBwZXIgYm91bmQuIFdoeSBjYW4ndCB5
b3UgdXNlIHRoZSB1cHBlciBib3VuZD8NCj4+DQo+Pj4gQWx0ZXJuYXRpdmUgaXMgdG8gYWxsb2Nh
dGUgb24gc3VzcGVuZCwgYnV0IEkgYmVsaWV2ZSBpdCBpcyBiZXR0ZXIgdG8gZG8gdGhpcw0KPj4+
IHdoZW4gdGhlIHN5c3RlbSBib290cy4NCj4+DQo+PiBXaHkgaXMgaXQgYmV0dGVyPw0KPiANCj4g
SSdsbCByZXBseSBoZXJlIGFsc28gdG8geW91ciBvdGhlciBwb2ludCBiZWNhdXNlIHRoZXkgYXJl
IHJlbGF0ZWQ6DQo+IA0KPj4gU3VzcGVuZC9yZXN1bWUgaXMgbm90IGEgY3JpdGljYWwgZmVhdHVy
ZSBpbiBjb21tb24gY2FzZS4gU28gSSB3b3VsZA0KPj4gcHJlZmVyIGlmIHdlIGRpc2FibGUgaXQg
d2hlbiB3ZSBjYW4ndCBhbGxvYyBtZW1vcnkuDQo+IA0KPiANCj4gSXQgaXMgdHJ1ZSB0aGF0IHN1
c3BlbmQvcmVzdW1lIGlzIG5vdCBhIGNyaXRpY2FsIGZlYXR1cmUgZm9yIHRoZSBjb21tb24NCj4g
Y2FzZSwgYnV0IHByb2NlZWRpbmcgYXMgIm5vcm1hbCIgd2hlbiBhIG1lbW9yeSBhbGxvY2F0aW9u
IGZhaWxzIGlzIG5vdCBhDQo+IGdvb2QgaWRlYTogaWYgdGhlIGh5cGVydmlzb3IgaXMgc28gbG93
IGluIG1lbW9yeSBhcyB0byBmYWlsIGluIGFuDQo+IGFsbG9jYXRpb24gbGlrZSB0aGlzIG9uZSwg
aXQgaXMgbm90IGdvaW5nIHRvIGJlIGFibGUgdG8gd29yayByaWdodC4gSW4NCj4gbm8gb3RoZXIg
Y2FzZXMgaW4gWGVuIHdlIGNvbnRpbnVlIG9uIG1lbW9yeSBhbGxvY2F0aW9uIGZhaWx1cmVzLCBl
dmVuDQo+IGZvciBsZXNzLWNyaXRpY2FsIGZlYXR1cmVzLg0KPiANCj4gSSBzdWdnZXN0IHRoYXQg
d2UgZWl0aGVyIGFsbG9jYXRlIHN0YXRpY2FsbHkgdXNpbmcgdGhlIHVwcGVyIGJvdW5kIGFzDQo+
IHlvdSBzdWdnZXN0ZWQsIGFsdGhvdWdoIGl0IGxlYWRzIHRvIHNvbWUgbWVtb3J5IGJlaW5nIHdh
c3RlZC4NCg0KV2UgYXJlIHNwZWFraW5nIG9mIGF0IG1vc3QgMktCIG9mIG1lbW9yeS4gSSBkb24n
dCB0aGluayBpdCBpcyBnb2luZyB0byANCmJlIHdhc3RlIGdpdmVuIG9mIHRoZSBudW1iZXIgb2Yg
aW50ZXJydXB0cyBHSUMgdXN1YWxseSBzdXBwb3J0cy4NCg0KVGhlIG1vcmUgdGhhdCB3ZSBhbHJl
YWR5IHN0YXRpY2FsbHkgYWxsb2NhdGUgaXJxX2Rlc2MuDQoNCkNoZWVycywNCg0KLS0gDQpKdWxp
ZW4gR3JhbGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
