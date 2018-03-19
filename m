From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 15/45] ARM: new VGIC: Add acccessor to
 new struct vgic_irq instance
Date: Mon, 19 Mar 2018 11:04:26 +0000
Message-ID: <11fa557f-fe1b-86b2-8fc4-4d82ea334687@arm.com>
References: <20180315203050.19791-1-andre.przywara@linaro.org>
 <20180315203050.19791-16-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exl6T-00034D-Pv
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 03:04:53 +0000
In-Reply-To: <20180315203050.19791-16-andre.przywara@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmUsCgpPbiAwMy8xNS8yMDE4IDA4OjMwIFBNLCBBbmRyZSBQcnp5d2FyYSB3cm90ZToK
PiBUaGUgbmV3IFZHSUMgaW1wbGVtZW50YXRpb24gY2VudGVycyBhcm91bmQgYSBzdHJ1Y3Qgdmdp
Y19pcnEgaW5zdGFuY2UKPiBwZXIgdmlydHVhbCBJUlEuCj4gUHJvdmlkZSBhIGZ1bmN0aW9uIHRv
IHJldHJpZXZlIHRoZSByaWdodCBpbnN0YW5jZSBmb3IgYSBnaXZlbiBJUlEKPiBudW1iZXIgYW5k
IChpbiBjYXNlIG9mIHByaXZhdGUgaW50ZXJydXB0cykgdGhlIHJpZ2h0IFZDUFUuCj4gVGhpcyBh
bHNvIGluY2x1ZGVzIHRoZSBjb3JyZXNwb25kaW5nIHB1dCBmdW5jdGlvbiwgd2hpY2ggZG9lcyBu
b3RoaW5nCj4gZm9yIHByaXZhdGUgaW50ZXJydXB0cyBhbmQgU1BJcywgYnV0IGhhbmRsZXMgdGhl
IHJlZi1jb3VudGluZyBmb3IgTFBJcy4KPiAKPiBUaGlzIGlzIGJhc2VkIG9uIExpbnV4IGNvbW1p
dCA2NGE5NTlkNjZlNDcsIHdyaXR0ZW4gYnkgQ2hyaXN0b2ZmZXIgRGFsbC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KPiAtLS0K
PiBDaGFuZ2Vsb2cgdjEgLi4uIHYyOgo+IC0gcmVvcmRlciBoZWFkZXIgZmlsZSBpbmNsdXNpb24K
ClBsZWFzZSBhZGRyZXNzIG15IGNvbW1lbnRzIG1hZGUgaW4KCjw1NGIxNTgwMi0yZjcyLTdlN2Mt
YWRhMi1hM2I3N2Y4MWIyZjRAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
