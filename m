From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 14/20] xen/arm32: mm: Avoid cleaning the
 cache for secondary CPUs page-tables
Date: Fri, 3 May 2019 18:57:35 +0300
Message-ID: <a3a0dd62-d4e8-1acd-43ac-6e9ba1563515@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-15-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaZ9-0007Aq-2z
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:39 +0000
Received: by mail-lj1-x241.google.com with SMTP id z26so831745ljj.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:38 -0700 (PDT)
In-Reply-To: <20190422164937.21350-15-julien.grall@arm.com>
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBwYWdlLXRhYmxl
IHdhbGtlciBpcyBjb25maWd1cmVkIHRvIHVzZSB0aGUgc2FtZSBzaGFyZWFiaWxpdHkgYW5kCj4g
Y2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBkYXRpbmcgdGhlIHBh
Z2UtdGFibGVzLiBUaGlzCj4gbWVhbnMgY2xlYW5pbmcgdGhlIGNhY2hlIGZvciBzZWNvbmRhcnkg
Q1BVcyBydW50aW1lIHBhZ2UtdGFibGVzIGlzCj4gdW5uZWNlc3NhcnkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBB
bmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKCi0tIApTaW5jZXJlbHksCkFu
ZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
