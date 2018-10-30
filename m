From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] xen-swiotlb: exchange memory with Xen only
 when pages are contiguous
Date: Tue, 30 Oct 2018 08:59:33 +0000
Message-ID: <57e5593233c64dc0a36c7d4c750a1ed4@AMSPEX02CL03.citrite.net>
References: <bb6d87b4-c371-c6c0-8c48-bc95df018ad1@oracle.com>
 <20181024130246.GA22616@localhost.localdomain>
 <83900cf4-690c-9725-d022-d427fdeb4f7d@oracle.com>
 <581cb7ea-3112-791d-918d-9bb887e4744f@oracle.com>
 <24a62522-1629-5d0b-398e-6d2c1a0b97f7@oracle.com>
 <922914c9-22db-c5d1-33da-d07691ebd7d7@oracle.com>
 <a47fabe8-53d1-47b8-0efc-f9f1e5b4898a@oracle.com>
 <45f5ffe8-3f48-4485-53f0-5a056be69b0c@oracle.com>
 <5b64850f-9142-0360-fe4e-9e7bc74d2368@oracle.com>
 <3e65208c-cb11-d918-00eb-012a97e56fec@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=kzyf=nk=citrix.com=prvs=834dfdc47=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gHPs8-0006Jm-Qi
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 08:59:36 +0000
In-Reply-To: <3e65208c-cb11-d918-00eb-012a97e56fec@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Joe Jin' <joe.jin@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: John Sobecki <john.sobecki@oracle.com>, "DONGLI.ZHANG" <dongli.zhang@oracle.com>, "linux-kernel@vger.kernel.org\"" <linux-kernel@vger.kernel.org>, "konrad@kernel.org" <konrad@kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Christoph Helwig <hch@lst.de>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIEpv
ZSBKaW4NCj4gU2VudDogMzAgT2N0b2JlciAyMDE4IDAyOjUyDQo+IFRvOiBCb3JpcyBPc3Ryb3Zz
a3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrDQo+
IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0KPiBDYzogSm9obiBTb2JlY2tpIDxqb2huLnNvYmVj
a2lAb3JhY2xlLmNvbT47IERPTkdMSS5aSEFORw0KPiA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIiA8bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+OyBrb25yYWRAa2VybmVsLm9yZzsgeGVuLQ0KPiBkZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsgQ2hyaXN0b3BoIEhlbHdpZyA8aGNoQGxzdC5kZT4NCj4gU3ViamVjdDogUmU6IFtY
ZW4tZGV2ZWxdIFtQQVRDSF0geGVuLXN3aW90bGI6IGV4Y2hhbmdlIG1lbW9yeSB3aXRoIFhlbg0K
PiBvbmx5IHdoZW4gcGFnZXMgYXJlIGNvbnRpZ3VvdXMNCj4gDQo+IE9uIDEwLzI1LzE4IDExOjU2
IEFNLCBKb2UgSmluIHdyb3RlOg0KPiA+IEkganVzdCBkaXNjdXNzZWQgdGhpcyBwYXRjaCB3aXRo
IEJvcmlzIGluIHByaXZhdGUsIGhpcyBvcGluaW9ucyhCb3JpcywNCj4gPiBwbGVhc2UgY29ycmVj
dCBtZSBpZiBhbnkgbWlzdW5kZXJzdG9vZCkgYXJlOg0KPiA+DQo+ID4gMS4gV2l0aC93aXRob3V0
IHRoZSBjaGVjaywgYm90aCBhcmUgaW5jb3JyZWN0LCBoZSB0aG91Z2h0IHdlIG5lZWQgdG8NCj4g
PiAgICBwcmV2ZW50ZWQgdW5hbGxvYydkIGZyZWUgYXQgaGVyZS4NCj4gPiAyLiBPbiBmcmVlaW5n
LCBpZiB1cHBlciBsYXllciBhbHJlYWR5IGNoZWNrZWQgdGhlIG1lbW9yeSB3YXMgRE1BLWFibGUs
DQo+ID4gICAgdGhlIGNoZWNraW5nIGF0IGhlcmUgZG9lcyBub3QgbWFrZSBzZW5zZSwgd2UgY2Fu
IHJlbW92ZSBhbGwgY2hlY2tzLg0KPiA+IDMuIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdpb24o
KSBhbmQgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKQ0KPiA+ICAgIHRvIGNvbWUgaW4g
cGFpcnMuDQo+IEkgdHJpZWQgdG8gYWRkZWQgcmFkaXhfdHJlZSB0byB0cmFjayBhbGxvY2F0aW5n
L2ZyZWVpbmcgYW5kIEkgZm91bmQgc29tZQ0KPiBtZW1vcnkgb25seSBhbGxvY2F0ZWQgYnV0IHdh
cyBub3QgZnJlZWQsIEkgZ3Vlc3MgaXQgY2F1c2VkIGJ5IGRyaXZlciB1c2VkDQo+IGRtYV9wb29s
LCB0aGF0IG1lYW5zIGlmIGxvdHMgb2Ygc3VjaCByZXF1ZXN0cywgdGhlIGxpc3Qgd2lsbCBjb25z
dW1lIGxvdA0KPiBvZiBtZW1vcnkgZm9yIGl0LiBXaWxsIGNvbnRpbnVlIHRvIHdvcmsgb24gaXQs
IGlmIGFueW9uZSBoYXZlIGdvb2QgaWRlYQ0KPiBmb3IgaXQgcGxlYXNlIGxldCBtZSBrbm93LCBJ
J2QgbGlrZSB0byB0cnkgaXQuDQo+IA0KDQpGV0lXLCBpbiBteSBYZW4gUFYtSU9NTVUgdGVzdCBw
YXRjaGVzLCBJIGhhdmUgYWxzbyB0cmllZCBrZWVwaW5nIGEgbGlzdCBvZiByYW5nZXMgbWFwcGVk
IGZvciBETUEgYW5kIGhhdmUgZGlzY292ZXJlZCBhcHBhcmVudCBpc3N1ZXMgd2l0aCBzb21lIGRy
aXZlcnMsIHBhcnRpY3VsYXJseSB0ZzMsIHRoYXQgc2VlbSB0byBmcmVlIG1hcHBpbmdzIHRoYXQg
aGF2ZSBub3QgYmVlbiBhbGxvY2F0ZWQgKG9yIHBvc3NpYmx5IGRvdWJsZS1mcmVlKS4gSSd2ZSBu
ZXZlciBmdWxseSB0cmFja2VkIGRvd24gdGhlIGlzc3VlLg0KDQogIFBhdWwNCg0KPiBUaGFua3Ms
DQo+IEpvZQ0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
