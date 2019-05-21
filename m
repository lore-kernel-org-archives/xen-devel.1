From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH MM-PART2 RESEND v2 03/19] xen/arm:
 processor: Use BIT(.., UL) instead of _AC(1, U) in SCTLR_ defines
Date: Tue, 21 May 2019 13:01:18 +0300
Message-ID: <35041df1-0c11-e5a0-037c-c26b2737e8d3@gmail.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-4-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wdSZ=TV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hT1aF-0003A8-52
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:01:23 +0000
Received: by mail-lf1-x144.google.com with SMTP id u27so12584039lfg.10
 for <xen-devel@lists.xenproject.org>; Tue, 21 May 2019 03:01:22 -0700 (PDT)
In-Reply-To: <20190514122456.28559-4-julien.grall@arm.com>
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNC4wNS4xOSAxNToyNCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFVzZSB0aGUgcGF0dGVy
biBCSVQoLi4uLCBVTCkgdG8gbWFrZSB0aGUgY29kZSBtb3JlIHJlYWRhYmxlLiBOb3RlIHRoYXQK
PiB1bnNpZ25lZCBsb25nIGlzIHVzZWQgaW5zdGVhZCBvZiB1bnNpZ25lZCBiZWNhdXNlIFNDVExS
IGlzIHRlY2huaWNhbGx5Cj4gMzItYml0IG9uIEFybTMyIGFuZCA2NC1iaXQgb24gQXJtNjQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJl
dmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNp
bmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
