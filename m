From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 5/7] xen/arm: Gather all TLB flush helpers
 in tlbflush.h
Date: Thu, 25 Apr 2019 21:01:01 +0300
Message-ID: <45000e50-c511-35d4-ebe3-b95653e4a9f4@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJigD-00068f-Km
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:01:05 +0000
Received: by mail-lj1-x243.google.com with SMTP id h21so415437ljk.13
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:01:04 -0700 (PDT)
In-Reply-To: <20190417175815.16905-6-julien.grall@arm.com>
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

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IFRMQiBoZWxwZXJzIGFyZSBzY2F0dGVyZWQgaW4gMiBoZWFkZXJzOiBwYWdlLmggKGZvcgo+IFhl
biBUTEIgaGVscGVycykgYW5kIHRsYmZsdXNoLmggKGZvciBndWVzdCBUTEIgaGVscGVycykuCj4g
Cj4gVGhpcyBwYXRjaCBpcyBnYXRoZXJpbmcgYWxsIG9mIHRoZW0gaW4gdGxiZmx1c2guIFRoaXMg
d2lsbCBoZWxwIHRvCj4gdW5pZm9ybWl6ZSBhbmQgdXBkYXRlIHRoZSBsb2dpYyBvZiB0aGUgaGVs
cGVycyBpbiBmb2xsb3ctdXAgcGF0Y2hlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFu
ZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
