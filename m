From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Fri, 9 Nov 2018 17:47:12 +0000
Message-ID: <4e0ff907-86c4-c301-5742-259e76922eeb@arm.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <VI1PR0302MB26882FD1B2445807F8C2B026E6C60@VI1PR0302MB2688.eurprd03.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <Andrii_Anisov@epam.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwOS8xMS8yMDE4IDE0OjQyLCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKCkhpIEFuZHJpaSwKCj4gCj4gSSBqdXN0IHdvbmRlciwgZG8geW91IHBsYW4gdG8gdXBzdHJl
YW0gdGhlIHBhdGNoIGJlbG93PwoKSSBkb24ndCBwbGFuIHRvIHVwc3RyZWFtIHRoZSBwYXRjaCBi
ZWxvdy4gQW5kcmUgYW5kIEkgZGlzY3Vzc2VkIGFib3V0IGl0IApleHRlbnNpdmVseSBhbmQgaGF2
ZW4ndCBmb3VuZCBwb3RlbnRpYWwgaXNzdWUgd2l0aCB0aGUgMiB2R0lDIGltcGxlbWVudGF0aW9u
IHdlIApoYXZlIGluIFhlbi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
