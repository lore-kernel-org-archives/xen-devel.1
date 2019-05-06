From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 15/20] xen/arm: mm: Use the shorter version
 __aligned(PAGE_SIZE) to align page-tables
Date: Mon, 6 May 2019 10:19:32 +0300
Message-ID: <f5b93de0-08e6-cafd-dda7-2ba60c004804@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-16-julien.grall@arm.com>
 <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
 <60d4ba1e-9bbe-04af-8050-02ddda48e7a3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNXuT-0000bA-4Q
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 07:19:37 +0000
Received: by mail-lj1-x242.google.com with SMTP id 132so2404056ljj.4
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 00:19:35 -0700 (PDT)
In-Reply-To: <60d4ba1e-9bbe-04af-8050-02ddda48e7a3@arm.com>
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

CgpPbiAwMy4wNS4xOSAyMDowOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEkgd2lsbCByZXdvcmQg
dG8gIlRoYW5rZnVsbHkgWGVuIHByb3ZpZGVzIGFuIGhhbmR5IG1hY3JvIHRoYXQgd2lsbCBtYWtl
IHRoZSBjb2RlIG1vcmUgcmVhZGFibGUiLgoKR29vZC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
