From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 11/12] xen/arm: mm: Don't open-code Xen PT
 update in {set, clear}_fixmap()
Date: Mon, 6 May 2019 15:49:08 +0300
Message-ID: <be9f8a35-8747-5934-eb81-63549b2478c1@gmail.com>
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-12-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd3Q-0007m5-Iu
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:49:12 +0000
Received: by mail-lj1-x243.google.com with SMTP id h21so10910733ljk.13
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:49:10 -0700 (PDT)
In-Reply-To: <20190424165955.23718-12-julien.grall@arm.com>
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

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHtzZXQsIGNsZWFyfV9m
aXhtYXAoKSBhcmUgY3VycmVudGx5IG9wZW4tY29kaW5nIHVwZGF0ZSB0byB0aGUgWGVuCj4gcGFn
ZS10YWJsZXMuIFRoaXMgY2FuIGJlIGF2b2lkZWQgYnkgdXNpbmcgdGhlIGdlbmVyaWMgaGVscGVy
cwo+IG1hcF9wYWdlc190b194ZW4oKSBhbmQgZGVzdHJveV94ZW5fbWFwcGluZ3MoKS4KPiAKPiBC
b3RoIGZ1bmN0aW9uIGFyZSBub3QgbWVhbnQgdG8gZmFpbCBmb3IgZml4bWFwLCBoZW5jZSB0aGUg
QlVHX09OKCkKPiBjaGVja2luZyB0aGUgcmV0dXJuLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogQW5kcmlp
IEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBB
bmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
