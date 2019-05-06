From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 13/20] xen/arm32: mm: Avoid to zero and
 clean cache for CPU0 domheap
Date: Mon, 6 May 2019 11:28:07 +0300
Message-ID: <8a9dd31b-0063-41fe-7030-79d2d1626ba7@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-14-julien.grall@arm.com>
 <3d3d4a09-4935-4a83-0e3d-7b987dfc9fcf@gmail.com>
 <291f238e-16e8-a5d7-c0a5-5532fde69585@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNYyq-0008Cn-1f
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:28:12 +0000
Received: by mail-lj1-x241.google.com with SMTP id 132so2566177ljj.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 01:28:10 -0700 (PDT)
In-Reply-To: <291f238e-16e8-a5d7-c0a5-5532fde69585@arm.com>
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

Ck9uIDAzLjA1LjE5IDIwOjA2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSW4gQywgdW5pbml0aWFs
aXplZCBnbG9iYWwgdmFyaWFibGUgd2lsbCBiZSB6ZXJvIGJ5IGRlZmF1bHQuIEl0IGlzIGEgYml0
IG9mIHdhc3RlIHRvIGFsbG9jYXRlIHNwYWNlIGluIHRoZSBiaW5hcnkgZm9yIHRoZW0uIFNvIHRo
ZSBjb21waWxlciB3aWxsIGNvbW1vbmx5IHB1dCB0aGVtIGluIGEgc2VjdGlvbiBCU1MgdGhhdCBh
cmUgZ29pbmcgdG8gYmUgemVyb2VkIHdoZW4gYXQgbGF1bmNoLgo+IAo+IE9uIEFybTMyLCB0aGlz
IGlzIGFsd2F5cyBkb25lIGluIENQVTAgYXQgZWFybHkgYm9vdC4gRm9yIEFybTY0LCBVRUZJIHdp
bGwgZG8gaXQgZm9yIHVzLCBzbyB3ZSBkb24ndCB3YW50IHRvIGRvIGl0IHdoZW4gdXNpbmcgVUVG
SSBhcyB3ZSBtYXkgb3ZlcnJpZGUgZ2xvYmFsCj4gCj4gVGhlIHJlYXNvbiBJIGNob3NlIHRvIHNh
eSAid2lsbCBhbHdheXMgYmUgemVyb2VkIGJlZm9yZWhhbmQiIHRoYW4gc3BlY2lmaWNhbGx5IG1l
bnRpb24gIkJTUyIgaXMgSSB3YXNuJ3QgZW50aXJlbHkgY29udmluY2VkIHRoZSBjb21waWxlciB3
aWxsIGFsd2F5cyBwdXQgaW4gQlNTLgoKT0suCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
