From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 15/20] xen/arm: mm: Use the shorter version
 __aligned(PAGE_SIZE) to align page-tables
Date: Fri, 3 May 2019 18:58:53 +0300
Message-ID: <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-16-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaaP-0007nV-9G
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:58:57 +0000
Received: by mail-lf1-x143.google.com with SMTP id j20so4788712lfh.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:58:56 -0700 (PDT)
In-Reply-To: <20190422164937.21350-16-julien.grall@arm.com>
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdlIGN1cnJlbnRseSB1
c2UgdGhlIHZlcnkgbG9uZyB2ZXJzaW9uIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZCg0MDk2KSkp
Cj4gdG8gYWxpZ24gcGFnZS10YWJsZXMuIFRoYW5rZnVsbHkgdGhlcmUgaXMgYSBzaG9ydGVyIHZl
cnNpb24gdG8gbWFrZQoKSU1PIGl0IGlzIGJldHRlciB0byBjaGFuZ2UgYHZlcnNpb25gIHRvIGBt
YWNyb2AuIEluIG9yZGVyIHRvIHNwZWNpZnkgaXQgaXMgbm90IGEgY29tcGlsZXIgc3BlY2lmaWMg
YnV0IHNwZWNpZmljIHRvIFhFTi4KCj4gdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4KPiAKPiBXaGls
ZSBtb2RpZnlpbmcgdGhlIGF0dHJpYnV0ZToKPiAgICAgIDEpIE1vdmUgaXQgYmVmb3JlIHRoZSB2
YXJpYWJsZSBuYW1lIGFzIHdlIGRvIGluIG90aGVyIHBhcnQgb2YgWGVuCj4gICAgICAyKSBTd2l0
Y2ggdG8gUEFHRV9TSVpFIGluc3RlYWQgb2YgNDA5NiB0byBtYWtlIG1vcmUgZnV0dXJlLXByb29m
Cj4gICAgICAzKSBNYXJrIHN0YXRpYyBwYWdlLXRhYmxlcyBub3QgdXNlZCBvdXRzaWRlIHRoZSBm
aWxlIChpLmUgYW55Cj4gICAgICAgICBwYWdlLXRhYmxlcyBvdGhlciB0aGFuIGJvb3RfKiBhbmQg
eGVuX2ZpeG1hcCkuCj4gCj4gTGFzdGx5LCBzb21lIG9mIHRoZSB2YXJpYWJsZXMgdXNlIF9fYXR0
cmlidXRlX18oX19hbGlnbmVkKFggKiA0MDk2KSkuCj4gSG93ZXZlciB0aGlzIGlzIG5vdCBuZWNl
c3NhcnkgYXMgcGFnZS10YWJsZXMgYXJlIG9ubHkgcmVxdWlyZWQgdG8gYmUKPiB0byBiZSBhbGln
bmVkIHRvIGEgcGFnZS1zaXplLiBTbyB1c2UgX19hbGlnbmVkKFBBR0VfU0laRSkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KVGhvdWdoOgoK
UmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAK
U2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
