From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 5/8] xen/arm: p2m: Only use isb()
 when it is necessary
Date: Fri, 21 Dec 2018 16:43:22 +0200
Message-ID: <f05481f4-d9c2-15be-ca3f-043ad2a9bb92@gmail.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaM1O-0002ni-Rx
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 14:43:26 +0000
Received: by mail-lf1-x144.google.com with SMTP id b20so4051048lfa.12
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 06:43:25 -0800 (PST)
In-Reply-To: <20181128164939.8329-6-julien.grall@arm.com>
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

CgpPbiAyOC4xMS4xOCAxODo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgoKPiAgICAgICBpZiAoICps
YXN0X3ZjcHVfcmFuICE9IElOVkFMSURfVkNQVV9JRCAmJiAqbGFzdF92Y3B1X3JhbiAhPSBuLT52
Y3B1X2lkICkKPiArICAgIHsKPiAgICAgICAgICAgZmx1c2hfdGxiX2xvY2FsKCk7Cj4gKyAgICB9
CkJUVywgbWlzc2VkIG1lbnRpb25pbmcgdGhhdCBjdXJseSBicmFjZXMgYWJvdmUgYXJlIG9kZCBi
eSBjb2Rpbmcgc3R5bGUuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
