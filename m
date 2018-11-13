From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH v4 2/2] xen: use SYMBOL when required
Date: Tue, 13 Nov 2018 13:17:34 +0000
Message-ID: <63844310-6f92-8ee8-e40d-8029c8ff4d72@arm.com>
References: <alpine.DEB.2.10.1811121500550.8259@sstabellini-ThinkPad-X260>
 <1542063977-24906-2-git-send-email-sstabellini@kernel.org>
 <5BEAC9F402000078001FB74F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qhar=ny=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gMYZW-0003Qb-KA
 for xen-devel@lists.xenproject.org; Tue, 13 Nov 2018 13:17:38 +0000
In-Reply-To: <5BEAC9F402000078001FB74F@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <CD3C9372683F704C9DCDEEC8FB6CA76E@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini <stefanos@xilinx.com>, nd <nd@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

DQpIaSwNCk9uIDEzLzExLzIwMTggMTI6NTYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAx
My4xMS4xOCBhdCAwMDowNiwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4gLS0t
IGEveGVuL2FyY2gveDg2L2FsdGVybmF0aXZlLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hbHRl
cm5hdGl2ZS5jDQo+PiBAQCAtMTk0LDcgKzE5NCw3IEBAIHZvaWQgaW5pdF9vcl9saXZlcGF0Y2gg
YXBwbHlfYWx0ZXJuYXRpdmVzKHN0cnVjdCBhbHRfaW5zdHIgKnN0YXJ0LA0KPj4gICAgICAgICog
U28gYmUgY2FyZWZ1bCBpZiB5b3Ugd2FudCB0byBjaGFuZ2UgdGhlIHNjYW4gb3JkZXIgdG8gYW55
IG90aGVyDQo+PiAgICAgICAgKiBvcmRlci4NCj4+ICAgICAgICAqLw0KPj4gLSAgICBmb3IgKCBh
ID0gYmFzZSA9IHN0YXJ0OyBhIDwgZW5kOyBhKysgKQ0KPj4gKyAgICBmb3IgKCBhID0gYmFzZSA9
IHN0YXJ0OyBTWU1CT0woYSkgPCBTWU1CT0woZW5kKTsgYSsrICkNCj4gDQo+IEF0IHRoaXMgcG9p
bnQgYWxsIGlzIGZpbmU6IGVuZCBpcyBhbGxvd2VkIHRvIHBvaW50IHRvIHRoZSBlbmQgb2Ygc3Rh
cnRbXS4NCg0KQnV0IGl0IGNhbiBhbHNvIHBvaW50IHRvIHNvbWV3aGVyZSBlbHNlLiBUaGUgY29t
cGlsZXIgY2Fubm90IGtub3cgaXQsIHJpZ2h0Pw0KDQo+PiBAQCAtMzMsOCArMzMsOCBAQCBzdGF0
aWMgaW50IGluaXRfcGVyY3B1X2FyZWEodW5zaWduZWQgaW50IGNwdSkNCj4+ICAgICAgIGlmICgg
KHAgPSBhbGxvY194ZW5oZWFwX3BhZ2VzKFBFUkNQVV9PUkRFUiwgMCkpID09IE5VTEwgKQ0KPj4g
ICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gICANCj4+IC0gICAgbWVtc2V0KHAsIDAsIF9f
cGVyX2NwdV9kYXRhX2VuZCAtIF9fcGVyX2NwdV9zdGFydCk7DQo+PiAtICAgIF9fcGVyX2NwdV9v
ZmZzZXRbY3B1XSA9IHAgLSBfX3Blcl9jcHVfc3RhcnQ7DQo+PiArICAgIG1lbXNldChwLCAwLCBT
WU1CT0woX19wZXJfY3B1X2RhdGFfZW5kKSAtIFNZTUJPTChfX3Blcl9jcHVfc3RhcnQpKTsNCj4+
ICsgICAgX19wZXJfY3B1X29mZnNldFtjcHVdID0gKHVuc2lnbmVkIGxvbmcpcCAtIFNZTUJPTChf
X3Blcl9jcHVfc3RhcnQpOw0KPiANCj4gQ2FuJ3QgeW91IG1ha2UgU1lNQk9MKCkgcmV0YWluIHRo
ZSBvcmlnaW5hbCB0eXBlLCBzdWNoIHRoYXQgY2FzdHMNCj4gbGlrZSB0aGlzIG9uZSBhcmVuJ3Qg
bmVlZGVkPyBBcyBzb29uIGFzIHRoZSBjb21waWxlciBkb2Vzbid0IGtub3cNCj4gYW55bW9yZSB0
aGF0IHBhcnRpY3VsYXIgZ2xvYmFscyAob3Igc3RhdGljcykgYXJlIHVzZWQsIGl0IGNhbid0IGlu
ZmVyDQo+IGFueW1vcmUgdGhhdCB0d28gcG9pbnRlcnMgY2FuJ3QgcG9zc2libHkgcG9pbnQgaW50
byB0aGUgc2FtZSBhcnJheS4NCg0KSWYgU1lNQk9MKCkga2VlcHMgdGhlIG9yaWdpbmFsIHR5cGUs
IHRoZW4geW91IHdpbGwgc3RpbGwgc3Vic3RyYWN0IDIgDQpwb2ludGVycy4gSWYgdGhlIGNvbXBp
bGVyIGNhbid0IGluZmVyIHRoZSBjYW5ub3QgcG9zc2libHkgcG9pbnQgaW50byB0aGUgDQpzYW1l
IGFycmF5LCBpdCBhbHNvIGNhbm5vdCBpbmZlciB0aGV5IHBvaW50IHRvIHRoZSBzYW1lLiBTbyB0
aGF0IHdvdWxkIA0KYmUgdW5kZWZpbmVkLCByaWdodD8NCg0KQ2hlZXJzLA0KDQotLSANCkp1bGll
biBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
