From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 19/20] xen/arm: Pair call to set_fixmap with
 call to clear_fixmap in copy_from_paddr
Date: Fri, 3 May 2019 18:59:08 +0300
Message-ID: <c090be90-3ad1-a2f3-0901-fcae8776a63d@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-20-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaaf-0007we-CN
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:59:13 +0000
Received: by mail-lj1-x244.google.com with SMTP id h21so5608841ljk.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:59:12 -0700 (PDT)
In-Reply-To: <20190422164937.21350-20-julien.grall@arm.com>
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHNldF9maXhtYXAgbWF5IHJlcGxhY2UgYSB2YWxpZCBlbnRyeSB3aXRob3V0IGZvbGxvd2luZwo+
IHRoZSBicmVhay1iZWZvcmUtbWFrZSBzZXF1ZW5jZS4gVGhpcyBtYXkgcmVzdWx0IHRvIFRMQiBj
b25mbGljdCBhYm9ydC4KPiAKPiBSYXRoZXIgdGhhbiBkZWFsaW5nIHdpdGggQnJlYWstQmVmb3Jl
LU1ha2UgaW4gc2V0X2ZpeG1hcCwgZXZlcnkgY2FsbCB0bwo+IHNldF9maXhtYXAgaXMgcGFpcmVk
IHdpdGggYSBjYWxsIHRvIGNsZWFyX2ZpeG1hcC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
