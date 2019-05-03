From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 17/20] xen/arm: mm: Initialize page-tables
 earlier
Date: Fri, 3 May 2019 18:59:03 +0300
Message-ID: <fb08d22e-e139-a472-8bca-c1c3a1f4382a@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-18-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaaa-0007tZ-LZ
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:59:08 +0000
Received: by mail-lf1-x142.google.com with SMTP id o16so4758499lfl.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:59:07 -0700 (PDT)
In-Reply-To: <20190422164937.21350-18-julien.grall@arm.com>
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFNpbmNlIGNvbW1pdCBm
NjA2NThjNmFlICJ4ZW4vYXJtOiBTdG9wIHJlbG9jYXRpbmcgWGVuIiwgdGhlIGZ1bmN0aW9uCj4g
c2V0dXBfcGFnZV90YWJsZXMoKSBkb2VzIG5vdCByZXF1aXJlIGFueSBpbmZvcm1hdGlvbiBmcm9t
IHRoZSBGRFQuCj4gCj4gU28gdGhlIGluaXRpYWxpemF0aW9uIG9mIHRoZSBwYWdlLXRhYmxlcyBj
YW4gYmUgZG9uZSBtdWNoIGVhcmxpZXIgaW4gdGhlCj4gYm9vdCBwcm9jZXNzLiBUaGUgZWFybGll
c3Qgc2V0dXBfcGFnZV90YWJsZXMoKSBjYW4gYmUgY2FsbGVkIGlzIGFmdGVyCj4gdHJhcHMgaGF2
ZSBiZWVuIGluaXRpYWxpemVkLCBzbyB3ZSBjYW4gZ2V0IGJhY2t0cmFjZSBpZiBhbiBlcnJvcgo+
IG9jY3VycmVkLgo+IAo+IE1vdmluZyB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlIHBhZ2UtdGFi
bGVzIGFsc28gYXZvaWQgdGhlIGRhbmNlIHRvIG1hcAo+IHRoZSBGRFQgYWdhaW4gaW4gdGhlIG5l
dyBzZXQgb2YgcGFnZS10YWJsZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlf
YW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
