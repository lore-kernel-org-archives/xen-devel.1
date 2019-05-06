From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 05/12] xen/arm: mm: Only increment mfn when
 valid in xen_pt_update
Date: Mon, 6 May 2019 15:48:23 +0300
Message-ID: <fdea6024-d7e1-9233-43b8-4c09a54161e9@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-6-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2h-0007OD-NL
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:27 +0000
Received: by mail-lf1-x144.google.com with SMTP id k18so9023427lfj.13
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:26 -0700 (PDT)
In-Reply-To: <20190424165955.23718-6-julien.grall@arm.com>
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEN1cnJlbnRseSwgdGhl
IE1GTiB3aWxsIGJlIGluY3JlbWVudGVkIGV2ZW4gaWYgaXQgaXMgaW52YWxpZC4gVGhpcyB3aWxs
Cj4gcmVzdWx0IHRvIGhhdmUgYSB2YWxpZCBNRk4gYWZ0ZXIgdGhlIGZpcnN0IGl0ZXJhdGlvbi4K
PiAKPiBXaGlsZSB0aGlzIGlzIG5vdCBhIG1ham9yIHByb2JsZW0gdG9kYXksIHRoaXMgd2lsbCBi
ZSBpbiB0aGUgZnV0dXJlIGlmCj4gdGhlIGNvZGUgZXhwZWN0IGFuIGludmFsaWQgTUZOIGF0IGV2
ZXJ5IGl0ZXJhdGlvbi4KPiAKPiBTdWNoIGJlaGF2aW9yIGlzIHByZXZlbnRlZCBieSBhdm9pZGlu
ZyB0byBpbmNyZW1lbnQgYW4gaW52YWxpZCBNRk4uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyaWkgQW5pc292
IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
