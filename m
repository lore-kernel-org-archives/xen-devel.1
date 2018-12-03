From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 3 Dec 2018 17:28:29 +0200
Message-ID: <03db2129-9494-054f-e261-cf9b8cdc5534@gmail.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
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
 <a9f3a72f-37cc-9097-e93e-df7d0d47aa01@gmail.com>
 <20181123121819.1b1c7655@donnerap.cambridge.arm.com>
 <a934d9af-e3b5-9d15-4ba1-09e1d450a367@gmail.com>
 <393df5f9-49dd-673a-ed7d-683f6049450d@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <393df5f9-49dd-673a-ed7d-683f6049450d@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall <julien.grall@gmail.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gQW5kcmUsCgpPbiAwMy4xMi4xOCAxNTo0NiwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4g
V2VsbCwgeW91IHNob3VsZCBiZSBzY2FyZWQgb2YgdGhlIG9sZCBWR0lDIGxvY2tpbmcgc2NoZW1l
IGluc3RlYWQgOy0pCk9sZCBWR0lDIGxvY2tpbmcgaXMgbW9yZSBtYXp5LCBpbmRlZWQuCgo+IEFw
YXJ0IGZyb20gdGhlIHZnaWNfcXVldWVfaXJxX3VubG9jaygpIGZ1bmN0aW9uLCB0aGUgcmVzdCBv
ZiB0aGUgbmV3Cj4gbG9ja2luZyBzY2hlbWUgaXMgbXVjaCBjbGVhcmVyLgpJIGFncmVlLAoKPiBZ
ZXMsIGJ1dCBlZmZlY3RpdmVseSB0aGlzIHZpcnR1YWxseSBuZXZlciBoYXBwZW5zLCBhcyB5b3Ug
aGF2ZSByYXJlbHkKPiBtb3JlIHRoYW4gZm91ciBwZW5kaW5nIElSUXMgYXQgdGhlIHNhbWUgdGlt
ZS4KSSd2ZSBjaGVja2VkIHRoYXQuIEp1c3QgcHV0IGEgcGVyZmNvdW50ZXIgdGhlcmUuIFN1cnBy
aXNpbmdseSBpdCBoYXBwZW5zIApmZXcgdGltZXMgcGVyIHJ1biB1bmRlciBteSBzaW1wbGlmaWVk
IGNvbmRpdGlvbnMuIFNob3VsZCBjaGVjayB0aGVtIHdpdGggCm1vcmUgY29tcGxleCBtdWx0aW1l
ZGlhIHVzZS1jYXNlcyBvbiBhIGRpZmZlcmVudCBzZXR1cC4KCj4gSSBoYWQgcGF0Y2hlcyBseWlu
ZyBhcm91bmQgdG8gaW1wcm92ZSB0aGlzIHBhcnQsIGp1c3QgbmV2ZXIgZ290IGFyb3VuZAo+IHRv
IHBvc3QsIGVzcGVjaWFsbHkgd2l0aCBvbmx5IGxpdHRsZSByYXRpb25hbGUuCj4gSWYgeW91IGFy
ZSBpbnRlcmVzdGVkLCBJIGNhbiBkaWcgdGhlbSBvdXQsIHRob3VnaCBJIGFtIG5vdCBzdXJlIGhv
dwo+IHJlbGV2YW50IHRoaXMgaXMuCkknbSBpbnRlcmVzdGVkLCBmb3Igc3VyZS4gSSdtIHByZXR0
eSBzdXJlIHdlIHdpbGwgbmVlZCB0aGVtIHdoZW4gd2UgaGF2ZSAKbXVsdGltZWRpYSBzY2VuYXJp
b3Mgb24gdGhlIHRhYmxlLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
