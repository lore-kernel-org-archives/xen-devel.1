From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 00/10] arm: add one kconfig option per
 platform
Date: Fri, 24 Aug 2018 12:38:01 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1808241235310.14449@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
 <76a28ae9-516c-4120-dbcc-55494831ce92@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fe4w=lh=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ftHuH-0007hA-Oy
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 19:38:05 +0000
In-Reply-To: <76a28ae9-516c-4120-dbcc-55494831ce92@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAyNCBBdWcgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI0LzA4LzE4IDAw
OjMzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBIaSBhbGwsCj4gCj4gSGksCj4gCj4g
PiAKPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgb25lIGtjb25maWcgb3B0aW9uIGZv
ciBlYWNoIHJlbWFpbmcKPiA+IHBsYXRmb3JtIHVuZGVyIHBsYXRmb3Jtcy8uICBFYWNoIGtjb25m
aWcgb3B0aW9uIGVuYWJsZXMgdGhlIHJlcXVpcmVkCj4gPiBkcml2ZXJzIGluIFhlbi4KPiA+IAo+
ID4gQ2hlZXJzLAo+ID4gCj4gPiBTdGVmYW5vCj4gPiAKPiA+IENoYW5nZXMgaW4gdjI6Cj4gPiAt
IHJlbW92ZSBhbGwgcGxhdGZvcm0gb3B0aW9ucyBleGNlcHQgZm9yIHRodW5kZXJ4LCBzdW54aSwg
cmNhcjIsIG9tYXA1Cj4gCj4gQXMgd2UgZGlzY3Vzc2VkIHllc3RlcmRheSwgSSB3b3VsZCByYXRo
ZXIgbm90IGludHJvZHVjZSBwZXItcGxhdGZvcm0gY29uZmlnCj4gdW50aWwgd2UgaGF2ZSBhIHJl
YWwgdXNlLWNhc2UuCj4gCj4gSXQgbWFrZXMgc2Vuc2UgdG8gaGF2ZSBhIHBlci1wbGF0Zm9ybSBj
b25maWcgZm9yIE9tYXA1IGFuZCBSY2FyMi4gQnV0IEkgZG9uJ3QKPiBzZWUgYSB1c2UtY2FzZSBm
b3IgVGh1bmRlci1YL1N1bnhpLgoKVGhlcmUgaXMgYW4gYXJndW1lbnQgdGhhdCBUaHVuZGVyLVgg
aXMgYSBzZXJ2ZXIgcGxhdGZvcm0sIGhlbmNlLCB0aGVyZQppcyBubyBuZWVkIHRvIGRvIGEgdGFp
bG9yZWQga2NvbmZpZyBmb3IgaXQuCgpCdXQgSSB0aGluayB0aGF0IFN1bnhpIHdvdWxkIGJlIG5p
Y2UgdG8gaGF2ZSBhcyB0aGVyZSBhcmUgc2V2ZXJhbAplbWJlZGRlZCBib2FyZHMgb3V0IHRoZXJl
IHVzaW5nIGl0LiBJIGtub3cgb2YgYSBmZXcgcGVvcGxlIHVzaW5nIFN1bnhpCmVtYmVkZGVkIGJv
YXJkcyB3aXRoIFhlbiB0b2RheSBpbiB0aGVpciBidXNpbmVzcy4KCldoYXQgaWYgSSByZW1vdmUg
dGhlIFRodW5kZXItWCBzcGVjaWZpYyBvcHRpb24gYnV0IEkga2VlcCB0aGUgU3VueGkKb3B0aW9u
PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
