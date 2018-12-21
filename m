From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 4/8] xen/arm: domain_build: Don't
 switch to the guest P2M when copying data
Date: Fri, 21 Dec 2018 17:16:14 +0200
Message-ID: <5fa2db09-2f6a-a1e1-243d-9304a1762ac3@gmail.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-5-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaMXD-000668-65
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 15:16:19 +0000
Received: by mail-lf1-x144.google.com with SMTP id u18so4138415lff.10
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 07:16:18 -0800 (PST)
Received: from [10.17.180.104] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id c2-v6sm4663168ljj.41.2018.12.21.07.16.14
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Dec 2018 07:16:14 -0800 (PST)
In-Reply-To: <20181128164939.8329-5-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOC4xMS4xOCAxODo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFVudGlsIHJlY2VudGx5
LCBrZXJuZWwvaW5pdHJkL2R0YiB3ZXJlIGxvYWRlZCB1c2luZyBndWVzdCBWQSBhbmQKPiB0aGVy
ZWZvcmUgcmVxdWlyaW5nIHRvIHJlc3RvcmUgdGVtcG9yYXJpbHkgdGhlIFAyTS4gVGhpcyByZXdv
cmtlZCBpbiBhCj4gc2VyaWVzIG9mIGNvbW1pdHMgKHVwIHRvIDkyOTIwODYgInhlbi9hcm06IGRv
bWFpbl9idWlsZDogVXNlCj4gY29weV90b19ndWVzdF9waHlzX2ZsdXNoX2RjYWNoZSBpbiBkdGJf
bG9hZCIpIHRvIHVzZSBhIGd1ZXN0IFBBLgo+IAo+IFRoaXMgd2lsbCBhbHNvIGhlbHAgYSBmb2xs
b3ctdXAgcGF0Y2ggd2hpY2ggd2lsbCByZXF1aXJlCj4gcDJtX3tzYXZlLHJlc3RvcmV9X3N0YXRl
IHRvIHdvcmsgaW4gcGFpciB0byB3b3JrYXJvdW5kIGFuIGVycmF0dW0uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBB
bmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5k
cmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
