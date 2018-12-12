From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [RFC 11/16] irq: skip action avalability check for
 guest's IRQ
Date: Wed, 12 Dec 2018 13:30:14 +0200
Message-ID: <c7678ede-86c5-f742-e749-acc4841d7481@gmail.com>
References: <1543440731-21947-1-git-send-email-andrii.anisov@gmail.com>
 <1543440731-21947-12-git-send-email-andrii.anisov@gmail.com>
 <3be90d82-cdcd-b3d5-c734-6da90ecd7344@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X41P=OV=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gX2ia-0003jV-Oj
 for xen-devel@lists.xenproject.org; Wed, 12 Dec 2018 11:30:20 +0000
Received: by mail-lf1-x144.google.com with SMTP id p86so13250658lfg.5
 for <xen-devel@lists.xenproject.org>; Wed, 12 Dec 2018 03:30:18 -0800 (PST)
In-Reply-To: <3be90d82-cdcd-b3d5-c734-6da90ecd7344@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS4xMi4xOCAxNjo0OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFuZCB5b3UgY2FuJ3Qg
c2VlIGFueSBwb3RlbnRpYWwgcmFjZSBpbiB0aGF0IGNvZGUgaGFwcGVuaW5nIGluIHRoZSBmdXR1
cmU/Ckl0IGlzIHByb3RlY3RlZCB3aXRoIGBkZXNjLT5sb2NrYCBzbyBmYXIuIElmIG9uZSBkZWNp
ZGVkIHRvIGdldCBpdCBmcm9tIHVuZGVyIHRoZSBsb2NrLCB0aGUgcmFjZSBpcyBwb3NzaWJsZSB3
aXRoIGByZWxlYXNlX2lycSgpYC4KCj4+IEFsc28gZ2V0dGluZyBhbiB1bmtub3duCj4+IGludGVy
cnVwdCBpcyB2ZXJ5IHVubGlrZWx5IG9uIGEgbm9uLWRlYnVnIHBsYXRmb3JtLgo+IAo+IEkgYW0g
dGVtcHRlZCB0byBrZWVwIHRoZSBjb2RlIGF0IHRoZSBzYW1lIHBsYWNlIGJ1dCBwcm90ZWN0IHdp
dGggYW4gI2lmbmRlZiBOREVCVUcuIFdoYXQgZG8geW91IHRoaW5rPwpXZWxsLCBJIHRoaW5rIGFi
b3V0IGEgY29ycmVzcG9uZGVudCBBU1NFUlQgZm9yIHRoZSBndWVzdCBJUlEuIExpa2UgZm9sbG93
aW5nOgoKPj4gwqDCoMKgwqDCoCBpZiAoIHRlc3RfYml0KF9JUlFfR1VFU1QsICZkZXNjLT5zdGF0
dXMpICkKPj4gwqDCoMKgwqDCoCB7Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpcnFfZ3Vl
c3QgKmluZm8gPSBpcnFfZ2V0X2d1ZXN0X2luZm8oZGVzYyk7CisgICAgICAgICAgICBBU1NFUlQo
IGRlc2MtPmFjdGlvbiAhPSBOVUxMICk7CgpXaGF0IHdvdWxkIHlvdSBwcmVmZXI/CgotLSAKU2lu
Y2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
