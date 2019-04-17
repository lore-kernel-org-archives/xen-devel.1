From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 03/12] xen/arm: zynqmp: Fix header guard for
 xilinx-zynqmp-eemi.h
Date: Wed, 17 Apr 2019 13:20:42 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904171320300.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CUiA=ST=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hGr2z-0008Mx-35
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 20:20:45 +0000
In-Reply-To: <20190327184531.30986-4-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBoZWFkZXIgZ3Vh
cmQgZm9yIHhpbGlueC16eW5xbXAtZWVtaS5oIGlzIG5vdCBmb2xsb3dlZCBieSBhICNkZWZpbmUK
PiBvZiB0aGUgbWFjcm8gdXNlZCBpbiB0aGUgZ3VhcmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgeGVuL2luY2x1ZGUvYXNt
LWFybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC1lZW1pLmggfCAyICstCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20tYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLWVlbWkuaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vcGxhdGZvcm1zL3hpbGlueC16eW5xbXAtZWVtaS5oCj4gaW5kZXggNzJhYWRm
N2E0NC4uY2YyNWE5MDE0ZCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3BsYXRm
b3Jtcy94aWxpbngtenlucW1wLWVlbWkuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGxh
dGZvcm1zL3hpbGlueC16eW5xbXAtZWVtaS5oCj4gQEAgLTEyLDcgKzEyLDcgQEAKPiAgICovCj4g
IAo+ICAjaWZuZGVmIF9fQVNNX0FSTV9QTEFURk9STVNfWllOUU1QX0gKPiAtI2RlZmluZSBfX0FT
TV9BU01fUExBVEZPUk1TX1pZTlFNUF9ICj4gKyNkZWZpbmUgX19BU01fQVJNX1BMQVRGT1JNU19a
WU5RTVBfSAo+ICAKPiAgI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KPiAgI2luY2x1ZGUgPGFz
bS9zbWNjYy5oPgo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
