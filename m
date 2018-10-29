From: Andrii Anisov <Andrii_Anisov@epam.com>
Subject: Re: [PATCH 1/4] xen/arm: gic: Ensure we have an ISB
 between ack and do_IRQ()
Date: Mon, 29 Oct 2018 16:16:38 +0000
Message-ID: <dd88b504-1120-267e-f157-1ba08afcf438@epam.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6d1c980b-b316-f634-7793-0aca4b34aa85@arm.com>
Content-Language: en-US
Content-ID: <7180D7714488D84E9FE663D9905130D9@EPAM.onmicrosoft.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: "andre.przywara@arm.com" <andre.przywara@arm.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuCgpPbiAyOS4xMC4xOCAxNTozNiwgSnVsaWVuIEdyYWxsIHdyb3RlOjAKPiBJ
IHdyb3RlIGRvd24gYW4gYW5zd2VyIHllc3RlcmRheSAoc2VudCBpdCB0b2RheSkgdG8geW91ciBw
cmV2aW91cwo+IGFuc3dlci4gWW91IG1heSB1c2UgdGhlIExScyBpbmZvcm1hdGlvbiBmcm9tIHRo
ZSBwcmV2aW91cyBndWVzdCB0cmFwIGFzCj4gaW50ZXJydXB0cyBhcmUgcmUtZW5hYmxlZCBiZWZv
cmUgc3RvcmluZyB0aGUgTFJzLgoKWWVzLCBpdCBpcyB0aGUgY2FzZS4gSSd2ZSBvdmVybG9va2Vk
IHRoYXQgZm9yIHNvbWUgZXhjZXB0aW9ucyBpbnRlcnJ1cHRzIAphcmUgZW5hYmxlZCBiZWZvcmUg
ZW50ZXJfaHlwZXJ2aXNvcl9oZWFkKCkuCgoKPiBDYW4geW91IHRyeSB0aGUgcGF0Y2ggYmVsb3c/
CgpJIHRyaWVkIGl0LCBhbmQgaXQgd29ya3MgbGlrZSBhIGNoYXJtIGZvciB0aGUgaXNzdWUuCgpU
aGUgb25seSBub3RpY2UgaGVyZSBpcyB0aGF0LCBJIHN1cHBvc2UsIGNoYW5nZXMgYXJlIG5lZWRl
ZCBmb3IgCmV4Y2VwdGlvbnMgdGFrZW4gZnJvbSBhIGd1ZXN0IG1vZGUuIEZvciB0aGUgZXhjZXB0
aW9ucyB0YWtlbiBmcm9tIGh5cCwgCndlIGRvIG5vdCBtYXNzYWdlIGdpYyBpbiBlbnRlcl9oeXBl
cnZpc29yX2hlYWQuCgoKLS0gCgoqQW5kcmlpIEFuaXNvdioKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
