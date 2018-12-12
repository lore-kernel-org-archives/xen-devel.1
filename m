From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 2/2] arm/irq: skip action avalability check
 for non-debug build
Date: Wed, 12 Dec 2018 19:51:45 +0200
Message-ID: <4ef24b2b-d751-078d-c99e-d26a3ed3d76e@gmail.com>
References: <1544633725-7243-1-git-send-email-andrii.anisov@gmail.com>
 <1544633725-7243-3-git-send-email-andrii.anisov@gmail.com>
 <46211378-e63d-86bb-6ce9-d739b986b777@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX8fl-0004C4-U2
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 17:51:49 +0000
Received: by mail-lf1-x144.google.com with SMTP id f23so14178696lfc.13
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 09:51:48 -0800 (PST)
In-Reply-To: <46211378-e63d-86bb-6ce9-d739b986b777@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi4xMi4xOCAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgoKPiBQbGVhc2UgZG9uJ3Qg
YWRkIGEgcmV2aWV3ZWQtYnkgdGFnIHVudGlsIGl0IHdhcyBleHBsaWNpdGx5IHdyaXR0ZW4gYnkg
dGhlIHJldmlld2VyLgpNeSBiYWQsIEkgbWl4ZWQgaXQgd2l0aCAjNS4KCgotLSAKU2luY2VyZWx5
LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
