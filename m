From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC] arm/p2m: call iommu iotlb flush if iommu
 exists and enabled
Date: Wed, 23 Jan 2019 14:35:01 +0200
Message-ID: <540227d2-a082-ebf3-9b3b-5928d31f1f39@gmail.com>
References: <1548238334-23168-1-git-send-email-andrii.anisov@gmail.com>
 <c861a2f4-25a4-e5a4-f112-42853cba84e3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5y24=P7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmHkI-0006vX-Sf
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:35:06 +0000
Received: by mail-lj1-x22f.google.com with SMTP id c19-v6so1785056lja.5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 04:35:05 -0800 (PST)
In-Reply-To: <c861a2f4-25a4-e5a4-f112-42853cba84e3@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDIzLjAxLjE5IDEzOjMzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gRG8geW91IG1lYW4gc2hh
cmluZyB0aGUgUDJNPwoKRm9yIHN1cmUhCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
