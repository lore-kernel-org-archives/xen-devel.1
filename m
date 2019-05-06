From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
Date: Mon, 6 May 2019 11:20:34 +0300
Message-ID: <907cbeac-4904-bc28-b09e-3a68ce6c2c37@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNYrW-0007oa-Uy
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:20:38 +0000
Received: by mail-lf1-x144.google.com with SMTP id z124so2340060lfd.6
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 01:20:37 -0700 (PDT)
In-Reply-To: <20190422164937.21350-17-julien.grall@arm.com>
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBmdW5jdGlvbiBj
cmVhdGVfeGVuX2VudHJpZXMgbWF5IGJlIGNvbmN1cnJlbnRseSBjYWxsZWQuIFNvIHdlIG5lZWQK
PiB0byBwcm90ZWN0IHdpdGggYSBzcGlubG9jayB0byBhdm9pZCBjb3JydXB0aW9uIHRoZSBwYWdl
LXRhYmxlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5j
b20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
