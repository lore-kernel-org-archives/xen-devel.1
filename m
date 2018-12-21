From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12 5/8] xen/arm: p2m: Only use isb()
 when it is necessary
Date: Fri, 21 Dec 2018 16:36:38 +0200
Message-ID: <1d5751f9-4138-7f7e-b1c5-ba17ef0c398b@gmail.com>
References: <20181128164939.8329-1-julien.grall@arm.com>
 <20181128164939.8329-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/5Gq=O6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gaLus-0001ol-KN
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 14:36:42 +0000
Received: by mail-lj1-x241.google.com with SMTP id k15-v6so4921350ljc.8
 for <xen-devel@lists.xenproject.org>; Fri, 21 Dec 2018 06:36:41 -0800 (PST)
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

CgpPbiAyOC4xMS4xOCAxODo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBFTDEgdHJhbnNs
YXRpb24gcmVnaW1lIGlzIG91dC1vZi1jb250ZXh0IHdoZW4gcnVubmluZyBhdCBFTDIuIFRoaXMK
PiBtZWFucyB0aGUgcHJvY2Vzc29yIGNhbm5vdCBzcGVjdWxhdGUgbWVtb3J5IGFjY2Vzc2VzIHVz
aW5nIHRoZSByZWdpc3RlcnMKPiBhc3NvY2lhdGVkIHRvIHRoYXQgcmVnaW1lLgo+IAo+IEFuIGlz
YigpIGlzIG9ubHkgbmVlZCBpZiBYZW4gaXMgZ29pbmcgdG8gdXNlIHRoZSB0cmFuc2xhdGlvbiBy
ZWdpbWUKPiBiZWZvcmUgcmV0dXJuaW5nIHRvIHRoZSBndWVzdCAoZXhjZXB0aW9uIHJldHVybnMg
d2lsbCBzeW5jaHJvbml6ZWQgdGhlCj4gY29udGV4dCkuCj4gCj4gUmVtb3ZlIHVuZWNlc3Nhcnkg
aXNiKCkgYW5kIGRvY3VtZW50IHRoZSBvbmVzIGxlZnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCgpSZXZpZXdlZC1ieTogQW5kcmlpIEFu
aXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlz
b3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
