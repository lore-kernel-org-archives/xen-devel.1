From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
Date: Thu, 25 Apr 2019 21:00:59 +0300
Message-ID: <9462a961-0ed5-8aa3-46cb-3b2b0c3c6b1d@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJigB-00067T-6X
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:01:03 +0000
Received: by mail-lj1-x244.google.com with SMTP id q66so454112ljq.7
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:01:02 -0700 (PDT)
In-Reply-To: <20190417175815.16905-5-julien.grall@arm.com>
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

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE5vdyB0aGF0IHdlIGRy
b3BwZWQgZmx1c2hfeGVuX3RleHRfdGxiX2xvY2FsKCksIHdlIGhhdmUgb25seSBvbmUgc2V0IG9m
Cj4gaGVscGVycyBhY3Rpbmcgb24gWGVuIFRMQnMuIFRoZXJlIG5hbWluZyBhcmUgcXVpdGUgY29u
ZnVzaW5nIGJlY2F1c2UgdGhlCj4gVExCIGluc3RydWN0aW9ucyB1c2VkIHdpbGwgYWN0IG9uIGJv
dGggRGF0YSBhbmQgSW5zdHJ1Y3Rpb24gVExCcy4KPiAKPiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0
byByZXdvcmsgdGhlIGRvY3VtZW50YXRpb24gdGhhdCBjYW4gYmUgY29uZnVzaW5nCj4gdG8gcmVh
ZCBhcyB0aGV5IGRvbid0IG1hdGNoIHRoZSBpbXBsZW1lbnRhdGlvbi4KPiAKPiBMYXN0bHksIHN3
aXRjaCBmcm9tIHVuc2lnbmVkIGxvbnQgdG8gdmFkZHJfdCBhcyB0aGUgZnVuY3Rpb24gdGVjaG5p
Y2FsbHkKPiBkZWFsIHdpdGggdmlydHVhbCBhZGRyZXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogQW5kcmlpIEFu
aXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
