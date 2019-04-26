From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
Date: Fri, 26 Apr 2019 16:50:16 +0300
Message-ID: <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
 <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TPdi=S4=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hK1F6-0001bs-Pf
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 13:50:20 +0000
Received: by mail-lj1-x244.google.com with SMTP id b12so1816496lji.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 06:50:19 -0700 (PDT)
In-Reply-To: <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <Julien.Grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNS4wNC4xOSAyMzozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSB1bmRlcnN0YW5k
aW5nIGlzIGNvcnJlY3QuIEkgYW0gbm90IGVudGlyZWx5IHN1cmUgaG93IEkgY2FuIGltcHJvdmUK
PiB0aGUgY29tbWVudC4KSSd2ZSByZS1yZWFkIHRoZSBjb21tZW50IGFnYWluLCBhbmQgcmVhbGl6
ZWQgaXQgYWN0dWFsbHkgZml0cy4gU28gbGV0IGl0IGJlLgoKPiAKPiBUbyBiZSBob25lc3QsIEkg
YW0gbm90IGVudGlyZWx5IHN1cmUgd2hldGhlciB0aGUgaXNiKCkgaXMgbmVjZXNzYXJ5Cj4gaGVy
ZS4gQXQgd29yc3QsIGFuIGVudHJ5IG9mIGFuIGV4aXN0aW5nIG1hcHBpbmdzIGlzIG5vdCBjYWNo
ZWQgd2l0aCB0aGUKPiBTQ1RMUl9FTDIuV1hOIHNldC4gVGhpcyBtYXkgb25seSBkZWZlciB0aGUg
cHJvYmxlbSBpcyBhbiBlbnRyeSBpcwo+IGluY29ycmVjdGx5IGNvbmZpZ3VyZWQgYmVmb3JlIHRo
ZSBmbHVzaC4gVGhpcyBpcyBkb25lIGVhcmx5IGF0IGJvb3QgKGFuZAo+IHdpbGwgYmUgZG9uZSBt
dWNoIGVhcmxpZXIgaW4gWzFdKS5XZWxsLCBmb2xsb3dpbmcgdGhpcyBsb2dpYyB3ZSBtYXkgZmlu
aXNoIHdpdGggVExCIGZsdXNoIGlzIG5vdCBuZWVkZWQgaGVyZSBhdCBhbGwuIEJlY2F1c2UgZW50
cmllcywgYWxyZWFkeSByZWFjaGVkIFRMQiwgd2VyZSBjb25maWd1cmVkIGJlZm9yZSwgYW5kIGFy
ZSBiZWxpZXZlZCB2YWxpZC4gQWxsIHRoZSBuZXh0IHdpbGwgaGF2ZSBXWE4gc2V0LgpCdXQgaW4g
dGhpcyBjYXNlLCBJU0IgaXMgbmVlZGVkIGFzIGFuIGV4YWN0IHBvaW50IGZyb20gd2hpY2ggYWxs
IG5ldyBUTEIgZW50cmllcyB3aWxsIGhhdmUgV1hOLgoKPiBTbyBJIGFtIGtpbmQgb2YgdGVtcHRl
ZCB0byBkcm9wIHRoZQo+IGlzYigpIGhlcmUuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
