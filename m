From: "Nuernberger, Stefan" <snu@amazon.de>
Subject: Re: [PATCH RFC 00/55] x86: use domheap page for xen
 page tables
Date: Mon, 18 Mar 2019 21:14:06 +0000
Message-ID: <1552943645.6788.93.camel@amazon.de>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tBy=RV=amazon.de=prvs=97326004b=snu@srs-us1.protection.inumbo.net>)
 id 1h5zaI-0007iM-Hb
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 21:14:14 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <33D74413278E634382450912DCBB8B48@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjQ0ICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBUaGlz
IHNlcmllcyBzd2l0Y2hlcyB4ZW4gcGFnZSB0YWJsZXMgZnJvbSB4ZW5oZWFwIHBhZ2UgdG8gZG9t
aGVhcA0KPiBwYWdlLg0KPiANCj4gVGhpcyBpcyByZXF1aXJlZCBzbyB0aGF0IHdoZW4gd2UgaW1w
bGVtZW50IHhlbmhlYXAgb24gdG9wIG9mIHZtYXANCj4gdGhlcmUgd29uJ3QNCj4gYmUgYSBsb29w
Lg0KPiANCj4gSXQgaXMgZG9uZSBpbiByb3VnaGx5IHRocmVlIHN0ZXBzOg0KPiANCj4gMS4gSW50
cm9kdWNlIGEgbmV3IHNldCBvZiBBUElzLCBpbXBsZW1lbnQgdGhlIG9sZCBBUElzIG9uIHRvcCBv
ZiB0aGUNCj4gbmV3IG9uZXMuDQo+IMKgwqDCoE5ldyBBUElzIHN0aWxsIHVzZSB4ZW5oZWFwIHBh
Z2VzLg0KPiAyLiBTd2l0Y2ggZWFjaCBzaXRlIHdoaWNoIG1hbmlwdWxhdGUgcGFnZSB0YWJsZXMg
dG8gdXNlIHRoZSBuZXcgQVBJcy4NCj4gMy4gU3dpdGNoIG5ldyBBUElzIHRvIHVzZSBkb21oZWFw
IHBhZ2UuDQo+IA0KPiBZb3UgY2FuIGZpbmQgdGhlIHNlcmllcyBhdDoNCj4gDQo+IMKgIGh0dHBz
Oi8veGVuYml0cy54ZW4ub3JnL2dpdC1odHRwL3Blb3BsZS9saXV3L3hlbi5naXQgeGVuLXB0LQ0K
PiBhbGxvY2F0aW9uLTENCj4gDQo+IFdlaS4NCj4gDQoNClRoYW5rcyBmb3Igc3RhcnRpbmcgdGhp
cyB3b3JrIFdlaS4gSSB0ZXN0ZWQgYW5kIHJldmlld2VkIG1vc3Qgb2YgdGhlDQpzZXJpZXMgYW5k
IGhhdmVuJ3QgZm91bmQgaXNzdWVzIHdpdGggdGhlIGZ1bmN0aW9uYWxpdHkgc28gZmFyLiBTZWUg
c29tZQ0KcmVtYXJrcyBvbiB0aGUgaW5kaXZpZHVhbCBwYXRjaGVzLiBJIGFtIG5vdCBmaW5pc2hl
ZCByZXZpZXdpbmcgYWxsIG9mDQppdCwgdGhvdWdoLiBTb21lIG1vcmUgcmV2aWV3aW5nIHRvIGJl
IGRvbmUgaW4gdGhlIG5leHQgZGF5cy4NCg0KLSBTdGVmYW4NCg0KCgoKQW1hem9uIERldmVsb3Bt
ZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2No
YWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDog
REUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcg
SFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
