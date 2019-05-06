From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 04/12] xen/arm: mm: Introduce _PAGE_PRESENT
 and _PAGE_POPULATE
Date: Mon, 6 May 2019 15:48:16 +0300
Message-ID: <e7bd0a3b-d030-8a2f-2fd6-a7eab540d2bf@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2c-0007Lh-D3
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:22 +0000
Received: by mail-lf1-x141.google.com with SMTP id j11so9055234lfm.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:20 -0700 (PDT)
In-Reply-To: <20190424165955.23718-5-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSBmbGFncyBhcmUgbm90IGVub3VnaCB0byBkZXNjcmliZSB3aGF0IGtpbmQgb2YgdXBkYXRl
Cj4gd2lsbCBkb25lIG9uIHRoZSBWQSByYW5nZS4gVGhleSBuZWVkIHRvIGJlIHVzZWQgaW4gY29u
anVuY3Rpb24gd2l0aCB0aGUKPiBlbnVtIHhlbm1hcF9vcGVyYXRpb24uCj4gCj4gSXQgd291bGQg
YmUgbW9yZSBjb252ZW5pZW50IHRvIGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBmb3IgdGhlIHVw
ZGF0ZQo+IGluIGEgc2luZ2xlIHBsYWNlLgo+IAo+IFR3byBuZXcgZmxhZ3MgYXJlIGFkZGVkIHRv
IHJlbW92ZSB0aGUgcmVsaWVuY2Ugb24geGVubWFwX29wZXJhdGlvbjoKPiAgICAgIC0gX1BBR0Vf
UFJFU0VOVDogSW5kaWNhdGUgd2hldGhlciB3ZSBhcmUgYWRkaW5nL3JlbW92aW5nIHRoZSBtYXBw
aW5nCj4gICAgICAtIF9QQUdFX1BPUFVMQVRFOiBJbmRpY2F0ZSB3aGV0aGVyIHdlIG9ubHkgcG9w
dWxhdGUgcGFnZS10YWJsZXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
