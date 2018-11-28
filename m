From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Tue, 27 Nov 2018 16:30:49 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811271628100.4577@sstabellini-ThinkPad-X260>
References: <20181023181709.11883-1-julien.grall@arm.com>
 <20181023181709.11883-2-julien.grall@arm.com>
 <6098937f-98de-bff9-6c48-5575a45875e0@epam.com>
 <57ee191b-be21-701e-ef19-4ed4df1cf289@arm.com>
 <77f72cc9-6548-afd9-3766-23326b3551d9@epam.com>
 <6acf65ef-4302-c403-32ba-1d88ab954265@epam.com>
 <22f7ebc8-c74b-0d8e-4847-9d3df9bcf5db@arm.com>
 <3622e468-8f44-1e31-138f-db58ca3835ff@epam.com>
 <2090f5b4-22ff-38bc-3d47-6dbb6d7fccfb@epam.com>
 <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
 <VI1PR0302MB26882FD1B2445807F8C2B026E6C60@VI1PR0302MB2688.eurprd03.prod.outlook.com>
 <5ad76791-075d-e588-2669-e01c79674f0d@gmail.com>
 <CAF3u54CmW32NwN0q73LaXwnj2wUt72uuq9LGPRQ3RNMzZTV==Q@mail.gmail.com>
 <d260c074-6107-a5d1-94c8-fdb019585135@gmail.com>
 <4ceea0f6-ede1-420a-d3b7-80c4584739ce@arm.com>
 <2199be43-ef12-28c3-4dcb-cac404be1e4d@gmail.com>
 <0c381f5d-59f8-fcee-4a25-8a29af3f2d73@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <0c381f5d-59f8-fcee-4a25-8a29af3f2d73@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "andre.przywara@arm.com" <andre.przywara@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall <julien.grall@gmail.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Andrii Anisov <andrii.anisov@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMiBOb3YgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBJZiB5b3UgYXJl
IHdvcnJpZWQgYWJvdXQgcGVyZm9ybWFuY2UsIHRoZW4gSSB3b3VsZCByZWNvbW1lbmQgdG8gdHJ5
IHRoZQo+ID4gPiBuZXcgdkdJQyBhbmQgc2VlIHdoZXRoZXIgaXQgaW1wcm92ZXMuCj4gPiBZb3Ug
a25vdywgd2UgYXJlIGJhc2VkIG9uIFhFTiA0LjEwLiBJbml0aWFsbHksIHdoZW4gYSBjdXN0b21l
ciBzYWlkIGFib3V0Cj4gPiB0aGVpciBkaXNzYXRpc2ZhY3Rpb24gYWJvdXQgcGVyZm9ybWFuY2Ug
ZHJvcCBpbiBiZW5jaG1hcmsgZHVlIHRvIFhFTgo+ID4gZXhpc3RlbmNlLCBJIHRyaWVkIDQuMTIt
dW5zdGFibGUsIGJvdGggYW4gb2xkIGFuZCBhIG5ldyBWR0lDLiBTbyBwZXJmb3JtYW5jZQo+ID4g
d2l0aCA0LjEyLXVuc3RhYmxlIHdpdGggdGhlIG9sZCBWR0lDIHdhcyB3b3JzZSB0aGFuIDQuMTAs
IGFuZCB0aGUgbmV3IFZHSUMKPiA+IG1hZGUgdGhpbmdzIGV2ZW4gbXVjaCB3b3JzZS4gSSBjYW4n
dCByZW1lbWJlciB0aGUgZXhhY3QgbnVtYmVycyBvcgo+ID4gcHJvcG9ydGlvbnMsIGJ1dCB0aGF0
IHdhcyB0aGUgcmVhc29uIHdlIGRvIG5vdCBvZmZlciB1cGdyYWRpbmcgWEVOIHlldC4KPiAKPiBJ
IGNhbid0IGNvbW1lbnQgd2l0aG91dCBhbnkgbnVtYmVycyBoZXJlLiBCZWFyIGluIG1pbmQgdGhh
dCB3ZSBmaXhlZCBidWdzIGluCj4gWGVuIDQuMTIgKGluY2x1ZGluZyBzcGVjdHJlL21lbHRkb3du
IGFuZCBtaXNzaW5nIGJhcnJpZXJzKSB0aGF0IHdhc24ndAo+IGJhY2twb3J0ZWQgdG8gWGVuIDQu
MTAuIEl0IGlzIGVudGlyZWx5IHBvc3NpYmxlIHRoYXQgaXQgaW50cm9kdWNlZCBzbG93bmVzcwo+
IGJ1dCBpdCBhbHNvIGVuc3VyZSB0aGUgY29kZSBpcyBiZWhhdmluZyBjb3JyZWN0bHkuCj4gCj4g
QW55d2F5LCBpZiB0aGVyZSBhcmUgcGVyZm9ybWFuY2UgcmVncmVzc2lvbiB3ZSBzaG91bGQgaW52
ZXN0aWdhdGUgdGhlbSBhbmQKPiBkaXNjdXNzIGhvdyB3ZSBjYW4gYWRkcmVzcy9saW1pdCB0aGVt
LiBTaW1pbGFybHkgZm9yIHRoZSBuZXcgdkdJQywgaWYgeW91Cj4gdGhpbmsgaXQgaXMgdG9vIHNs
b3csIHRoZW4gd2UgbmVlZCB0byBrbm93IHdoeSBiZWZvcmUgd2UgZ2V0IHJpZCBvZiB0aGUgb2xk
Cj4gdkdJQy4KCldlbGwgc2FpZCEgV2UgY2FyZSBhYm91dCBpbnRlcnJ1cHQgcGVyZm9ybWFuY2Ug
dmVyeSBtdWNoIGFuZCB3ZQpkZWZpbml0ZWx5IG5lZWQgdG8gYWRkcmVzcyBhbnkgcmVncmVzc2lv
bnMgd2l0aCBlaXRoZXIgdGhlIG9sZCBvciB0aGUKbmV3IGRyaXZlci4gQnV0IHRvIGRvIHRoYXQs
IHdlIG5lZWQgcmVsaWFibGUgbnVtYmVycyBhbmQgdG8gZmlndXJlIG91dApleGFjdGx5IHdoYXQg
dGhlIHByb2JsZW0gaXMgc28gdGhhdCB3ZSBjYW4gZml4IGl0LgoKSSBzZW50IHRoZSB3YXkgSSB1
c2VkIHRvIG1lYXN1cmUgcGVyZm9ybWFuY2UgaW4gYSBzZXBhcmF0ZSBlbWFpbC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
