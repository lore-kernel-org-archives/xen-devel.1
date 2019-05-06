From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 12/12] xen/arm: mm: Remove
 set_pte_flags_on_range()
Date: Mon, 6 May 2019 15:49:14 +0300
Message-ID: <4f8eeed7-c5c5-52ed-e365-b09ab6153647@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-13-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3W-0007q3-UH
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:49:18 +0000
Received: by mail-lf1-x144.google.com with SMTP id y19so1471890lfy.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:49:17 -0700 (PDT)
In-Reply-To: <20190424165955.23718-13-julien.grall@arm.com>
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHNldF9wdGVfZmxhZ3Nf
b25fcmFuZ2UoKSBpcyB5ZXQgYW5vdGhlciBmdW5jdGlvbiB0aGF0IHdpbGwgb3Blbi1jb2RlCj4g
dXBkYXRlIHRvIGEgc3BlY2lmaWMgcmFuZ2UgaW4gdGhlIFhlbiBwYWdlLXRhYmxlcy4gSXQgY2Fu
IGJlIGNvbXBsZXRlbHkKPiBkcm9wcGVkIGJ5IHVzaW5nIGVpdGhlciBtb2RpZnlfeGVuX21hcHBp
bmdzKCkgb3IgZGVzdHJveV94ZW5fbWFwcGluZ3MoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEFuZHJp
aSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkg
QW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
