From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 18/20] xen/arm: mm: Check start is always
 before end in {destroy, modify}_xen_mappings
Date: Fri, 3 May 2019 18:59:05 +0300
Message-ID: <ee9c1522-d7b7-8bb2-e810-61ce5334d279@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-19-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaae-0007vr-2f
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:59:12 +0000
Received: by mail-lf1-x141.google.com with SMTP id q23so1016825lfc.12
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:59:10 -0700 (PDT)
In-Reply-To: <20190422164937.21350-19-julien.grall@arm.com>
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSB0d28gaGVscGVy
cyB7ZGVzdHJveSwgbW9kaWZ5fV94ZW5fbWFwcGluZ3MgZG9uJ3QgY2hlY2sgdGhhdCB0aGUKPiBz
dGFydCBpcyBhbHdheXMgYmVmb3JlIHRoZSBlbmQuIFRoaXMgc2hvdWxkIG5ldmVyIGhhcHBlbiBi
dXQgaWYgaXQKPiBoYXBwZW5zLCBpdCB3aWxsIHJlc3VsdCB0byB1bmV4cGVjdGVkIGJlaGF2aW9y
Lgo+IAo+IENhdGNoIHN1Y2ggaXNzdWVzIGVhcmxpZXIgb24gYnkgYWRkaW5nIGFuIEFTU0VSVCBp
biBkZXN0cm95X3hlbl9tYXBwaW5ncwo+IGFuZCBtb2RpZnlfeGVuX21hcHBpbmdzLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgoKUmV2aWV3
ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2Vy
ZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
