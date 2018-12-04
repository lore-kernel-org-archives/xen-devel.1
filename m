From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Tue, 4 Dec 2018 17:16:44 +0000
Message-ID: <b6f36b8c-67be-1ac4-86c2-4a9aa5bcb33a@arm.com>
References: <20181023181709.11883-1-julien.grall@arm.com>
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
 <695086af-0d00-12f0-5688-6858818cd179@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <695086af-0d00-12f0-5688-6858818cd179@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, Juergen Gross <jgross@suse.com>, Andre Przywara <andre.przywara@arm.com>
Cc: Julien Grall <julien.grall@gmail.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmlpLAoKT24gMTIvMy8xOCAyOjM2IFBNLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9u
IDAzLjEyLjE4IDE1OjUzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwMy8xMi8yMDE4IDE0
OjQ2LCBBbmRyZSBQcnp5d2FyYSB3cm90ZToKPj4+IEkgdGhpbmsgUEVSRkNPVU5URVIgaXMgeW91
ciBmcmllbmQuCj4+Cj4+IENPTkZJR19MT0NLX1BST0ZJTEUgYW5kIHhlbi1sb2NrcHJvZiBvbiB0
b29scyBzaWRlPwo+Pgo+PiBOb3Qgc3VyZSBpdCBpcyBzdGlsbCB3b3JraW5nLCB0aG91Z2guIEl0
cyBhYm91dCA5IHllYXJzIHNpbmNlIEkgd3JvdGUKPj4gYW5kIHVzZWQgaXQuCj4gSXQgZG9lcyB3
b3JrLiBJJ3ZlIHVzZWQgaXQgcmVjZW50bHkgZm9yIHRoaXMgdGhlbWUuCj4gQnV0IGl0IGdhdmUg
bWUgdW5jbGVhciByZXN1bHRzLCBJIGRpZCBub3QgbWF0Y2ggdGhlbSB3aXRoIHdoYXQgSSBnb3Qg
Cj4gZnJvbSB4ZW50cmFjZSBhbmQgcm91Z2ggbGF1dGVyYmFjaCB0cmFjZXMuCgpDYW4geW91IGV4
cGFuZCBpdD8gV2hhdCBhcmUgdGhlIGRpZmZlcmVuY2VzIGJldHdlZW4gdGhlIDM/CgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
