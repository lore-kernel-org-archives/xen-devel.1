From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 3 Dec 2018 16:36:46 +0200
Message-ID: <695086af-0d00-12f0-5688-6858818cd179@gmail.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
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
 <fd66b6fc-794c-bbbc-c5d1-a790cb08aef9@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <fd66b6fc-794c-bbbc-c5d1-a790cb08aef9@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Andre Przywara <andre.przywara@arm.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall <julien.grall@gmail.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVlcmdlbiwKCk9uIDAzLjEyLjE4IDE1OjUzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
IE9uIDAzLzEyLzIwMTggMTQ6NDYsIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBJIHRoaW5rIFBF
UkZDT1VOVEVSIGlzIHlvdXIgZnJpZW5kLgo+IAo+IENPTkZJR19MT0NLX1BST0ZJTEUgYW5kIHhl
bi1sb2NrcHJvZiBvbiB0b29scyBzaWRlPwo+IAo+IE5vdCBzdXJlIGl0IGlzIHN0aWxsIHdvcmtp
bmcsIHRob3VnaC4gSXRzIGFib3V0IDkgeWVhcnMgc2luY2UgSSB3cm90ZQo+IGFuZCB1c2VkIGl0
LgpJdCBkb2VzIHdvcmsuIEkndmUgdXNlZCBpdCByZWNlbnRseSBmb3IgdGhpcyB0aGVtZS4KQnV0
IGl0IGdhdmUgbWUgdW5jbGVhciByZXN1bHRzLCBJIGRpZCBub3QgbWF0Y2ggdGhlbSB3aXRoIHdo
YXQgSSBnb3QgCmZyb20geGVudHJhY2UgYW5kIHJvdWdoIGxhdXRlcmJhY2ggdHJhY2VzLgoKLS0g
ClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
