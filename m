From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 3/8] xen/arm: p2m: Introduce an
 helper to allocate the root page-table
Date: Fri, 21 Dec 2018 16:35:32 +0200
Message-ID: <41d402ee-050f-2009-d3eb-5f8ef2c71028@gmail.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaLto-0001fD-2D
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 14:35:36 +0000
Received: by mail-lj1-x242.google.com with SMTP id v1-v6so4944010ljd.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 06:35:34 -0800 (PST)
In-Reply-To: <20181128164939.8329-4-julien.grall@arm.com>
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC4xMS4xOCAxODo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEEgZm9sbG93LXVwIHBh
dGNoIHdpbGwgcmVxdWlyZSB0byBhbGxvY2F0ZSB0aGUgcm9vdCBwYWdlLXRhYmxlIHdpdGhvdXQK
PiBoYXZpbmcgYSBkb21haW4gaW4gaGFuZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFu
ZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
