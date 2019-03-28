From: "Nuernberger, Stefan" <snu@amazon.de>
Subject: Re: [PATCH RFC 00/55] x86: use domheap page for xen
 page tables
Date: Thu, 28 Mar 2019 12:52:45 +0000
Message-ID: <1553777564.20199.5.camel@amazon.de>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YSwV=R7=amazon.de=prvs=983fdc6c4=snu@srs-us1.protection.inumbo.net>)
 id 1h9UWb-0004RH-4M
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 12:52:53 +0000
In-Reply-To: <20190207164456.9260-1-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <C78BE4278D2EC64EB1A9202E43ADAD99@amazon.com>
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
PiBhbGxvY2F0aW9uLTENCj4gDQo+IFdlaS4NCg0KVGVzdGVkLWJ5OiBTdGVmYW4gTnVlcm5iZXJn
ZXIgPHNudUBhbWF6b24uZGU+DQoNCkkgYmFja3BvcnRlZCB0aGUgbGF0ZXN0IHNlcmllcyB0byBh
biBpbnRlcm5hbCB2ZXJzaW9uIGJhc2VkIG9uIHRoZQ0KNC4xMS4xIHJlbGVhc2UuDQoNCkkgZ2F2
ZSBpdCBhIGdvb2Qgc3BpbiBvbiBhIHZhcmlldHkgb2YgaGFyZHdhcmUgZ2VuZXJhdGlvbnMuIEl0
J3Mgc3RhYmxlDQp3aXRoIG5vIHJlZ3Jlc3Npb25zIGZvdW5kLiBJIGRpZCBub3QgZG8gYW55IHBl
cmZvcm1hbmNlIG1lYXN1cmVtZW50cywNCnRob3VnaC4gSSBkaWQgbm90IHRlc3QgUFYgZ3Vlc3Rz
LCBvbmx5IEhWTSBkb21VIHdpdGggUFYgZG9tMC4NCg0KLSBTdGVmYW4NCgoKCkFtYXpvbiBEZXZl
bG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpH
ZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApVc3Qt
SUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5i
dXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
